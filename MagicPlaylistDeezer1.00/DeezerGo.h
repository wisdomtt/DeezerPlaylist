//
//  DeezerGo.h
//  MagicPlaylistDeezer1.00
//
//  Created by Curtis Mason on 11/14/15.
//  Copyright © 2015 Curtis Mason. All rights reserved.
//

#ifndef DeezerGo_h
#define DeezerGo_h
#import "DeezerConnect.h"
@class DeezUser;

@protocol DeezerSessionConnectionDelegate;
@protocol DeezerSessionRequestDelegate;
@protocol DeezerSessionDelegate <NSObject>
@optional
- (void)deezerDidLogin;
- (void)deezerDidNotLogin:(BOOL)cancelled;
- (void)deezerDidLogout;
@end
@interface DeezerGo : NSObject <DeezerSessionDelegate>;
@property (nonatomic, readonly) DeezerConnect *DeezerGo;

@end


#endif /* DeezerGo_h */
