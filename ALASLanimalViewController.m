//
//  ALASLanimalViewController.m
//  PracticeStuff
//
//  Created by DetroitLabsUser on 5/9/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALASLanimalViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ALASLanimalViewController ()
@property (nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ALASLanimalViewController

-(IBAction)playMovie:(id)sender
{
//    //NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"big-buck-bunny-clip" ofType:@"m4v"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:@"http://www.handspeak.com/word/a/animal.mp4"];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    [self.view addSubview:moviePlayerController.view];
    moviePlayerController.fullscreen = YES;
    [moviePlayerController play];
}

-(NSString *)docsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ChalkboardBG.png"]]];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.handspeak.com/word/a/animal.mp4"]]];

    listPath = [[self docsDir]stringByAppendingPathComponent:@"aslAnimals.plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:listPath]) {
        [[NSFileManager defaultManager]copyItemAtPath:[[NSBundle mainBundle]pathForResource:@"aslAnimals" ofType:@"plist"] toPath:listPath error:nil];
    }
    array = [NSMutableArray arrayWithContentsOfFile:listPath];
    NSLog(@"Count: %i", [array count]);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
