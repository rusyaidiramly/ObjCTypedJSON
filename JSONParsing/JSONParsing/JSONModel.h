//
//  JSONModel.h
//
//  Created by Nick Randall on 2/8/20.
//  Copyright © 2020 Nick Randall. All rights reserved.
//

@import Foundation;
@class ClassProperty;

NS_ASSUME_NONNULL_BEGIN

@interface JSONModel : NSObject

+ (nullable instancetype)parsedFromJSON:(id)jsonObj addProps:(nullable NSArray<ClassProperty *> *)addProps;
- (NSArray *)getLog;

/// Returns the JSON key name for the given property name
+ (NSString *)jsonKeyForProperty:(NSString *)propName;
- (BOOL)newObject:(id)obj forProp:(NSString *)propName;

@end

NS_ASSUME_NONNULL_END
