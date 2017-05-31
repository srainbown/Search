//
//  ScrollMenu.h
//  搜索页面
//
//  Created by 李自杨 on 2017/5/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchScrollMenuDelegate <NSObject>

@optional

-(void)menuBtnClickAtIndex:(NSInteger)index;

@end

@interface SearchScrollMenu : UIView

@property (nonatomic, weak) id<SearchScrollMenuDelegate> delegate;

@property (nonatomic, weak) UIButton *selectedBtn;

@property (nonatomic, strong) NSMutableArray *menuArray;

@property (nonatomic, assign) BOOL isShowBreakline;

- (void)setbBreaklineColor:(UIColor *)color;
- (void)setselectedIndex:(NSInteger)index;

@end
