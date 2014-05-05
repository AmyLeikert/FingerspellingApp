//
//  ALFingerspellingViewController.m
//  PracticeStuff
//
//  Created by DetroitLabsUser on 5/5/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALFingerspellingViewController.h"

@interface ALFingerspellingViewController ()
@property (nonatomic, strong) IBOutlet UITextField *answerTextField;
@property (nonatomic, strong) IBOutlet UIImageView *fsImageView;
@property (nonatomic, strong) IBOutlet UIButton *submitButton;
@property (nonatomic, strong) IBOutlet UIButton *randomImageButton;
@property (nonatomic, strong) NSString *currentAnswer;

@end

@implementation ALFingerspellingViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
