//
//  Example
//  man
//
//  Created by man 11/11/2018.
//  Copyright © 2020 man. All rights reserved.
//

#import "_HttpModel.h"

@implementation _HttpModel

//default value for @property
- (id)init {
    if (self = [super init])  {
        self.statusCode = @"0";
        self.url = [[NSURL alloc] initWithString:@""];
    }
    return self;
}

- (NSString *) getContentHeader {
    NSString* result = self.url.absoluteString;
    NSString *graphQLName = [_requestHeaderFields objectForKey:@"X-APOLLO-OPERATION-NAME"];

    if (graphQLName != nil && graphQLName.length > 0) {
        NSString *operationType = [_requestHeaderFields objectForKey:@"X-APOLLO-OPERATION-TYPE"];
        if (operationType == nil) {
            operationType = @"query";
        }

        result= [NSString stringWithFormat:@"GraphQL: %@ %@ endpoint: %@", operationType, graphQLName, self.url.absoluteString];
    }
    return result;
}

@end



