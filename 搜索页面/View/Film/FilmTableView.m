//
//  FilmTableView.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import "FilmTableView.h"
#import "FilmTableViewCell.h"


@interface FilmTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FilmTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    
    self = [super initWithFrame:frame style:style];
    
    if (self) {
        self.backgroundColor = C1;
        //设置头视图和脚视图
        [self createHeadViewAndFootView:frame];
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
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


#pragma UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"FilmCellID";
    
    FilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[FilmTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (!_clickCellBlock) {
        return;
    }
    _clickCellBlock(@"电影详情页");
    
}


@end
