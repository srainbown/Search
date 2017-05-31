//
//  SeriesTableViewCell.m
//  搜索页面
//
//  Created by 李自杨 on 2017/5/11.
//  Copyright © 2017年 View. All rights reserved.
//

#import "SeriesTableViewCell.h"

@interface SeriesTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *selectBtn;

@end

@implementation SeriesTableViewCell

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
    
    _titleLabel = [[UILabel alloc]init];
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self).offset(15);
        make.bottom.mas_equalTo(self).offset(-15);
        make.width.mas_equalTo(300);
    }];
    _titleLabel.numberOfLines = 2;
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.text = @"hha";
    
    _selectBtn = [[UIButton alloc]init];
    [self addSubview:_selectBtn];
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel.right).offset(20);
        make.centerY.mas_equalTo(self.centerY);
        make.width.height.mas_equalTo(44);
    }];
    [_selectBtn setImage:[UIImage imageNamed:@"icon_concern__normal"] forState:UIControlStateNormal];
    [_selectBtn setImage:[UIImage imageNamed:@"icon_concern_active"] forState:UIControlStateSelected];
    [_selectBtn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)setCellText:(NSString *)cellText{
    
    self.titleLabel.text = cellText;
    
}

-(void)selectBtnClick:(UIButton *)sender{

    if (sender.selected == NO) {
        sender.selected = YES;
    }else{
        sender.selected = NO;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
