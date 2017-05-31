//
//  SearchScrollPageViewController.h
//  搜索页面
//
//  Created by 李自杨 on 2017/5/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchScrollMenu.h"
#import "SearchScrollTableViewCell.h"

@interface SearchScrollPageViewController : UIViewController

@property (nonatomic,strong) NSMutableArray *tableArray;
@property (nonatomic,strong) NSMutableArray *menuArray;

@property (nonatomic,assign) CGRect menuframe;
@property (nonatomic,assign) CGRect tableframe;

@end
