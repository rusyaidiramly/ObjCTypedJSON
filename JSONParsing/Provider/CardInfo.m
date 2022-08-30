//
//  CardStatusResult.m
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 26/08/2022.
//

#import "CardInfo.h"

@implementation CardInfo

+ (NSString *)jsonKeyForProperty:(NSString *)propName {
    NSDictionary *mapping = @{
        @"cardNo" : @"data.cardNo",
        @"cardHolderNm" : @"data.cardHolderName",
        @"cardType" : @"data.cardType",
        @"cardLimit" :  @"data.cardLimit",
        @"cardStatus" : @"data.cardStatus",
        @"cardReplaceStatus" : @"data.newRplInd",
        @"avlCrdLimit" : @"data.availableCrdLmt",
        @"prodId" : @"data.productId",
        @"cardExp" : @"data.cardExpDate",
        @"kycStatus" : @"data.kycStatus",
        @"kycSubmitStatus" : @"data.allow_resubmission",
    };
    return mapping[propName] ?: [super jsonKeyForProperty:propName];
}

@end
