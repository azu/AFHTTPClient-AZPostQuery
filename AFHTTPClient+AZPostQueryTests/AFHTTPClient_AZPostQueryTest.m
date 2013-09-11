//
// Created by azu on 2013/09/11.
//


#import <SenTestingKit/SenTestingKit.h>
#import "ExampleClient.h"
#import "AFHTTPClient+AZPostQuery.h"

@interface AFHTTPClient_AZPostQueryTest : SenTestCase
@end

@implementation AFHTTPClient_AZPostQueryTest {
    ExampleClient *client;
}
- (void)setUp {
    [super setUp];
    client = [ExampleClient sharedClient];

}

- (void)testRequestWithMethodArray {
    NSArray *body = @[@"array", @"is", @"pass"];
    NSURLRequest *request = [client requestWithMethod:@"POST" path:@"/path" query:@{
        @"afoo" : @"1",
        @"bar" : @"second"
    } body:body];

    STAssertEqualObjects(request.URL.path, @"/path", @"Path");
    STAssertEqualObjects(request.URL.query, @"afoo=1&bar=second", @"query");
    NSData *expectHTTPBody = [NSJSONSerialization dataWithJSONObject:body options:0 error:NULL];
    STAssertEqualObjects(request.HTTPBody, expectHTTPBody, @"HTTP Boday");
}

- (void)testRequestWithMethodDictionary {
    NSDictionary *body = @{
        @"body" : @[@1, @2, @3],
        @"test" : @"yo"
    };
    NSURLRequest *request = [client requestWithMethod:@"POST" path:@"/path" query:@{
        @"afoo" : @"1",
        @"bar" : @"second"
    } body:body];

    STAssertEqualObjects(request.URL.path, @"/path", @"Path");
    STAssertEqualObjects(request.URL.query, @"afoo=1&bar=second", @"query");
    NSData *expectHTTPBody = [NSJSONSerialization dataWithJSONObject:body options:0 error:NULL];
    STAssertEqualObjects(request.HTTPBody, expectHTTPBody, @"HTTP Boday");
}

@end
