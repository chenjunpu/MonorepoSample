//
//  TAGoodsDetailViewController.m
//  TAGoodsDetail
//
//  Created by Charon on 16/12/25.
//  Copyright © 2016年 Charon. All rights reserved.
//

#import "TAGoodsDetailViewController.h"

#import <TAConfirmOrderBusinessCategory/CTMediator+TAConfirmOrder.h>
#import <Masonry/Masonry.h>

@interface TAGoodsDetailViewController ()

@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIButton *buyButton;

@end

@implementation TAGoodsDetailViewController

#pragma mark - life cycle

- (void)viewDidLoad {
  [super viewDidLoad];

  [self setUpUI];
}

#pragma mark - event response

- (void)didTappedBuyButton:(UIButton *)button {
  UIViewController *vc =
      [[CTMediator sharedInstance] confirmOrderViewControllerWithGoodsId:self.goodsId
                                                               goodsName:self.goodsName
                                                         confirmComplete:^{
                                                           self.statusLabel.text = @"购买成功";
                                                         }];
  [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - set up UI

- (void)setUpUI {
  self.title = self.goodsName;
  self.view.backgroundColor = [UIColor whiteColor];

  [self.view addSubview:self.statusLabel];
  [self.view addSubview:self.buyButton];

  [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.equalTo(self.view);
  }];

  [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.equalTo(self.view);
    make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    make.height.equalTo(@45);
  }];
}

#pragma mark - getters

- (UILabel *)statusLabel {
  if (_statusLabel == nil) {
    _statusLabel = [[UILabel alloc] init];
    _statusLabel.textColor = [UIColor redColor];
    _statusLabel.font = [UIFont systemFontOfSize:15.f];
    _statusLabel.textAlignment = NSTextAlignmentCenter;
    _statusLabel.text = @"暂未购买";
  }
  return _statusLabel;
}

- (UIButton *)buyButton {
  if (_buyButton == nil) {
    _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [_buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buyButton setBackgroundColor:[UIColor redColor]];
    [_buyButton addTarget:self
                   action:@selector(didTappedBuyButton:)
         forControlEvents:UIControlEventTouchUpInside];
  }
  return _buyButton;
}

@end
