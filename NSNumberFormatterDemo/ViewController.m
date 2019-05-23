//
//  ViewController.m
//  NSNumberFormatterDemo
//
//  Created by shanyuqin on 2019/5/23.
//  Copyright © 2019 ShanYuQin. All rights reserved.
//

#import "ViewController.h"
#import "NumberFormatterCell.h"

@interface ViewController () {
     NSNumber *_number;
}

@property (nonatomic, strong) NSArray *numberStyleArray;
@property (nonatomic, strong) NSArray *numberStyleChineseArray;

@property (nonatomic, strong) NSArray *formattersArray;
@property (nonatomic, strong) NSArray *changeFormattersArray;


@end

@implementation ViewController

- (NSArray *)numberStyleArray {
    if(!_numberStyleArray) {
        _numberStyleArray = @[@"No", @"Decimal", @"Currency", @"Percent", @"Scientific", @"SpellOut",@"Decimal",@"Decimal",@"Decimal",@"Decimal"];
    }
    return _numberStyleArray;
}

- (NSArray *)numberStyleChineseArray {
    if(!_numberStyleChineseArray) {
        _numberStyleChineseArray = @[@"四舍五入的整数", @"小数", @"本地化", @"百分数", @"科学计数", @"朗读",@"小数",@"小数",@"小数",@"小数"];
    }
    return _numberStyleChineseArray;
}



- (NSArray *)formattersArray {
    if (!_formattersArray) {
        //四舍五入的整数
        NSNumberFormatter *noStyleFormatter = [[NSNumberFormatter alloc] init];
        //小数形式,不做任何处理大多数情况下默认显示小数点后的3位
        NSNumberFormatter *decimalFormatter = [[NSNumberFormatter alloc] init];
        //本地化(货币形式数字前面加$)
        NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
        // 百分数形式
        NSNumberFormatter *percentFormatter = [[NSNumberFormatter alloc] init];
        // 科学计数方式
        NSNumberFormatter *scientificFormatter = [[NSNumberFormatter alloc] init];
        //朗读形式
        NSNumberFormatter *spellOutFormatter = [[NSNumberFormatter alloc] init];
        
        NSNumberFormatter *noStyleFormatter2 = [[NSNumberFormatter alloc] init];
        NSNumberFormatter *noStyleFormatter3 = [[NSNumberFormatter alloc] init];
        NSNumberFormatter *noStyleFormatter4 = [[NSNumberFormatter alloc] init];
        NSNumberFormatter *noStyleFormatter5 = [[NSNumberFormatter alloc] init];
        
        
        
        //设置样式
        noStyleFormatter.numberStyle = kCFNumberFormatterNoStyle;
        decimalFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        currencyFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        percentFormatter.numberStyle = NSNumberFormatterPercentStyle;
        scientificFormatter.numberStyle = NSNumberFormatterScientificStyle;
        spellOutFormatter.numberStyle = NSNumberFormatterSpellOutStyle;
        
        noStyleFormatter2.numberStyle = NSNumberFormatterDecimalStyle;
        noStyleFormatter3.numberStyle = NSNumberFormatterDecimalStyle;
        noStyleFormatter4.numberStyle = NSNumberFormatterDecimalStyle;
        noStyleFormatter5.numberStyle = NSNumberFormatterDecimalStyle;
        
        
        
        _formattersArray   = @[noStyleFormatter,
                               decimalFormatter,
                               currencyFormatter,
                               percentFormatter,
                               scientificFormatter,
                               spellOutFormatter,
                               noStyleFormatter2,
                               noStyleFormatter3,
                               noStyleFormatter4,
                               noStyleFormatter5];
        
    }
    return _formattersArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _number = @(-12345.709123);
    [self.tableView registerNib:[UINib nibWithNibName:@"NumberFormatterCell" bundle:nil] forCellReuseIdentifier:@"NumberFormatterCellID"];
    self.changeFormattersArray = [[NSMutableArray alloc] initWithArray:self.formattersArray copyItems:YES];
    self.tableView.rowHeight = 160;
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource -

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    label.text = @"原始数字是：-12345.709123";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:16];
    return label;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberStyleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger row = indexPath.row;
    NumberFormatterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NumberFormatterCellID"];
    
    //获取样式
    NSString *showStyle = [NSString stringWithFormat:@"NSNumberFormatter%@Style",self.numberStyleArray[row]];
    NSString *chineseShowStyle = self.numberStyleChineseArray[row];
    NSNumberFormatter *formatter = self.formattersArray[row];
    NSNumberFormatter *changeFormatter = self.changeFormattersArray[row];
    
    NSString *originStrig = [formatter stringFromNumber:_number];
    NSString *formaterTitle;
    NSString *changeString;
    
    //根据不同的cell,设置样式
    if (row == 0) {
        //小数位最少保留10位小数
        formaterTitle = @"小数位最少保留10位小数";
        changeFormatter.minimumFractionDigits = 10;
        changeString = [changeFormatter stringFromNumber:_number];
    }else if (row == 1) {
        //如果是负数的时候的前缀 用这个字符串代替默认的"-"号
        formaterTitle = @"负数时更改- 前缀";
        changeFormatter.negativePrefix = @"负数";
        changeString = [changeFormatter stringFromNumber:_number];
    }else if (row == 2) {
        //接收的货币分组分隔符 只有currencyFormatter下才有用(默认是,改成//)
        formaterTitle = @"更改货币分组分隔符";
        changeFormatter.currencyGroupingSeparator = @"//";
        changeString = [changeFormatter stringFromNumber:_number];
    }else if (row == 3) {
        //将12.3生成12.3%
        formaterTitle = @"将12.3变成12.3%并更改百分比符号为     %%";
        //缩放因子,你可以将一个数缩放指定比例,然后给其添加后缀
        changeFormatter.multiplier = @1.0f;
        //接收器用来表示百分比符号的字符串。(默认是%,改成%%)
        changeFormatter.percentSymbol = @"%%";
        //最少保留2位小数点
        changeFormatter.minimumFractionDigits = 2;
        changeString = [changeFormatter stringFromNumber:@(12.3)];
    }else if (row == 4) {
        //接收器用来表示指数符号的字符串 (默认是E)。
        formaterTitle = @"改变指数符号E的样式";
        changeFormatter.exponentSymbol = @"ee";
        changeString = [changeFormatter stringFromNumber:_number];
    }else if (row == 5) {
        //将数值0改成零
        formaterTitle = @"更改数值0的样式";
        changeFormatter.zeroSymbol = @"零";
        changeString = [changeFormatter stringFromNumber:@(0)];
    }else if (row == 6) {
        //更改小数点样式
        formaterTitle = @"更改小数点样式";
        changeFormatter.decimalSeparator = @"。";
        changeString = [changeFormatter stringFromNumber:_number];
    }else if (row == 7) {
        formaterTitle = @"更改数字分割";
        //数字分割的尺寸 就比如数字越多1234 为了方便就分割开 1,234(这个分割的大小是3) 从后往前数
        changeFormatter.groupingSize = 2;
        //一些区域允许较大的数字的另一个分组大小的规范。例如，有些地方可能代表一个数字如61，242，378.46（在美国）作为6,12, 42378.46。在这种情况下，二次分组大小（覆盖小数点最远的数字组）为2
        //小数点前的(大于零的部分)，先从右往左分割groupSize的，如果剩余的在按照secondaryGroupingSize的大小来分
        changeFormatter.secondaryGroupingSize = 1;
        changeString = [changeFormatter stringFromNumber:_number];
    }else if (row == 8) {
        formaterTitle = @"更改数字宽度";
        // 格式宽度 出来的数据占位是15个 例如是 123,45.6 格式宽度就是 8
        changeFormatter.formatWidth = 15;
        //填充符 有时候格式宽度够宽，不够就用填充符*填充
        changeFormatter.paddingCharacter = @"*";
        //填充符的位置
        changeFormatter.paddingPosition = kCFNumberFormatterPadAfterSuffix;
        changeString = [changeFormatter stringFromNumber:_number];
    }else if ( row == 9) {
        formaterTitle = @"更改数字舍入方式";
        // 舍入方式
        changeFormatter.roundingMode = NSNumberFormatterRoundHalfUp;
        // 舍入值 比如以1为进位值   123456.58 变为 123457
        changeFormatter.roundingIncrement = @1;
        changeString = [changeFormatter stringFromNumber:_number];
    }
    [cell setCell:showStyle chineseShowStyle:chineseShowStyle originValue:originStrig formaterTitle:formaterTitle changeFormater:changeString];
    if (row %2 == 0) {
        cell.backgroundColor = [UIColor greenColor];
    }else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}


@end
