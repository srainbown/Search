//
//  DetailViewController.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/11.
//  Copyright © 2017年 View. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = _vcTitle;
    
    UIImageView *image = [[UIImageView alloc]init];
    [self.view addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(64);
        make.centerY.mas_equalTo(self.view);
        make.left.right.mas_equalTo(self.view);
        
    }];
    image.image = [UIImage imageNamed:@"haha"];
    image.contentMode = UIViewContentModeScaleAspectFill;
    
}


@end
