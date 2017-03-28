//
//  HRBrokenLine.m
//  iPad
//
//  Created by LI on 2017/3/28.
//  Copyright © 2017年 LI. All rights reserved.
//

#import "HRBrokenLine.h"

@interface HRBrokenLine ()<CAAnimationDelegate>

@property (nonatomic, strong) CAShapeLayer *lineChartLayer;
/** 渐变背景视图 */
@property (nonatomic, strong) UIView *gradientBackgroundView;
/** 渐变图层 */
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
/** 颜色数组 */
@property (nonatomic, strong) NSMutableArray *gradientLayerColors;

@end

@implementation HRBrokenLine
static NSInteger countq = 0;
static CGFloat bounceX = 20;
static CGFloat bounceY = 20;

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    /*******画出坐标轴********/
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1);
    CGContextMoveToPoint(context, bounceX, bounceY);
    CGContextAddLineToPoint(context, bounceX, rect.size.height - bounceY);
    CGContextAddLineToPoint(context,rect.size.width -  bounceX, rect.size.height - bounceY);
    CGContextStrokePath(context);
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //创建Y轴的label
        [self createYlabel];
        //设置渐变背景
        [self drawGradientBackgroundView];
        //添加虚线
        [self setLineDash];
    }
    return self;
}

- (void)createYlabel{
    NSArray *array = @[@"192",@"173",@"154",@"134",@"115",@"96",@"77"];
    for (int i = 0; i < array.count; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,(self.frame.size.height - 2 * bounceY)/array.count * i + bounceX, bounceY, bounceY/2.0)];
        label.text = array[i];
        label.tag = 2000 + i;
        label.font = [UIFont systemFontOfSize:10];
        [self addSubview:label];
    }
}

#pragma mark 添加虚线
- (void)setLineDash{
    for (NSInteger i = 0;i < 7; i++ ) {
        CAShapeLayer * dashLayer = [CAShapeLayer layer];
        dashLayer.strokeColor = [UIColor whiteColor].CGColor;
        dashLayer.fillColor = [[UIColor clearColor] CGColor];
        dashLayer.lineDashPattern = @[@2,@2];
        // 默认设置路径宽度为0，使其在起始状态下不显示
        dashLayer.lineWidth = 1.0;
        
        UILabel * label1 = (UILabel*)[self viewWithTag:2000 + i];
        
        UIBezierPath *path = [[UIBezierPath alloc]init];
        path.lineWidth = 1.0;
        [path moveToPoint:CGPointMake( 0, label1.frame.origin.y - bounceY)];
        [path addLineToPoint:CGPointMake(self.frame.size.width - 2*bounceX,label1.frame.origin.y - bounceY)];
        CGFloat dash[] = {1,1};
        [path setLineDash:dash count:2 phase:0];
        [[UIColor blueColor] setStroke];
        [path stroke];
        dashLayer.path = path.CGPath;
        [self.gradientBackgroundView.layer addSublayer:dashLayer];
    }
}

#pragma mark 画折线图
- (void)drawLine{
    UILabel * label = (UILabel*)[self viewWithTag:1000];
    UIBezierPath * path = [[UIBezierPath alloc]init];
    path.lineWidth = 1.0;
    [path moveToPoint:CGPointMake(label.frame.origin.x - bounceX, (200 - arc4random()%200) /200.0 * (self.frame.size.height - bounceY * 2))];
    
    //创建折现点标记
    for (NSInteger i = 1; i < self.time.integerValue / 5 + 2; i++) {
        UILabel * label1 = (UILabel*)[self viewWithTag:1000 + i];
        CGFloat  arc = arc4random()%200;
        [path addLineToPoint:CGPointMake(label1.frame.origin.x - bounceX,  (200 -arc) /200.0 * (self.frame.size.height - bounceY*2 ))];
        UILabel * falglabel = [[UILabel alloc]initWithFrame:CGRectMake(label1.frame.origin.x , (200 - arc) /200.0 * (self.frame.size.height - bounceY*2 )+ bounceY, 30, 15)];
        falglabel.tag = 3000 + i;
        falglabel.text = [NSString stringWithFormat:@"%.1f",arc];
        falglabel.font = [UIFont systemFontOfSize:8.0];
        [self addSubview:falglabel];
    }
    
    self.lineChartLayer = [CAShapeLayer layer];
    self.lineChartLayer.path = path.CGPath;
    self.lineChartLayer.strokeColor = [UIColor whiteColor].CGColor;
    self.lineChartLayer.fillColor = [[UIColor clearColor] CGColor];
    // 默认设置路径宽度为0，使其在起始状态下不显示
    self.lineChartLayer.lineWidth = 0;
    self.lineChartLayer.lineCap = kCALineCapRound;
    self.lineChartLayer.lineJoin = kCALineJoinRound;
    
    [self.gradientBackgroundView.layer addSublayer:self.lineChartLayer];//直接添加导视图上
}

- (void)setTime:(NSString *)time{
    _time = time;
    
    NSInteger range = time.integerValue / 5 + 2;
    for (int i = 0; i < range; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width - 2*bounceX)/range * i + bounceX, self.frame.size.height - bounceY + bounceY*0.3, (self.frame.size.width - 2*bounceX)/range - 5, bounceY/2)];
        label.text = [NSString stringWithFormat:@"%d",i * 5];
        label.font = [UIFont systemFontOfSize:10];
        label.tag = 1000 + i;
        label.transform = CGAffineTransformMakeRotation(M_PI * 0.3);
        [self addSubview:label];
    }
}

#pragma mark 渐变的颜色
- (void)drawGradientBackgroundView {
    // 渐变背景视图（不包含坐标轴）
    self.gradientBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(bounceX, bounceY, self.bounds.size.width - bounceX*2, self.bounds.size.height - 2*bounceY)];
    [self addSubview:self.gradientBackgroundView];
    /** 创建并设置渐变背景图层 */
    //初始化CAGradientlayer对象，使它的大小为渐变背景视图的大小
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.gradientBackgroundView.bounds;
    //设置渐变区域的起始和终止位置（范围为0-1），即渐变路径
    self.gradientLayer.startPoint = CGPointMake(0, 0.0);
    self.gradientLayer.endPoint = CGPointMake(1.0, 0.0);
    //设置颜色的渐变过程
    self.gradientLayerColors = [NSMutableArray arrayWithArray:@[(__bridge id)[UIColor colorWithRed:253 / 255.0 green:164 / 255.0 blue:8 / 255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:251 / 255.0 green:37 / 255.0 blue:45 / 255.0 alpha:1.0].CGColor]];
    self.gradientLayer.colors = self.gradientLayerColors;
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.gradientBackgroundView.layer addSublayer:self.gradientLayer];
}

#pragma mark 点击重新绘制折线和背景
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    countq++;
    if (countq % 2 == 0) {
        [self.lineChartLayer removeFromSuperlayer];
        for (NSInteger i = 0; i < self.time.integerValue / 5 + 2; i++) {
            UILabel * label = (UILabel*)[self viewWithTag:3000 + i];
            [label removeFromSuperview];
        }
    }else{
        [self drawLine];
        self.lineChartLayer.lineWidth = 2;
        CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        pathAnimation.duration = 3;
        pathAnimation.repeatCount = 1;
        pathAnimation.removedOnCompletion = YES;
        pathAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
        pathAnimation.toValue = [NSNumber numberWithFloat:1.0f];
        // 设置动画代理，动画结束时添加一个标签，显示折线终点的信息
        [self.lineChartLayer addAnimation:pathAnimation forKey:@"strokeEnd"];
    }
}
@end
