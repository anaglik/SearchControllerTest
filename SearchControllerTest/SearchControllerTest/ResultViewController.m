//
//  ResultViewController.m
//  SearchControllerTest
//
//  Created by Andrzej Naglik on 23.09.2014.
//  Copyright (c) 2014 Andrzej Naglik. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()<UITableViewDelegate,UITableViewDataSource>{
  UITableView *_tableView;
  NSUInteger _count;
}
@end

NSString *const kCellResult = @"kCellResult";

@implementation ResultViewController

- (void)loadView{
  UIView *mainView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  [mainView setBackgroundColor:[UIColor blueColor]];
  [self setView:mainView];
  
  _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
  [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
  [_tableView setDelegate:self];
  [_tableView setDataSource:self];
  [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellResult];
  [self.view addSubview:_tableView];
  
  [self setupConstraints];
}

- (void)setupConstraints{
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_tableView]|" options:0 metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(_tableView)]];
  [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_tableView]|" options:0 metrics:nil
                                                                      views:NSDictionaryOfVariableBindings(_tableView)]];
}

#pragma mark -
#pragma mark - TableView methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return _count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellResult forIndexPath:indexPath];
  [[cell textLabel] setText:[NSString stringWithFormat:@"Result - %ld :)",(long)indexPath.row]];
  
  return cell;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
  _count = [[[searchController searchBar] text] length];
  [_tableView reloadData];
}


@end
