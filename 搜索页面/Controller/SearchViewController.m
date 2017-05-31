//
//  SearchViewController.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import "SearchViewController.h"
#import "ComprehensiveTableView.h"
#import "VideoTableView.h"
#import "SeriesTableView.h"
#import "FilmTableView.h"

#import "DetailViewController.h"


@interface SearchViewController ()

@property (nonatomic, strong) ComprehensiveTableView *comprehensiveTableView;

@property (nonatomic, strong) VideoTableView *videoTableView;

@property (nonatomic, strong) SeriesTableView *seriesTableView;
@property (nonatomic, strong) NSMutableArray *seriesArray;

@property (nonatomic, strong) FilmTableView *filmTableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {

    self.view.backgroundColor = [UIColor whiteColor];
    //创建搜索栏
    [self createSearchBar];
    
    //设置数据源
    self.menuArray = [NSMutableArray arrayWithArray:@[@"综合",@"视频",@"系列",@"电影"]];
    self.tableArray = [NSMutableArray arrayWithCapacity:self.menuArray.count];
    
    //设置tableView数组
    [self.tableArray addObject:self.comprehensiveTableView];
    [self.tableArray addObject:self.videoTableView];
    [self.tableArray addObject:self.seriesTableView];
    [self.tableArray addObject:self.filmTableView];
    
    //设置控件位置
    self.menuframe = CGRectMake(0, 80, KWidth, 40);
    self.tableframe = CGRectMake(0, CGRectGetMaxY(self.menuframe), KWidth, KHeight - CGRectGetMaxY(self.menuframe));
    
    //调用父类方法加载控件
    [super viewDidLoad]; //最后执行
    
    [self cellClick];
    
    [self getData];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
}


-(void)createSearchBar{

    UISearchBar *searchBar = [[UISearchBar alloc]init];
    [self.view addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    searchBar.placeholder = @"搜索";
}

#pragma mark -- 懒加载
//综合
-(ComprehensiveTableView *)comprehensiveTableView{
    if (_comprehensiveTableView == nil) {
        _comprehensiveTableView = [[ComprehensiveTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _comprehensiveTableView;
}

//视频
-(VideoTableView *)videoTableView{
    if (_videoTableView == nil) {
        _videoTableView = [[VideoTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _videoTableView;
}

//系列
-(SeriesTableView *)seriesTableView{
    if (_seriesTableView == nil) {
        _seriesTableView = [[SeriesTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _seriesTableView;
}
-(NSMutableArray *)seriesArray{
    if (_seriesArray == nil) {
        _seriesArray = [NSMutableArray array];
    }
    return _seriesArray;
}

//电影
-(FilmTableView *)filmTableView{
    if (_filmTableView == nil) {
        _filmTableView = [[FilmTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return _filmTableView;
}

#pragma mark -- 请求数据
-(void)getData{

    //系列数据
    [self.seriesArray addObject:@"《三国演义》是中国古典四大名著之一"];
    [self.seriesArray addObject:@"是中国第一部长篇章回体历史演义小说，全名为《三国志通俗演义》（又称《三国志演义》），作者是元末明初的著名小说家罗贯中。"];
    [self.seriesArray addObject:@"《三国演义》描写了从东汉末年到西晋初年之间近105年的历史风云"];
    [self.seriesArray addObject:@"以描写战争为主"];
    [self.seriesTableView addDataArray:_seriesArray];
    
}


-(void)cellClick{
    
    LZYWeakSelf;
    self.filmTableView.clickCellBlock = ^(NSString *title){
        
        DetailViewController *vc = [[DetailViewController alloc]init];
        vc.vcTitle = title;
        
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    };
    
}


@end
