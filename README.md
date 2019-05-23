
# NSNumberFormatterDemo

## 更改原始符号篇

//接收器用来更改百分比符号的字符串(默认是"%")            
percentSymbol           
//接收器用来更改千分比符号的字符串(默认是"‰")           
perMillSymbol           
//接收器用来更改减号的字符串(默认是"-")           
minusSign           
//接收器用来更改加号的字符串(默认是"+")           
plusSign           
//接收器用来更改指数符号的字符串(默认是"E")           
exponentSymbol           
//更改货币分组分割符号(默认是",")           
currencyGroupingSeparator           
注:上面属性只在numberStyle是 kCFNumberFormatterCurrencyStyle下有用           
//更改小数点样式(默认是".")           
decimalSeparator           
//更改数值是0的样式(千万别误解成将数据中的带有的0全部更改仅仅只有数值的0的时候)           
zeroSymbol           

## 分割尺寸篇
//设置组大小           
groupingSize           
例:数字分割的尺寸 就比如数字越多1234 为了方便就分割开 1,234(这个分割的大小是3) 从后往前数的。           
//设置第二组大小           
secondaryGroupingSize           
例:一些区域允许较大的数字的另一个分组大小的规范。例如，有些地方可能代表一个数字如61,242,378.46（在美国)
作为6,12, 42378.46。在这种情况下，二次分组大小（覆盖小数点最远的数字组）为2
注:小数点前的(大于零的部分)，先从右往左分割groupSize的，如果剩余的在按照secondaryGroupingSize的大小来分。例如 123456.789 如果groupingSize= 4 ，secondaryGroupingSize = 2，则表现结果就是12,3456.789。

## 格式宽度篇
// 格式宽度           
formatWidth           
例  123,45.6 格式宽度就是 8           
//填充符 格式宽度不够时候用的填充           
paddingCharacter           
//填充符的位置           
paddingPosition           
注:以上三个属性常常连接在一起用的           

## 舍入篇
//舍入方式           
roundingMode           
//舍入值           
roundingIncrement           
例:     舍入方式是kCFNumberFormatterRoundHalfUp 舍入值为1   123456.58 变为 123457           
//整数最少几位           
minimumIntegerDigits           
//整数最多几位           
maximumIntegerDigits           
//小数位最多几位数           
maximumFractionDigits           
//小数位最少几位数           
minimumFractionDigits           
//最大值           
maximum           
//最小值           
minimum           
//最少有效数字的位数           
minimumSignificantDigits           
//最多有效数字的位数           
maximumSignificantDigits           
           
### roundingMode
NSNumberFormatterRoundCeiling  取右边最近的整数           
NSNumberFormatterRoundFloor 取左边最近的正数           
NSNumberFormatterRoundDown 去掉小数部分取整，也就是正数取左边，负数取右边，相当于向原点靠近的方向取 1.1->1           
NSNumberFormatterRoundUp  与down相反  1.1->2           
NSNumberFormatterRoundHalfEven 这个比较绕，整数位若是奇数则四舍五入，若是偶数则五舍六入           
NSNumberFormatterRoundHalfDown 五舍六入，负数先取绝对值再五舍六入再负数           
NSNumberFormatterRoundHalfUp 四舍五入，负数原理同上           
