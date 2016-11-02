//
//  DeezerGo.m
//  MagicPlaylistDeezer1.00
//
//  Created by Curtis Mason on 11/14/15.
//  Copyright © 2015 Curtis Mason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeezerConnect.h"
#import "DZRRequestManager.h"
#import "DeezerGo.h"
#define kDeezerAppId @"167575"
//-[DeezerConnect initWithAppId:​andDelegate:]

#pragma mark - NSObject
@implementation DeezerGo
@synthesize DeezerGo = _deezerConnect;

- (id)init
{
    _deezerConnect = [[DeezerConnect alloc] initWithAppId:kDeezerAppId andDelegate:self];
    [[DZRRequestManager defaultManager] setDzrConnect:_deezerConnect];

    return self;
}
@end




//deez = [[DeezerConnect alloc] initWithAppId:​167575 andDelegate:self];
