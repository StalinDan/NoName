//
//  NNTableViewController.m
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "NNTableViewController.h"

@interface NNTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NNTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view insertSubview:self.nn_tableView atIndex:0];
    
}

- (void)dealloc
{
    _nn_tableView.delegate = nil;
}


#pragma mark - Override Methods

- (UIEdgeInsets)dey_tableViewOffsetInset
{
    return UIEdgeInsetsZero;
}

- (UITableViewStyle)dey_tableViewStyle
{
    return UITableViewStylePlain;
}


#pragma mark - UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    return cell;
}

#pragma mark - Property Methods

- (UITableView *)nn_tableView {
    if (!_nn_tableView) {
        _nn_tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:self.nn_tableViewStyle];
        _nn_tableView.dataSource = self;
        _nn_tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        _nn_tableView.tableFooterView = [UIView new];
        [self nn_configForTableView:_nn_tableView];
    }
    return _nn_tableView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
