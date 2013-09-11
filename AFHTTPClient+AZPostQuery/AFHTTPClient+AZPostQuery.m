//
// Created by azu on 2013/09/11.
//


#import "AFHTTPClient+AZPostQuery.h"
#import "AFHTTPRequestOperation.h"


@implementation AFHTTPClient (AZPostQuery)
- (void)postPath:(NSString *) path query:(NSDictionary *) query body:(id) body success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure {
    NSURLRequest *request = [self requestWithMethod:@"POST" path:path query:query body:body];
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    [self enqueueHTTPRequestOperation:operation];
}

- (NSURLRequest *)requestWithMethod:(NSString *) method path:(NSString *) path query:(NSDictionary *) query body:(id) body {
    NSParameterAssert(method);

    if (!path) {
        path = @"";
    }

    NSURL *url = [NSURL URLWithString:path relativeToURL:self.baseURL];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:method];
    [request setAllHTTPHeaderFields:[self performSelector:@selector(defaultHeaders)]];

    if (query) {
        url = [NSURL URLWithString:[[url absoluteString] stringByAppendingFormat:[path rangeOfString:@"?"].location == NSNotFound
                                                                                 ? @"?%@"
                                                                                 : @"&%@", AFQueryStringFromParametersWithEncoding(
            query, self.stringEncoding)]];
        [request setURL:url];
    }
    if (body) {
        NSString *charset = (__bridge NSString *)CFStringConvertEncodingToIANACharSetName(
            CFStringConvertNSStringEncodingToEncoding(self.stringEncoding));
        NSError *error = nil;

        switch (self.parameterEncoding) {
            case AFJSONParameterEncoding:;
                [request setValue:[NSString stringWithFormat:@"application/json; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wassign-enum"
                [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:body options:0 error:&error]];
#pragma clang diagnostic pop
                break;
            case AFPropertyListParameterEncoding:;
                [request setValue:[NSString stringWithFormat:@"application/x-plist; charset=%@", charset] forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:[NSPropertyListSerialization dataWithPropertyList:body format:NSPropertyListXMLFormat_v1_0 options:0 error:&error]];
                break;
            case AFFormURLParameterEncoding:
                break;
        }

        if (error) {
            NSLog(@"%@ %@: %@", [self class], NSStringFromSelector(_cmd), error);
        }
    }
    return request;
}


@end