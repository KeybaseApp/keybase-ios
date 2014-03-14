//
//  PGPKSearchViewController.h
//  Keybase
//
//  Created by App Requests on 3/13/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface PGPKSearchViewController : UITableViewController <UISearchDisplayDelegate, UISearchBarDelegate>
@property (nonatomic, strong) NSArray *results;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@property (nonatomic, strong) UISearchDisplayController *searchController;
@property (nonatomic, strong) UITableView *activeTable;
@property (nonatomic, strong) IBOutlet UITableView *mainTable;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end
