//
//  HomeController.m
//  TAMainProject
//
//  Created by Charon on 16/12/25.
//  Copyright © 2016年 Charon. All rights reserved.
//

#import "HomeController.h"

#import <TAGoodsDetailBusinessCategory/CTMediator+TAGoodsDetail.h>
#import <Masonry/Masonry.h>

@interface HomeController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSDictionary *> *dataSource;

@end

@implementation HomeController

#pragma mark - life cycle

- (void)viewDidLoad {
  [super viewDidLoad];

  [self setUpUI];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"
                                                          forIndexPath:indexPath];

  cell.textLabel.text = self.dataSource[indexPath.row][@"goodsName"];
  cell.detailTextLabel.text = self.dataSource[indexPath.row][@"goodsDesc"];

  return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];

  NSDictionary *goodsItem = self.dataSource[indexPath.row];
  UIViewController *goodsDetailVC =
      [[CTMediator sharedInstance] goodsDetailViewControllerWithGoodsId:goodsItem[@"goodsId"]
                                                              goodsName:goodsItem[@"goodsName"]];
  [self.navigationController pushViewController:goodsDetailVC animated:YES];
}

#pragma mark - set up UI

- (void)setUpUI {
  self.title = @"首页";
  self.view.backgroundColor = [UIColor whiteColor];

  [self.view addSubview:self.tableView];

  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view);
  }];
}

#pragma mark - getters

- (UITableView *)tableView {
  if (_tableView == nil) {
    _tableView = [[UITableView alloc] init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellId"];
  }
  return _tableView;
}

- (NSArray<NSDictionary *> *)dataSource {
  if (_dataSource == nil) {
    _dataSource = @[
      @{ @"goodsName": @"小熊饼干",
         @"goodsDesc": @"20g,美国产",
         @"goodsId": @"12306" },
      @{ @"goodsName": @"法式软面包",
         @"goodsDesc": @"100g,国产",
         @"goodsId": @"45789" }
    ];
  }
  return _dataSource;
}

@end
