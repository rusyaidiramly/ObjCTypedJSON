//
//  ResultExtension.m
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 26/08/2022.
//

#import "CommonResult.h"
#import "NSObject+Introspection.h"

@implementation CommonResult

+ (instancetype)parsedFromJSON:(id)jsonObj {
    return [super parsedFromJSON:jsonObj addProps:CommonResult.classProperties];
}

+ (NSString *)jsonKeyForProperty:(NSString *)propName {
    NSDictionary *mapping = @{
        @"breakdownErrors": @"breakdown_errors",
        @"appVersion": @"app_version",
        @"desc" : @"description",
        @"responseCode" : @"response_code"
    };
    return mapping[propName] ?: [super jsonKeyForProperty:propName];
}
@end
