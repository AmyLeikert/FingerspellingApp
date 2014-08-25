//
//  ALTableViewController.m
//  PracticeStuff
//
//  Created by DetroitLabsUser on 5/2/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALTableViewController.h"
#import "ALFingerspellingViewController.h"

@interface ALTableViewController ()
@property (strong, nonatomic) NSArray *swedishArray;
@property (strong, nonatomic) NSArray *japaneseArray;
@property (strong, nonatomic) NSArray *aslArray;



@end

NSString* const cellReuseIdentifier = @"cellIdentifier";

@implementation ALTableViewController

-(NSString *)docsDir {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    array = [NSMutableArray arrayWithContentsOfFile:listPath];
    NSLog(@"Count: %@", array);
    
    
    self.swedishArray =  [NSArray arrayWithObjects:@"colloquial", @"verbs", @"nouns", nil];
    self.japaneseArray = [NSArray arrayWithObjects:@"Kanji", @"particles", @"Kana", nil];
    self.aslArray = [NSArray arrayWithObjects:@"Fingerspelling", @"Numbers", @"Animals", nil];

    UIImageView *chalkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ChalkboardBG.png"]];
    [chalkImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = chalkImageView;


    self.title = @"Language Practice";
    
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                    NSForegroundColorAttributeName:[UIColor colorWithRed:0.522 green:0.267 blue:0 alpha:1],
                                                            
                                        NSFontAttributeName:
                                        [UIFont
                                         fontWithName:@"Marker Felt" size:20.0f]
                                                            }];

    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
    
    
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.973 green:0.722 blue:0.22 alpha:1]];

}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
    }
    
   return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        return self.swedishArray.count;
    if (section == 1)
        return self.japaneseArray.count;
    if (section == 2)
        return self.aslArray.count;
    return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(20, 8, 320, 20);
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    
    [myLabel setFont:[UIFont fontWithName:@"Marker Felt" size:20]];
    [myLabel setTextColor:[UIColor colorWithRed:0.318 green:0.141 blue:0 alpha:1]];
    
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:myLabel];
    
    return headerView;

}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
 
    if (section == 0)
        return @"Swedish";
    if (section == 1)
        return @"Japanese";
    if (section == 2)
        return @"American Sign Language";
    return @"undefined";
    }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    UIView *selectionView = [[UIView alloc]initWithFrame:cell.bounds];
    
    [selectionView setBackgroundColor:[UIColor brownColor]];
    
    cell.selectedBackgroundView = selectionView;
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [cell setBackgroundColor:[UIColor clearColor]];
    
    [cell.textLabel setFont:[UIFont fontWithName:@"MarkerFelt-Thin" size:18]];
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    

    cell.textLabel.textAlignment = UITextAlignmentCenter;


    if (indexPath.section == 0)
        cell.textLabel.text = [self.swedishArray objectAtIndex:indexPath.row];
    if (indexPath.section == 1)
        cell.textLabel.text = [self.japaneseArray objectAtIndex:indexPath.row];
    if (indexPath.section == 2)
        cell.textLabel.text = [self.aslArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    ALFingerspellingViewController *fsViewController = [[ALFingerspellingViewController alloc] init];
    
    if (indexPath.section == 2 && indexPath.row == 0)
        return [self.navigationController pushViewController:fsViewController animated:YES];
    
}

@end
