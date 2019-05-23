//
//  NumberFormatterCell.h
//  NSNumberFormatterDemo
//
//  Created by shanyuqin on 2019/5/23.
//  Copyright © 2019 ShanYuQin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumberFormatterCell : UITableViewCell
- (void)setCell:(NSString *)showStyle chineseShowStyle:(NSString *)chineseShowStyle  originValue :(NSString *)originValue  formaterTitle :(NSString *)formaterTitle   changeFormater:(NSString *)changeFormater;
@end

NS_ASSUME_NONNULL_END
