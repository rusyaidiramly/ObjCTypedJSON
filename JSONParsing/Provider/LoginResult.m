//
//  LoginResult.m
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 25/08/2022.
//

#import "LoginResult.h"

@implementation LoginResult

+ (NSString *)jsonKeyForProperty:(NSString *)propName {
    NSDictionary *mapping = @{
        @"doneSetMPIN": @"data.done_set_mpin",
        @"walletStatus": @"wallet_status",
        @"dataDict" : @"data.dict"
    };
    return mapping[propName] ?: [super jsonKeyForProperty:propName];
}

@end
