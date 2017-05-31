//
//  SearchScrollPageViewController.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import "SearchScrollPageViewController.h"

@interface SearchScrollPageViewController ()<UITableViewDelegate,UITableViewDataSource,SearchScrollMenuDelegate>

@property (nonatomic,weak) UITableView *containerTable;
@property (nonatomic,weak) SearchScrollMenu *scrollMenu;

@end

@implementation SearchScrollPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化滚动目录
    SearchScrollMenu *scrollMenu = [[SearchScrollMenu alloc]initWithFrame:self.menuframe];
    scrollMenu.delegate = self;
    scrollMenu.menuArray = self.menuArray;
    [self.view addSubview:scrollMenu];
    self.scrollMenu = scrollMenu;
    
    //初始化容器
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.transform = CGAffineTransformMakeRotation(270 * M_PI / 180);
    tableView.frame = self.tableframe;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.pagingEnabled = YES;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.containerTable = tableView;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"SearchScrollCellID";
    
    SearchScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[SearchScrollTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.tableView = self.tableArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.width;
}

//拖动动画完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSIndexPath *indexPath = [self.containerTable indexPathForRowAtPoint:scrollView.contentOffset];
    [self.scrollMenu setselectedIndex: indexPath.row];
}

//点击目录
- (void)menuBtnClickAtIndex:(NSInteger)index{
    [self.containerTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];
}


@end
