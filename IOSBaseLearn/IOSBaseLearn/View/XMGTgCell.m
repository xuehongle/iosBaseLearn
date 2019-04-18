//
//  XMGTgCell.m
//  02-自定义等高的cell-代码-frame01
//
//  Created by xiaomage on 16/1/8.
//  Copyright © 2016年 小码哥. All rights reserved.
//

#import "XMGTgCell.h"
#import "XMGTg.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface XMGTgCell ()

/** 图标 */
@property (nonatomic, weak) UIImageView *iconImageView;

/** 标题 */
@property (nonatomic, weak) UILabel *titleLabel;

/** 价格 */
@property (nonatomic, weak) UILabel *priceLabel;

/** 购买数 */
@property (nonatomic, weak) UILabel *buyCountLabel;
@end

@implementation XMGTgCell

// 在这个方法中添加所有的子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat spcae = 10;
        /** 图标 */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        [iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(spcae);
            make.bottom.equalTo(self.contentView).offset(-spcae);
            make.width.equalTo(80);
        }];

        /** 标题 */
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.top);
            make.left.equalTo(iconImageView.right).offset(spcae);
            make.right.equalTo(self.contentView).offset(-spcae);
            make.height.equalTo(20);
        }];
        
        /** 价格 */
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.textColor = [UIColor orangeColor];
        priceLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        [priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel.left);
            make.bottom.equalTo(iconImageView.bottom);
            make.size.equalTo(CGSizeMake(100, 15));
        }];
        
        /** 购买数 */
        UILabel *buyCountLabel = [[UILabel alloc] init];
        buyCountLabel.textAlignment = NSTextAlignmentRight;
        buyCountLabel.textColor = [UIColor lightGrayColor];
        buyCountLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyCountLabel];
        self.buyCountLabel = buyCountLabel;
        [buyCountLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(iconImageView.bottom);
            make.right.equalTo(titleLabel.right);
            make.size.equalTo(CGSizeMake(150, 14));
            
        }];
    }
    return self;
}

/**
 *  设置子控件的数据
 */
- (void)setTg:(XMGTg *)tg
{
    _tg = tg;
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLabel.text = tg.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",tg.price];
    self.buyCountLabel.text = [NSString stringWithFormat:@"%@人已购买",tg.buyCount];
}
@end
