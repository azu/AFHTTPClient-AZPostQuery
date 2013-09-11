# AFHTTPClient+AZPostQuery

AFNetworking category for building request using query and post data.

* [AFNetworking/AFNetworking](https://github.com/AFNetworking/AFNetworking "AFNetworking/AFNetworking")

## Installation

``` ruby
pod 'AFHTTPClient-AZPostQuery', :git => 'https://github.com/azu/AFHTTPClient-AZPostQuery.git'
```

## Usage

``` objc
/**
 Creates an `AFHTTPRequestOperati
 on` with a `POST` request, and enqueues it to the HTTP client's operation queue.

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
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT