//
// Created by azu on 2013/09/11.
//


#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface AFHTTPClient (AZPostQuery)
/**
 Creates an `AFHTTPRequestOperation` with a `POST` request, and enqueues it to the HTTP client's operation queue.

 @param path The path to be appended to the HTTP client's base URL and used as the request URL.
 @param query The query to be be appended as a query string  to path.
 @param body The body to be encoded and set in the request HTTP body.<NSArray or NSDictionary>
 @param success A block object to be executed when the request operation finishes successfully. This block has no return value and takes two arguments: the created request operation and the object created from the response data of request.
 @param failure A block object to be executed when the request operation finishes unsuccessfully, or that finishes successfully, but encountered an error while parsing the response data. This block has no return value and takes two arguments: the created request operation and the `NSError` object describing the network or parsing error that occurred.

 */
- (void)postPath:(NSString *) path
           query:(NSDictionary *) query
            body:(id) body
         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject)) success
         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error)) failure;

- (NSURLRequest *)requestWithMethod:(NSString *) method path:(NSString *) path query:(NSDictionary *) query body:(id) body;
@end