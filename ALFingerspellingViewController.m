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

-(IBAction)generatePressed:(id)sender {
    int randomIndex = arc4random() % [_answerArray count];
    
    self.currentAnswer = self.answerArray[randomIndex];
    
    NSString *imageName = [NSString stringWithFormat:@"%@.jpg", self.currentAnswer];
    
    [self.fsImageView setImage:[UIImage imageNamed:imageName]];
    self.fsImageView.layer.borderWidth = 0;
    self.answerTextField.text = nil;
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
    self.title = @"Fingerspelling";
    self.answerTextField.delegate = self;
    // Do any additional setup after loading the view from its nib.
    
    self.submitButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.submitButton.frame = CGRectMake(100, 100, 30, 30);
    self.submitButton.titleLabel.text = @"A Button";
    [self.view addSubview: self.submitButton];
    
    self.answerArray = [NSArray arrayWithObjects:
                        @"a",
                        @"b",
                        @"c",
                        @"d",
                        @"e",
                        @"f",
                        @"g",
                        @"h",
                        @"i",
                        @"j",
                        @"k",
                        @"l",
                        @"m",
                        @"n",
                        @"o",
                        @"p",
                        @"q",
                        @"r",
                        @"s",
                        @"t",
                        @"u",
                        @"v",
                        @"w",
                        @"x",
                        @"y",
                        @"z", nil];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ChalkboardBG.png"]]];
    

    
    [self generatePressed:nil];
}

-(IBAction)submitPressed:(id)sender {
    NSString *answer = self.answerTextField.text;
    if ([answer isEqualToString:self.currentAnswer]) {
        self.fsImageView.layer.borderWidth = 5;
        self.fsImageView.layer.borderColor = [[UIColor greenColor] CGColor];
    } else {
        self.fsImageView.layer.borderWidth = 5;
        self.fsImageView.layer.borderColor = [[UIColor redColor] CGColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return  YES;
}

@end
