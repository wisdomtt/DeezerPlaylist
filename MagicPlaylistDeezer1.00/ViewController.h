//
//  ViewController.h
//  MagicPlaylistDeezer1.00
//
//  Created by Curtis Mason on 11/14/15.
//  Copyright © 2015 Curtis Mason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *InsertField;
@end
NSMutableData *actualdata;
NSDictionary *array;
NSDictionary *jsonArray;
@interface NSDictionary (BVJSONString)
@end


