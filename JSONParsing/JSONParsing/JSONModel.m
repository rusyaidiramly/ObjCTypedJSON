//
//  JSONModel.m
//
//  Created by Nick Randall on 2/8/20.
//  Copyright © 2020 Nick Randall. All rights reserved.
//

#import "JSONModel.h"
#import "NSObject+Introspection.h"
#import "ClassProperty.h"
#import "TypeEncoding.h"

@interface JSONModel ()
@property NSMutableArray *log;
@property NSArray<ClassProperty *> *props;
@end

@implementation JSONModel

+ (instancetype)parsedFromJSON:(id)jsonObj addProps:(nullable NSArray<ClassProperty *> *)addProps {
    
    NSDictionary *jsonDict;
    
    if ([jsonObj isKindOfClass:NSData.class]) {
        NSError *err;
        jsonDict = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonObj options:NSJSONReadingMutableContainers error:&err];
        if (err == nil) return nil;
        
    } else if ([jsonObj isKindOfClass:NSDictionary.class]) {
        jsonDict = (NSDictionary *)jsonObj;
        
    } else {
        return nil;
    }

    // Create a new instance of the subclass to fill in
    JSONModel *obj = [self new];
    obj.log = [[NSMutableArray alloc] init];

    // Introspect our properties
    obj.props = [self classProperties];
    if (addProps != nil) obj.props = [obj.props arrayByAddingObjectsFromArray:addProps];

    for (ClassProperty *prop in obj.props) {
        NSString *jsonKey = [self jsonKeyForProperty:prop.name];
        id jsonVal = [jsonDict valueForKeyPath:jsonKey];
        
        if (jsonVal == nil) {
            NSString *log = [NSString stringWithFormat:@"%s: %s No value found for %@", class_getName(self), __PRETTY_FUNCTION__, prop.name];
            [obj.log addObject:log];
            NSLog(@"%@", log);
//            return nil; ///strict checking, will return nil if one of the properties is nil
            continue;
        }
        
        if (prop.type.classType && [jsonVal isKindOfClass:prop.type.classType]) {
            NSString *log = [NSString stringWithFormat:@"%s: %s Value for %@ initialized to %@", class_getName(self), __PRETTY_FUNCTION__, prop.name, jsonVal];
            [obj.log addObject:log];
            [obj setValue:jsonVal forKey:prop.name];

        } else if ((prop.type.isIntType || prop.type.isFloatType)
                   && [jsonVal isKindOfClass:NSNumber.class]) {
            NSString *log = [NSString stringWithFormat:@"%s: %s Value for %@ initialized to %@", class_getName(self), __PRETTY_FUNCTION__, prop.name, jsonVal];
            [obj.log addObject:log];
            [obj setValue:jsonVal forKey:prop.name];

        } else if ([prop.type.classType respondsToSelector:NSSelectorFromString(@"parsedFromJSON:addProps:")] && [jsonVal isKindOfClass:NSDictionary.class]) {
            SEL parsedFromJSON = NSSelectorFromString(@"parsedFromJSON:addProps:");
            IMP imp1 = [prop.type.classType methodForSelector:parsedFromJSON];
            id (*func1)(id, SEL, id, id) = (void *)imp1;
            
            id subObj = func1(prop.type.classType, parsedFromJSON, jsonVal, nil);
            
            NSString *log = @"";
            
            if (subObj) {
                [obj setValue:subObj forKey:prop.name];
                
                log = [NSString stringWithFormat:@"%s: %s Value for %@ initialized to %@ instance", class_getName(self), __PRETTY_FUNCTION__, prop.name, [NSString stringWithFormat:@"%@", prop.type.classType]];
                
            } else {
                log = [NSString stringWithFormat:@"%s: %s Failed to instantiate %@ object for %@", class_getName(self), __PRETTY_FUNCTION__, [NSString stringWithFormat:@"%@", prop.type.classType], prop.name];
            }
            
            [obj.log addObject:log];
            
            
        } else {
            NSString *log = [NSString stringWithFormat:@"%s: %s Couldn't load value for %@", class_getName(self), __PRETTY_FUNCTION__, prop.name];
            [obj.log addObject:log];
            NSLog(@"%s: Couldn't load value for %@", class_getName(self), prop.name);
        }
    }
    
    return obj;
}

- (NSArray *)getLog {
    return _log.copy;
}

+ (NSString *)jsonKeyForProperty:(NSString *)propName {
    return propName;
}

- (BOOL)newObject:(id)obj forProp:(NSString *)propName {
    
    if (obj == nil) {
        NSString *log = [NSString stringWithFormat:@"%s: %s nil passed for %@", class_getName(self.class), __PRETTY_FUNCTION__, propName];
        [self.log addObject:log];
        NSLog(@"%@", log);
        return NO;
    }
    
    for (ClassProperty *prop in self.props) {
        
        if ([prop.name isEqualToString:propName]) {
            if (prop.type.classType && [obj isKindOfClass:prop.type.classType]) {
                NSString *log = [NSString stringWithFormat:@"%s: %s Value for %@ updated. %@ -> %@", class_getName(self.class), __PRETTY_FUNCTION__, prop.name, [self valueForKey:prop.name], obj];
                [self.log addObject:log];
                [self setValue:obj forKey:prop.name];
                return YES;

            } else if ((prop.type.isIntType || prop.type.isFloatType)
                       && [obj isKindOfClass:NSNumber.class]) {
                NSString *log = [NSString stringWithFormat:@"%s: %s Value for %@ updated. %@ -> %@", class_getName(self.class), __PRETTY_FUNCTION__, prop.name, [self valueForKey:prop.name], obj];
                [self.log addObject:log];
                [self setValue:obj forKey:prop.name];
                return YES;;

            } else {
                NSString *log = [NSString stringWithFormat:@"%s: %s Object type doesn't match for %@", class_getName(self.class), __PRETTY_FUNCTION__, prop.name];
                [self.log addObject:log];
                NSLog(@"%@", log);
                return NO;
                
            }
        }
    }
    
    NSString *log = [NSString stringWithFormat:@"%s: %s Property %@ doesn't exist", class_getName(self.class), __PRETTY_FUNCTION__, propName];
    [self.log addObject:log];
    return NO;
}

@end
