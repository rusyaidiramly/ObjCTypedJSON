//
//  Prelogin.m
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 26/08/2022.
//

#import "Prelogin.h"

@implementation Prelogin

+ (NSString *)jsonKeyForProperty:(NSString *)propName {
    NSDictionary *mapping = @{
        @"securePhraseImage": @"data.securePhraseImage",
        @"loginAttemptNo": @"data.loginAttemptNo"
    };
    return mapping[propName] ?: [super jsonKeyForProperty:propName];
}

@end
