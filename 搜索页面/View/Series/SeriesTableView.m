//
//  SeriesTableView.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import "SeriesTableView.h"
#import "SeriesTableViewCell.h"

@interface SeriesTableView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SeriesTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        
        self.backgroundColor = C1;
        self.delegate = self;
        self.dataSource = self;
        self.estimatedRowHeight = 100;
        
        //设置头视图和脚视图
        [self createHeadViewAndFootView:frame];

    }
    return self;
}

#pragma mark -- 懒加载
-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark -- 数据
-(void)addDataArray:(NSMutableArray *)array{
    
    [self.dataArray addObjectsFromArray:array];
    
    [self reloadData];
}

#pragma mark -- UI
//设置头视图和脚视图
-(void)createHeadViewAndFootView:(CGRect)frame{

    //头视图
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
    headView.backgroundColor = C1;
    self.tableHeaderView = headView;
    
    UILabel *numLabel = [[UILabel alloc]init];
    [headView addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(headView.left).offset(10);
        make.centerY.mas_equalTo(headView.centerY);
    }];
    numLabel.text = @"共1068个结果";
    numLabel.font = [UIFont systemFontOfSize:15];
    //脚视图
    UIView *footView = [[UIView alloc]init];
    self.tableFooterView = footView;
    
}

#pragma mark -- UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.rowHeight;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"seriesCellId";
    
    SeriesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[SeriesTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    if (_dataArray.count >= indexPath.row) {
        [cell setCellText:_dataArray[indexPath.row]];
    }
    
    return cell;
    
}


@end
