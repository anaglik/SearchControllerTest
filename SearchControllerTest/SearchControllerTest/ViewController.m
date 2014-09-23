//
//  ViewController.m
//  SearchControllerTest
//
//  Created by Andrzej Naglik on 23.09.2014.
//  Copyright (c) 2014 Andrzej Naglik. All rights reserved.
//

#import "ViewController.h"
#import "ResultViewController.h"
#import "MySearchController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>{
  UITableView *_tableView;
  MySearchController *_searchController;
}
@end

NSString *const kCell = @"kCell";

@implementation ViewController

- (void)loadView{
  UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [mainView setBackgroundColor:[UIColor redColor]];
  [self setView:mainView];
  
  _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_tableView setDelegate:self];
  [_tableView setDataSource:self];
  [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCell];
  [self.view addSubview:_tableView];
  
  [self setupConstraints];
  [self setupSearchController];
}

- (void)setupConstraints{
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(_tableView)]];
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(_tableView)]];
}

- (void)setupSearchController{
  ResultViewController *resultViewController = [[ResultViewController alloc] init];
  _searchController = [[MySearchController alloc] initWithSearchResultsController:resultViewController];
  [[_searchController searchBar] setDelegate:self];
  _searchController.searchResultsUpdater = resultViewController;
  [_searchController.searchBar sizeToFit];
  _tableView.tableHeaderView = _searchController.searchBar;
  
  
  self.definesPresentationContext = YES;
}

//- (UIBarPosition)positionForBar:(id <UIBarPositioning>)bar{
//  return UIBarPositionTopAttached;
//}

#pragma mark - 
#pragma mark - TableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return 25.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCell forIndexPath:indexPath];
  [[cell textLabel] setText:[NSString stringWithFormat:@"%ld - Hello :)",(long)indexPath.row]];
  
  return cell;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:@"Hello Here"];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];

}


@end
