//
//  Prelogin.h
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 26/08/2022.
//

#import "CommonResult.h"
@class Another;

NS_ASSUME_NONNULL_BEGIN

@interface Prelogin : CommonResult

@property (readonly) NSInteger loginAttemptNo;
@property (readonly) NSString *securePhraseImage;
@property (readonly) Another *anotherClass;

@end

NS_ASSUME_NONNULL_END
