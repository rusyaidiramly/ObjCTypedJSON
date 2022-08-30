//
//  LoginResult.h
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 25/08/2022.
//

#import "CommonResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginResult: CommonResult

@property (readonly) BOOL doneSetMPIN;
@property (readonly) NSString *walletStatus;
@property (readonly) NSDictionary *dataDict;

@end

NS_ASSUME_NONNULL_END
