//
//  ALTableViewController.m
//  PracticeStuff
//
//  Created by DetroitLabsUser on 5/2/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "ALTableViewController.h"

@interface ALTableViewController ()
@property (strong, nonatomic) NSArray *swedishArray;
@property (strong, nonatomic) NSArray *japaneseArray;
@property (strong, nonatomic) NSArray *aslArray;


@end

static NSString * const cellReuseIdentifier = @"cellIdentifier";
@implementation ALTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.swedishArray =  [NSArray arrayWithObjects:@"colloquial", @"verbs", @"nouns", nil];
    self.japaneseArray = [NSArray arrayWithObjects:@"Kanji", @"particles", @"Kana", nil];
    self.aslArray = [NSArray arrayWithObjects:@"Fingerspelling", @"Numbers", @"\"School\" Vocabulary", nil];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.title = @"Language Practice";

}

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuseIdentifier];
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
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
    
    // Return the number of rows in the section.
    if (section == 0)
        return self.swedishArray.count;
    if (section == 1)
        return self.japaneseArray.count;
    if (section == 2)
        return self.aslArray.count;
    return 0;
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
    
   // static NSString *cellIdentifier = @"tableCell";
     NSLog(@"Hello");
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
        // The below gives a full image in a cell if there is no text in the cell.
   // cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"grape_PNG521"]];
    
        // The below gives a resized square image to the left regardless of whether or not there is text in the cell
    
    //This is just practice to see how to use images in cells. Obvs, I don't want/need grapes in here.
   [cell.imageView setImage:[UIImage imageNamed:@"grape_PNG521"]];
    
    
    // Configure the cell...
    if (indexPath.section == 0)
        cell.textLabel.text = [self.swedishArray objectAtIndex:indexPath.row];
    if (indexPath.section == 1)
        cell.textLabel.text = [self.japaneseArray objectAtIndex:indexPath.row];
    if (indexPath.section == 2)
        cell.textLabel.text = [self.aslArray objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

 //In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here, for example:
//    // Create the next view controller.
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
//    
//    // Pass the selected object to the new view controller.
//    
//    // Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
//}


@end
