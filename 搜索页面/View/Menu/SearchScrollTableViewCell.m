//
//  SearchScrollTableViewCell.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import "SearchScrollTableViewCell.h"
#import "ComprehensiveTableView.h"
#import "VideoTableView.h"
#import "SeriesTableView.h"
#import "FilmTableView.h"

@interface SearchScrollTableViewCell()

@property (nonatomic, weak) ComprehensiveTableView *comprehensiveTableView;

@property (nonatomic, weak) VideoTableView *videoTableView;

@property (nonatomic, weak) SeriesTableView *seriesTableView;

@property (nonatomic, weak) FilmTableView *filmTableView;

@end

@implementation SearchScrollTableViewCell

-(void)setTableView:(id)tableView{
    
    [self removeFromSuperview];
    
    if ([tableView isKindOfClass:[ComprehensiveTableView class]]) {
        
        NSLog(@"综合");
        
    }else if ([tableView isKindOfClass:[VideoTableView class]]){
        
        NSLog(@"视频");
        
    }else if ([tableView isKindOfClass:[SeriesTableView class]]) {
        
        NSLog(@"系列");
        
        self.seriesTableView = tableView;
        [self.contentView addSubview:_seriesTableView];
        _seriesTableView.transform = CGAffineTransformMakeRotation(90 * M_PI / 180);
        
    }else if ([tableView isKindOfClass:[FilmTableView class]]) {
        
        NSLog(@"电影");
        
        self.filmTableView = tableView;
        [self.contentView addSubview:_filmTableView];
        _filmTableView.transform = CGAffineTransformMakeRotation(90 * M_PI / 180);
        
    }

}

-(void)layoutSubviews{
    
    self.comprehensiveTableView.frame = self.contentView.bounds;
    
    self.videoTableView.frame = self.contentView.bounds;
    
    self.seriesTableView.frame = self.contentView.bounds;
    
    self.filmTableView.frame = self.contentView.bounds;
    
}

-(void)removeFromSuperview{

    [_comprehensiveTableView removeFromSuperview];
    [_videoTableView removeFromSuperview];
    [_seriesTableView removeFromSuperview];
    [_filmTableView removeFromSuperview];
}


@end
