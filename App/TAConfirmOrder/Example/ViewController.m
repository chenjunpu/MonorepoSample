//
//  ViewController.m
//  TAGoodsDetail
//
//  Created by Charon on 16/12/25.
//  Copyright © 2016年 Charon. All rights reserved.
//

#import "ViewController.h"
#import "TAConfirmOrderViewController.h"

#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *detailButton;

@end

@implementation ViewController

#pragma mark - life cycle

- (void)viewDidLoad {
  [super viewDidLoad];

  [self setUpUI];
}

#pragma mark - event response

- (void)didTappedDetailButton:(UIButton *)button {
  TAConfirmOrderViewController *vc = [[TAConfirmOrderViewController alloc] init];
  vc.goodsId = @"ExampleID";
  vc.goodsName = @"ExampleGoodsName";
  [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - set up UI

- (void)setUpUI {
  self.title = @"Example";
  self.view.backgroundColor = [UIColor whiteColor];

  [self.view addSubview:self.detailButton];

  [self.detailButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.center.equalTo(self.view);
  }];
}

#pragma mark - getters

- (UIButton *)detailButton {
  if (_detailButton == nil) {
    _detailButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_detailButton setTitle:@"商品详情" forState:UIControlStateNormal];
    [_detailButton addTarget:self
                      action:@selector(didTappedDetailButton:)
            forControlEvents:UIControlEventTouchUpInside];
  }
  return _detailButton;
}

@end
