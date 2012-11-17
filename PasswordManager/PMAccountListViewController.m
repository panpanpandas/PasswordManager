//
//  PMAccountListViewController.m
//  PasswordManager
//
//  Created by Pan Pan on 10/27/12.
//  Copyright (c) 2012 Pan Pan. All rights reserved.
//

#import "PMAccountListViewController.h"
#import "PMAccount.h"
#import "PMAppDelegate.h"
#import "PMAccountDetailViewController.h"

@interface PMAccountListViewController ()

@property (nonatomic, strong) NSArray *lists;
@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContext;

@end

@implementation PMAccountListViewController

@synthesize lists = _lists;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithEntityName:@"PMAccount"];
    self.lists = [self.managedObjectContext executeFetchRequest:fetchRequst error:nil];
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *) managedObjectContext
{
    return [(PMAppDelegate *) [[UIApplication sharedApplication] delegate] managedObjectContext];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AccountCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PMAccount *cur =[self.lists objectAtIndex:indexPath.row];
    cell.textLabel.text = cur.title;
    
    return cell;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self.tableView reloadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AccountListToDetailSegue"]) {
        PMAccountDetailViewController *accountDetail = segue.destinationViewController;
        accountDetail.account = [self.lists objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.managedObjectContext deleteObject:[self.lists objectAtIndex:indexPath.row]];
        [self.managedObjectContext save:nil];
        
        NSFetchRequest *fetchRequst = [NSFetchRequest fetchRequestWithEntityName:@"PMAccount"];
        self.lists = [self.managedObjectContext executeFetchRequest:fetchRequst error:nil];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (IBAction)addAccount:(id)sender {
    PMAccount *account = [NSEntityDescription insertNewObjectForEntityForName:@"PMAccount" inManagedObjectContext:self.managedObjectContext];

    account.title = @"New Account";
    account.username = @"";
    account.password = @"";
    
    [self.managedObjectContext save:nil];
    self.lists = [self.lists arrayByAddingObject:account];
    
    [self.tableView reloadData];
}
@end
