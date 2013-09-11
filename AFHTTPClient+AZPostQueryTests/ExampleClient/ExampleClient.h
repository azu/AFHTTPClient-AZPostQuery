//
// Created by azu on 2013/09/11.
//


#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"


@interface ExampleClient : AFHTTPClient

+ (instancetype)sharedClient;
@end