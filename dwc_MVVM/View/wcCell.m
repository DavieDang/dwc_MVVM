//
//  wcCell.m
//  dwc_MVVM
//
//  Created by admin on 2017/4/1.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

#import "wcCell.h"
#import "wcHeader.h"


@interface wcCell()

@property (nonatomic, strong) UILabel *wcLabel;

@end


@implementation wcCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //布局
         [self setUpView];
    }
    return self;
}

-(UILabel *)wcLabel{
    if (!_wcLabel) {
        _wcLabel = [UILabel new];
        _wcLabel.textColor = [UIColor redColor];
        [self.contentView addSubview:_wcLabel];
        [_wcLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.height.mas_equalTo(20);
        }];
    }
    return _wcLabel;
}


- (void)setData:(wcModel *)data{
    
    if (data) {
        _data = data;
        [self loadViewData];
    }
}

- (void)loadViewData{
    
    [self.wcLabel setText:_data.wc_title];
    
}

- (void)setUpView{
    
    [self.contentView addSubview:self.wcLabel];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
