//
//  CardStatusResult.h
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 26/08/2022.
//

#import "CommonResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardInfo : CommonResult

@property (readonly) NSString *cardNo;
@property (readonly) NSString *cardHolderNm;
@property (readonly) NSString *cardType;
@property (readonly) NSString *cardLimit;
@property (readonly) NSString *cardStatus;
@property (readonly) NSString *cardReplaceStatus;
@property (readonly) NSString *avlCrdLimit;
@property (readonly) NSString *prodId;
@property (readonly) NSString *cardExp;
@property (readonly) NSString *kycStatus;
@property (readonly) NSString *kycSubmitStatus;

@end

NS_ASSUME_NONNULL_END
