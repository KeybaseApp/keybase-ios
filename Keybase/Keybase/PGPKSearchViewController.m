//
//  PGPKSearchViewController.m
//  Keybase
//
//  Created by App Requests on 3/13/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import "PGPKSearchViewController.h"
#import "PGPKUserCell.h"
#import "PGPKGlobals.h"
#import "UIImageView+AFNetworking.h"
#import "PGPKUserProfileViewController.h"
#include <QuartzCore/QuartzCore.h>

@interface PGPKSearchViewController ()

@end

@implementation PGPKSearchViewController
@synthesize results, manager, searchController, searchBar, mainTable;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    results = [[NSArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [results count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *userInfo = [results objectAtIndex:[indexPath row]];
    static NSString *CellIdentifier = @"userCell";
    PGPKUserCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.usernameLabel.text = [[[userInfo objectForKey:@"components"] objectForKey:@"username" ] objectForKey:@"val"];
    cell.nameLabel.text = [[[userInfo objectForKey:@"components"] objectForKey:@"full_name" ] objectForKey:@"val"];
    cell.githubUsernameLabel.text = [[[userInfo objectForKey:@"components"] objectForKey:@"github" ] objectForKey:@"val"];
    cell.keyLabel.text = [[[userInfo objectForKey:@"components"] objectForKey:@"key_fingerprint" ] objectForKey:@"val"];
    cell.profileImage.layer.cornerRadius = 25;
    cell.profileImage.layer.masksToBounds = YES;
    cell.profileImage.layer.borderWidth = 0;

    [cell.profileImage setImage:[UIImage imageNamed:@"no_photo.png"]];
    if ([userInfo objectForKey:@"thumbnail"] != (id)[NSNull null]) {
    NSURL *url = [NSURL URLWithString:[userInfo objectForKey:@"thumbnail"]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    __weak typeof(UIImageView) *weakImage = cell.profileImage;

    [cell.profileImage setImageWithURLRequest:request
                          placeholderImage:placeholderImage
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                       
                                       weakImage.image = image;
                                     //  [weakCell setNeedsLayout];
                                       
                                   } failure:nil];
    }
    if (cell == nil) {
        cell = [[PGPKUserCell alloc] init];
    }
    return cell;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
    tableView.rowHeight = 122.0f; // or some other height
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    AFHTTPRequestOperationManager *httpManager = [AFHTTPRequestOperationManager manager];
    [httpManager GET:[NSString stringWithFormat:@"%@user/autocomplete.json?q=%@", apiBaseURL, searchString] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        results = [responseObject objectForKey:@"completions"];
        [controller.searchResultsTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    return NO;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"displayProfileFromSearchResults" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"displayProfileFromSearchResults"]) {
        PGPKUserCell *cell = (PGPKUserCell *)sender;

        PGPKUserProfileViewController *vc = [segue destinationViewController];
        
        [vc setUsername:cell.usernameLabel.text];
    }
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView {
    [mainTable reloadData];
}

@end
