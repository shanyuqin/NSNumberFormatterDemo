//
//  NumberFormatterCell.m
//  NSNumberFormatterDemo
//
//  Created by shanyuqin on 2019/5/23.
//  Copyright © 2019 ShanYuQin. All rights reserved.
//

#import "NumberFormatterCell.h"

@interface NumberFormatterCell()
@property (weak, nonatomic) IBOutlet UILabel *showStyleLabel;
@property (weak, nonatomic) IBOutlet UILabel *originValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *changeFormaterLabel;
@property (weak, nonatomic) IBOutlet UILabel *changetitleLabel;

@end


@implementation NumberFormatterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 30;
    self.originValueLabel.preferredMaxLayoutWidth = width;
    self.showStyleLabel.preferredMaxLayoutWidth = width;
}

- (void)setCell:(NSString *)showStyle chineseShowStyle:(NSString *)chineseShowStyle  originValue :(NSString *)originValue  formaterTitle :(NSString *)formaterTitle   changeFormater:(NSString *)changeFormater {
    self.showStyleLabel.text = [NSString stringWithFormat:@"FormatterStyle:\n%@ -- %@",showStyle,chineseShowStyle];
    self.originValueLabel.text = [NSString stringWithFormat:@"当前style数字样式:\n%@",originValue];
    self.changetitleLabel.text = [NSString stringWithFormat:@"对样式进行的修改：\n%@",formaterTitle];
    self.changeFormaterLabel.text = [NSString stringWithFormat:@"修改style后的数字样式：\n%@",changeFormater];
    
}
@end
