//
//  ALASLanimalViewController.h
//  PracticeStuff
//
//  Created by DetroitLabsUser on 5/9/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ALASLanimalViewController : UIViewController {
    NSString *listPath;
    NSMutableArray *array;
}

-(IBAction)playMovie:(id)sender;

@end
