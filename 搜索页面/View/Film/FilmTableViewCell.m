//
//  FilmTableViewCell.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/11.
//  Copyright © 2017年 View. All rights reserved.
//

#import "FilmTableViewCell.h"

@interface FilmTableViewCell()

//图片
@property (nonatomic, strong) UIImageView *picImage;
//标题
@property (nonatomic, strong) UILabel *titleLabel;
//上映时间
@property (nonatomic, strong) UILabel *timeLabel;
//标签
@property (nonatomic, strong) UILabel *iconLabel;

@end

@implementation FilmTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createCell];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)createCell{
    
    _picImage = [[UIImageView alloc]init];
    [self addSubview:_picImage];
    [_picImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(self).offset(-10);
        make.width.mas_equalTo(70);
    }];
    _picImage.image = [UIImage imageNamed:@"haha"];
    
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(15);
        make.left.mas_equalTo(_picImage.right).offset(20);
    }];
    _titleLabel.text = @"这里放标题";
    _titleLabel.font = [UIFont systemFontOfSize:15];
    
    _timeLabel = [[UILabel alloc]init];
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.bottom).offset(10);
        make.left.mas_equalTo(_picImage.right).offset(20);
    }];
    _timeLabel.text = @"上映:2016-02-06";
    _timeLabel.font = [UIFont systemFontOfSize:15];
    
    _iconLabel = [[UILabel alloc]init];
    [self addSubview:_iconLabel];
    [_iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_timeLabel.bottom).offset(10);
        make.left.mas_equalTo(_picImage.right).offset(20);
    }];
    _iconLabel.text = @"标签:魔幻/恐怖/科幻";
    _iconLabel.font = [UIFont systemFontOfSize:15];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
