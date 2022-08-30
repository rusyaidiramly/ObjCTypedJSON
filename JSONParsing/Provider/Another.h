//
//  Another.h
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 29/08/2022.
//

#import "JSONModel.h"
@class SubAnother;

NS_ASSUME_NONNULL_BEGIN

@interface Another : JSONModel
@property (readonly) NSString *name;
@property (readonly) SubAnother *subA;

@end

NS_ASSUME_NONNULL_END
