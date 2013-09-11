//
// Created by azu on 2013/09/11.
//


#import "AFHTTPClient+AZPostQuery.h"
#import "ExampleClient.h"
#import "AFJSONRequestOperation.h"


static NSString *const kAPIBaseURLString = @"http://requestb.in/";

@implementation ExampleClient {

}

static ExampleClient *_sharedClient = nil;

+ (instancetype)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURLString]];
    });
    return _sharedClient;
}

- (instancetype)init {
    self = [self initWithBaseURL:[NSURL URLWithString:kAPIBaseURLString]];
    if (self == nil) {
        return nil;
    }
    return self;
}

- (instancetype)initWithBaseURL:(NSURL *) url {
    if (self = [super initWithBaseURL:url]) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setParameterEncoding:AFJSONParameterEncoding];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}
@end