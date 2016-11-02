//
//  Retrieval.m
//  MagicPlaylistDeezer1.00
//
//  Created by Curtis Mason on 11/14/15.
//  Copyright © 2015 Curtis Mason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retrieval.h"
@implementation NSDictionary (BVJSONString)

-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint {
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}
@end