//
//  ViewController.m
//  JsonSaveParsing
//
//  Created by rusyaidi ramly on 30/08/2022.
//

#import "ViewController.h"
#import "LoginResult.h"
#import "Prelogin.h"
#import "ClassProperty.h"
#import "NSObject+Introspection.h"
#import "Another.h"
#import "SubAnother.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *payload = @{
        @"response_code": @2100,
        @"description": @"SUCCESS",
        @"app_version": @"1542021.1219.33",
        @"data": @{
            @"securePhraseImage": @"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPoAAAAyBAMAAACHedvXAAAAG1BMVEXz8/NOTk61tbWLi4tiYmJ3d3egoKDe3t7JyckBeDq1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAB40lEQVRYhe2VQU/CQBCFR6Bsjw5ugSNUjVcQwrmNYjhaIHqtRuK1RuRcEsS/7ZttIZp4MVnCZV8IG7YbvpmdN1MiJycnJycnp5+qccvR/9BlrF+PRr9gqHMkelXg3D4SvcJ61OfAMq8y5DHKqV74Ji/pqzmPO3h0HuuHjNQi1lP8ekolAsv0RC40oy6+zwq6LztBRp6sLVrL8oj48GG2C6+wwWLRzL0i91j2eiYgs1UERkK3nLvHTVpNgGjSBmRDX1zRE5/iVlL1klN9mtXLnKs4ZZ0Odfke+Tf3rqvB3aDvTsWcy7K2PYvQSGKpPkgKjt7RPdDh8E55KjF033q/KxT5rvTejr6ax9LZS3ghxYnFLR4JfWn74ok+8NeTX/R6OVcUNnUOC3BBR6CpbTp9ggH6bDAYjAy9y/r5QqaaD3yEbrgLTd033LAOJ3pHZv0yLaEnaDPPzFTV57Yn3SZ194vrt66EO12O9vQY3jopJrrHjZpkLOA1CmRb3nWGeuY1Dr7UNtrljpK3aXYFn5nc4Y0cqV+HYZjbpYuldDFdMWGELjbTpt+hyHjQxMfF7LNOn4il9vSlzPWSrnNpyeDtQHR/YV5kGK9mFboa8gMlbdrOzdvvPQ5S70B0JycnJycnp3/oG399UaUBhL9mAAAAAElFTkSuQmCC",
            @"loginAttemptNo": @43078
        },
        @"message": @"Secure Phrase Image",
        @"breakdown_errors": @{},
        @"anotherClass": @{@"name" : @"Hello",
                           @"subA" : @{@"title": @"hero"}
        },
    };

    Prelogin *result = [Prelogin parsedFromJSON:payload];
    [result.anotherClass newObject:@"Hola" forProp:@"name"];
    
    NSLog(@"result %@", result.getLog);
    NSLog(@"result.anotherClass %@", result.anotherClass.getLog);
    NSLog(@"result.anotherClass.subA %@", result.anotherClass.subA.getLog);
    
}


@end
