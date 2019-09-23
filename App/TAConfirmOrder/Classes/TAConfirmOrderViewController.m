//
//  TAConfirmOrderViewController.m
//  TAConfirmOrder
//
//  Created by Charon on 16/12/25.
//  Copyright © 2016年 Charon. All rights reserved.
//

#import "TAConfirmOrderViewController.h"

#import <Masonry/Masonry.h>

@interface TAConfirmOrderViewController ()

@property (nonatomic, strong) UIButton *sureButton;

@end

@implementation TAConfirmOrderViewController

#pragma mark - life cycle

- (void)viewDidLoad {
  [super viewDidLoad];

  [self setUpUI];
}

#pragma mark - event response

- (void)didTappedSureButton:(UIButton *)button {
  if (self.confirmComplete) {
    self.confirmComplete();
  }

  [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - set up UI

- (void)setUpUI {
  self.navigationItem.title = [NSString stringWithFormat:@"确认订单(%@)", self.goodsName];
  self.view.backgroundColor = [UIColor blueColor];

  [self.view addSubview:self.sureButton];

  [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.equalTo(self.view);
    make.height.equalTo(@100);
    make.width.equalTo(@100);
  }];
}

#pragma mark - getters

- (UIButton *)sureButton {
  if (_sureButton == nil) {
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureButton setTitle:@"立即下单" forState:UIControlStateNormal];
    [_sureButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _sureButton.backgroundColor = [UIColor yellowColor];
    [_sureButton addTarget:self
                    action:@selector(didTappedSureButton:)
          forControlEvents:UIControlEventTouchUpInside];
  }
  return _sureButton;
}

@end
