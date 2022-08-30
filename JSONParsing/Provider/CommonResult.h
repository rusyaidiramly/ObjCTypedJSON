//
//  ResultExtension.h
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 26/08/2022.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommonResult : JSONModel

///common Response json key
@property (readonly) NSInteger responseCode;
@property (readonly) NSString *desc;
@property (readonly) NSString *appVersion;
@property (readonly) NSString *message;
@property (readonly) NSDictionary *breakdownErrors;

+ (NSString *)jsonKeyForProperty:(NSString *)propName;
+ (instancetype)parsedFromJSON:(id)jsonObj;

@end

NS_ASSUME_NONNULL_END
