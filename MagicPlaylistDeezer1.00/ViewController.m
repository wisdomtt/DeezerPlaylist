//
//  ViewController.m
//  MagicPlaylistDeezer1.00
//
//  Created by Curtis Mason on 11/14/15.
//  Copyright © 2015 Curtis Mason. All rights reserved.
//
#import "ViewController.h"
#import "DZRTrack.h"
#import "DZRNetworkRequest.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Song;
@property (weak, nonatomic) IBOutlet UILabel *Author;
@property (weak, nonatomic) IBOutlet UILabel *Album;
@property (weak, nonatomic) IBOutlet UILabel *Song2;
@property (weak, nonatomic) IBOutlet UILabel *Author2;
@property (weak, nonatomic) IBOutlet UILabel *Album2;
@property (weak, nonatomic) IBOutlet UILabel *Song3;
@property (weak, nonatomic) IBOutlet UILabel *Author3;
@property (weak, nonatomic) IBOutlet UILabel *Album3;
@property (weak, nonatomic) IBOutlet UILabel *Song4;
@property (weak, nonatomic) IBOutlet UILabel *Song5;
@property (weak, nonatomic) IBOutlet UILabel *Song6;
@property (weak, nonatomic) IBOutlet UILabel *Song7;
@property (weak, nonatomic) IBOutlet UILabel *Song8;
@property (weak, nonatomic) IBOutlet UILabel *Author4;
@property (weak, nonatomic) IBOutlet UILabel *Author5;
@property (weak, nonatomic) IBOutlet UILabel *Author6;
@property (weak, nonatomic) IBOutlet UILabel *Author7;
@property (weak, nonatomic) IBOutlet UILabel *Author8;
@property (weak, nonatomic) IBOutlet UILabel *Album4;
@property (weak, nonatomic) IBOutlet UILabel *Album5;
@property (weak, nonatomic) IBOutlet UILabel *Album6;
@property (weak, nonatomic) IBOutlet UILabel *Album7;
@property (weak, nonatomic) IBOutlet UILabel *Album8;



-(NSString *)getSearchUrlFor:(NSString *)title;
@end
 NSDictionary *dict;

NSString *URL3rd;
NSString *URL2nd;
NSString *pSongname;
DZRJSONPostRequest *sendable;
@implementation ViewController
NSString *psSong;
NSString *Artist;
NSString *Album;





-(NSString*)getSearchUrlFor:(NSString*)title {
    NSString* url = [NSString stringWithFormat:@"https://api.deezer.com/search?q=%@", [title stringByReplacingOccurrencesOfString:@" " withString:@"+"]];
   // NSLog(@"url for title \"%@\" is %@", title, url);
    return url;
}

-(NSString*)GetSimilar:(NSString*)ArtistID{
    
    //note, add songname to query on the url
    URL3rd = [NSString stringWithFormat:@"https://api.deezer.com/artist/%@/related", ArtistID];
   // NSLog(@"LOOK AT %@", URL3rd);
    //NSLog(@"ARTIST ID %@", ArtistID);

    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSU   RL URLWithString:url]];
    //NSLog(@"This is your URL: %@", URL3rd);
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:URL3rd]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //NSLog(@"error: %@", error);
                NSString* myString;
                myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSError *parseError = nil;
                //NSLog(@"YOUR STRING IZ %@", myString);
                // NSLog(@"WORKZ");
                //NSLog(@"PROBLEM HERE %@", error);
                NSDictionary *x = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
                // NSLog(@"ERROR REPORT ERROR REPORT %@", parseError);
                
                // TODO: check to ensure the item exist
                //NSLog(@">> %@", x);
                //  NSLog(@"%@ <<< :)", [[x valueForKey:@"data"][0] valueForKey:@"title"]);
                //  [self Record2:<#(NSString *)#> author:<#(NSString *)#> alb:<#(NSString *)#>]
                //                NSLog(@"%@",[[[x valueForKey:@"tracks"][0] valueForKey:@"data"] valueForKey:@"title"]);
                //                NSLog(@"%@",[x valueForKey:@"title"][0]) ;
                //                NSLog(@"%@", [[x valueForKey:@"artist"][0] valueForKey:@"name"]);
                // NSLog(@" You Foun %@", [[[x valueForKey:@"tracks"] valueForKey:@"data"][0] valueForKey:@"title"]);
                // NSLog(@" You Second %@", [[[x valueForKey:@"tracks"][0]  valueForKey:@"data"]valueForKey:@"title"]);
               // -(NSString*)GetArtistWithName:(NSString*)name Type:(int*)type{
                [self GetArtistWithName:[[x valueForKey:@"data"][0] valueForKey:@"name"] Type:0];
                [self GetArtistWithName:[[x valueForKey:@"data"][1] valueForKey:@"name"] Type:1];
                [self GetArtistWithName:[[x valueForKey:@"data"][2] valueForKey:@"name"] Type:2];
                [self GetArtistWithName:[[x valueForKey:@"data"][3] valueForKey:@"name"] Type:3];
                [self GetArtistWithName:[[x valueForKey:@"data"][4] valueForKey:@"name"] Type:4];
                [self GetArtistWithName:[[x valueForKey:@"data"][5] valueForKey:@"name"] Type:5];


                

                //                _Song2.text = [[[x valueForKey:@"track"] valueForKey:@"data"][0] valueForKey:@"title"];
                //                _Author2.text=[[[[x valueForKey:@"track"] valueForKey:@"data"][0] valueForKey:@"artist"] valueForKey:@"name"];
                // ;
                //                _Album2.text = [x valueForKey:@"title"];
                // handle response
                //NSLog(@"Inside  %@", pSongs);
                //NSLog(@"%@", Artist);
                //NSLog(@"callback: %@", myString);
                //psSong = pSongs;
                //NSLog(@"%@", psSong);
                
            }] resume];
    //    NSLog(@"Song of la song%@", pSongs);
    //    NSLog(@"Name of Artist%@", Artist);
    // NSLog(@"%@", Artist);
    return @"";
}



-(NSString*)GetSecondItem:(NSString*)ID{
    
    //note, add songname to query on the url
   URL2nd = [NSString stringWithFormat:@"https://api.deezer.com/album/%@", ID];
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSU   RL URLWithString:url]];
    NSLog(@"This is your URL: %@", URL2nd);
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:URL2nd]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //NSLog(@"error: %@", error);
                NSString* myString;
                myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSError *parseError = nil;
                //NSLog(@"YOUR STRING IZ %@", myString);
               // NSLog(@"WORKZ");

                NSDictionary *x = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
               // NSLog(@"ERROR REPORT ERROR REPORT %@", parseError);

                // TODO: check to ensure the item exist
                 //NSLog(@">> %@", x);
                //  NSLog(@"%@ <<< :)", [[x valueForKey:@"data"][0] valueForKey:@"title"]);
              //  [self Record2:<#(NSString *)#> author:<#(NSString *)#> alb:<#(NSString *)#>]
//                NSLog(@"%@",[[[x valueForKey:@"tracks"][0] valueForKey:@"data"] valueForKey:@"title"]);
//                NSLog(@"%@",[x valueForKey:@"title"][0]) ;
//                NSLog(@"%@", [[x valueForKey:@"artist"][0] valueForKey:@"name"]);
               // NSLog(@" You Foun %@", [[[x valueForKey:@"tracks"] valueForKey:@"data"][0] valueForKey:@"title"]);
               // NSLog(@" You Second %@", [[[x valueForKey:@"tracks"][0]  valueForKey:@"data"]valueForKey:@"title"]);
                NSLog(@"%@", [[[x valueForKey:@"tracks"] valueForKey:@"data"][0] valueForKey:@"title"]);
                [self Record2:[[[x valueForKey:@"tracks"] valueForKey:@"data"][0] valueForKey:@"title"] author:[[[[x valueForKey:@"tracks"] valueForKey:@"data"][0] valueForKey:@"artist"] valueForKey:@"name"] alb:[x valueForKey:@"title"]];
//                _Song2.text = [[[x valueForKey:@"track"] valueForKey:@"data"][0] valueForKey:@"title"];
//                _Author2.text=[[[[x valueForKey:@"track"] valueForKey:@"data"][0] valueForKey:@"artist"] valueForKey:@"name"];
// ;
//                _Album2.text = [x valueForKey:@"title"];
                // handle response
                //NSLog(@"Inside  %@", pSongs);
                //NSLog(@"%@", Artist);
                //NSLog(@"callback: %@", myString);
                //psSong = pSongs;
                //NSLog(@"%@", psSong);
                
            }] resume];
    //    NSLog(@"Song of la song%@", pSongs);
    //    NSLog(@"Name of Artist%@", Artist);
    // NSLog(@"%@", Artist);
    return @"";
}

-(NSString*)GetArtistWithName:(NSString*)name Type:(int)type{
    
    
    NSString *pSongs;
    //note, add songname to query on the url
    NSString *url = [self getSearchUrlFor:name];
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSU   RL URLWithString:url]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //NSLog(@"error: %@", error);
                NSString* myString;
                myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSError *parseError = nil;
                
                NSDictionary *x = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
                 NSLog(@"%@", x);
                //  NSLog(@"%@ <<< :)", [[x valueForKey:@"data"][0] valueForKey:@"title"]);
                NSString *pSongs = [[x valueForKey:@"data"][0] valueForKey:@"title"];
                NSString *Album = [[[x valueForKey:@"data"][0] valueForKey:@"album"]valueForKey:@"title"];
                NSString *Artist = [[[x valueForKey:@"data"][0] valueForKey:@"artist"] valueForKey:@"name"];
                // handle response
                // NSLog(@"THIS IS THE ALBUM ID %@", [[[x valueForKey:@"data"][0] valueForKey:@"album"]valueForKey:@"ID"]);
                [self Record:pSongs author:Artist alb:Album];
                //NSLog(@"Inside  %@", pSongs);
                //NSLog(@"%@", Artist);
                //NSLog(@"callback: %@", myString);
                //psSong = pSongs;
                //NSLog(@"%@", psSong);
                switch (type){
                    case 0:{
                        _Song4.text= [[x valueForKey:@"data"][0] valueForKey:@"title"];
                        _Author4.text =[[[x valueForKey:@"data"][0] valueForKey:@"artist"] valueForKey:@"name"];
                        _Album4.text =[[[x valueForKey:@"data"][0] valueForKey:@"album"] valueForKey:@"name"];

                        break;
                    }
                    case 1:{
                        _Song5.text= [[x valueForKey:@"data"][1] valueForKey:@"title"];
                        _Author5.text =[[[x valueForKey:@"data"][1] valueForKey:@"artist"] valueForKey:@"name"];
                        _Album5.text =[[[x valueForKey:@"data"][1] valueForKey:@"album"] valueForKey:@"name"];
                        break;
                    }
                    case 2:{
                        _Song6.text= [[x valueForKey:@"data"][2] valueForKey:@"title"];
                        _Author6.text =[[[x valueForKey:@"data"][2] valueForKey:@"artist"] valueForKey:@"name"];
                        _Album6.text =[[[x valueForKey:@"data"][2] valueForKey:@"album"] valueForKey:@"name"];
                        break;
                    }
                    case 3:{
                        _Song7.text= [[x valueForKey:@"data"][3] valueForKey:@"title"];
                        _Author7.text =[[[x valueForKey:@"data"][3] valueForKey:@"artist"] valueForKey:@"name"];
                        _Album7.text =[[[x valueForKey:@"data"][3] valueForKey:@"album"] valueForKey:@"name"];
                        break;
                    }
                    case 4:{
                        _Song8.text= [[x valueForKey:@"data"][4] valueForKey:@"title"];
                        _Author8.text =[[[x valueForKey:@"data"][4] valueForKey:@"artist"] valueForKey:@"name"];
                        _Album8.text =[[[x valueForKey:@"data"][4] valueForKey:@"album"] valueForKey:@"name"];
                        break;
                    }
                    case 5:{
                        _Song3.text= [[x valueForKey:@"data"][5] valueForKey:@"title"];
                        _Author3.text =[[[x valueForKey:@"data"][5] valueForKey:@"artist"] valueForKey:@"name"];
                        _Album3.text =[[[x valueForKey:@"data"][5] valueForKey:@"album"] valueForKey:@"name"];
                    }
                    default:{
                        NSLog(@"Passing Error");
                        break;
                    }
                
                        
                }
            }] resume];
    //    NSLog(@"Song of la song%@", pSongs);
    //    NSLog(@"Name of Artist%@", Artist);
    // NSLog(@"%@", Artist);
    return @"%@", pSongs;
}


-(NSString*)getArtistTop:(NSString*)song{
    

    NSString *pSongs;
    //note, add songname to query on the url
    NSString *url = [self getSearchUrlFor:song];
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSU   RL URLWithString:url]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                //NSLog(@"error: %@", error);
                NSString* myString;
                myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSError *parseError = nil;
                
                NSDictionary *x = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&parseError];
                NSLog(@"X %@", x);
                NSLog(@"Error %@", error);
              //  NSLog(@"%@ <<< :)", [[x valueForKey:@"data"][0] valueForKey:@"title"]);
                NSString *pSongs = [[x valueForKey:@"data"][0] valueForKey:@"title"];
                NSString *Album = [[[x valueForKey:@"data"][0] valueForKey:@"album"]valueForKey:@"title"];
                NSString *Artist = [[[x valueForKey:@"data"][0] valueForKey:@"artist"] valueForKey:@"name"];
                // handle response
               // NSLog(@"THIS IS THE ALBUM ID %@", [[[x valueForKey:@"data"][0] valueForKey:@"album"]valueForKey:@"ID"]);
                [self GetSimilar:[[[x valueForKey:@"data"][0] valueForKey:@"artist"]valueForKey:@"id"]];
                [self GetSecondItem:[[[x valueForKey:@"data"][0] valueForKey:@"album"]valueForKey:@"id"]];
                [self Record:pSongs author:Artist alb:Album];
                //NSLog(@"Inside  %@", pSongs);
                //NSLog(@"%@", Artist);
                //NSLog(@"callback: %@", myString);
                //psSong = pSongs;
                //NSLog(@"%@", psSong);
                
            }] resume];
//    NSLog(@"Song of la song%@", pSongs);
//    NSLog(@"Name of Artist%@", Artist);
   // NSLog(@"%@", Artist);
    return @"%@", pSongs;
}

-(void)Record:(NSString*)val author:(NSString*)artist alb:(NSString*)album {
    psSong = val;
    Artist = artist;
    Album = album;
   // NSLog(@"First Outside %@", psSong);
    //NSLog(@"First Artist %@", Artist);
    //NSLog(@"First Album %@", Album);
    _Song.text = psSong;
    _Author.text = Artist;
    _Album.text = Album;
    
}
-(void)Record2:(NSString*)val author:(NSString*)artist alb:(NSString*)album {
    // NSLog(@"First Outside %@", psSong);
    //NSLog(@"First Artist %@", Artist);
    //NSLog(@"First Album %@", Album);
    _Song2.text = val;
    _Author2.text = artist;
    _Album2.text = album;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // 1
    
    //- (NSURLSessionDownloadTask *)downloadTaskWithRequest:(NSURLRequest *)request
    // Do any additional setup after loading the view, typically from a nib.
}
@end
