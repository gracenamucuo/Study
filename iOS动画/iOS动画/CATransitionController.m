//
//  CATransitionController.m
//  iOS动画
//
//  Created by 戴运鹏 on 2017/10/2.
//  Copyright © 2017年 戴运鹏. All rights reserved.
//

#import "CATransitionController.h"

@interface CATransitionController ()
@property (nonatomic,strong)UIImageView *imgV;
@end

@implementation CATransitionController
//转场动画的用处
    //imageView切换图片，控制器的push或modal，UIView对象调用exchangeSubviewAtIndex：WithIndex：方法的时候可以出发转场动画
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * bu = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [bu setBackgroundColor:[UIColor yellowColor]];
    [bu setFrame:CGRectMake(200, 200, 100, 100)];
    [self.view addSubview:bu];
    [bu addTarget:self action:@selector(a:) forControlEvents:(UIControlEventTouchUpInside)];
    self.view.backgroundColor = [UIColor grayColor];
    UIImageView * redView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    redView.image = [UIImage imageNamed:@"1"];
    [self.view addSubview:redView];
    self.imgV = redView;
}
-(void)a:(UIButton *)btn
{
    CATransition *animation = [CATransition animation];
    animation.duration = 5;
    animation.fillMode = kCAFillModeForwards;
    animation.type = @"rippleEffect";
    animation.subtype = kCATransitionFromTop;
    [self.imgV.layer addAnimation:animation forKey:@"ripple"];
    self.imgV.image = [UIImage imageNamed:@"2"];
}
/*
 这个动画有两点不同，一个是type,这个属性指定的是动画的主类型，有以下几种可选择的动画：
 
 kCATransitionFade
 kCATransitionMoveIn
 kCATransitionPush
 kCATransitionReveal
 还有一些系统私有的动画但是可以安全使用,但是你只能用字符串
 
 //@"cube" @"moveIn" @"reveal" @"fade"(default) @"pageCurl" @"pageUnCurl" @"suckEffect" @"rippleEffect" @"oglFlip"
 
 
 
 另外一个属性是subType。
 有四种选项：
 
 kCATransitionFromRight
 kCATransitionFromLeft
 kCATransitionFromTop
 kCATransitionFromBottom
 见名知意，就是指动画的方向啦。
 */


/*
 除了图层树之外，系统在内部为我们的layer维持着三分copy。渲染树、呈现树、模型树。
 图层树就是想UIView中的subview、superview一样的图层的树状逻辑。
 他在CAAnimation中的各属性值是不随着动画而实时变化的。
 
 渲染树是系统内部用来处理动画效果的一份copy。并且对我们是不公开的，我们无法调用。
 
 呈现树是动画中每一个瞬时状态的各个属性值得那份copy，他是随着动画实时改变的。可以通过layer的presentationLayer进行访问。
 
 模型树是系统内部用来表示动画目标状态的各属性值的copy，可以通过modelLayer进行访问。

 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
