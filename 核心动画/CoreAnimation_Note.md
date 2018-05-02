UIView背后关联的图层是真正用来在屏幕上显示和做动画。UIView仅仅是对它的封装，提供iOS类似于处理触摸的具体功能，以及Core Animation底层方法的高级接口。

视图层级  图层树  呈现树  渲染树

Layer的功能

* 阴影，圆角，带颜色的边框

* 3D变换

* 非矩形范围

* 透明遮罩

* 多级非线性动画

---

点就像是虚拟的像素，也被称为逻辑像素，

---
CALayer有一个可选的delegate属性，实现CALayerDelegate协议，当CALayer需要一个内容特定的信息时，就会从协议中请求。
UIView是其layer的<CALayerDelegate>的代理
“当UIView创建了它的宿主图层时，它就会自动地把图层的delegate设置为它自己，并提供了一个-displayLayer:的实现”

```
(lldb) po self.view
<UIView: 0x7fcdfa305c70; frame = (0 0; 414 736); autoresize = W+H; layer = <CALayer: 0x6000000251e0>>

(lldb) po self.view.layer
<CALayer:0x6000000251e0; position = CGPoint (207 368); bounds = CGRect (0 0; 414 736); delegate = <UIView: 0x7fcdfa305c70; frame = (0 0; 414 736); autoresize = W+H; layer = <CALayer: 0x6000000251e0>>; sublayers = (<CALayer: 0x600000025460>); allowsGroupOpacity = YES; backgroundColor = <CGColor 0x6000000b1100> [<CGColorSpace 0x6080000b1b20> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1; extended range)] ( 1 1 1 1 )>

(lldb) po self.view.layer.delegate
<UIView: 0x7fcdfa305c70; frame = (0 0; 414 736); autoresize = W+H; layer = <CALayer: 0x6000000251e0>>

(lldb) 

```

UIView的center对应CALayer的position；两个对应的属性都对应了相对于父视图层anchorPoint所在的位置。


当对图层做变换的时候，例如旋转或者缩放，frame实际上代表了覆盖在图层旋转之后的整个轴对齐的矩形区域，这时，frame的宽高可能就会bounds的宽高不一样了。

图层的anchorPoint用单位坐标来描述。默认坐标是{0.5,0.5}

zposition属性用来改变图层的显示顺序，但不能改变事件的传递顺序。

conrnerRadius这个属性只影响背景颜色，不会影响背景图片或是子图层。masksToBounds设置为YES的话，图层里边的所有东西都会被截取。

图层的边框是绘制在图层边界里边的。而且在所有字内容之前，也就是在子图层之前。边框会在寄宿图和子图层的上边。

“和图层边框不同，图层的阴影继承自内容的外形，而不是根据边界和角半径来确定。为了计算出阴影的形状，Core Animation会将寄宿图（包括子视图，如果有的话）考虑在内，然后通过这些来完美搭配图层形状从而创建一个阴影”

mask属性就像是一个饼干切割机，mask图层实心的部分会被保留下来，其他的则会被抛弃。

view.layer.magnificationFilter = kCAFilterNearest;放大
minificationFilter缩小
kCAFilterLinear 二线性过滤
kCAFilterNearest 最近过滤
kCAFilterTrilinear 三线性过滤
“线性过滤保留了形状，最近过滤则保留了像素的差异。

CALayer的doubleSided属性来控制是否是双面绘图。
**隐式动画**

“改变属性时CALayer自动应用的动画称作行为”

摘录来自: 钟声. “ios核心动画高级技巧。” iBooks. 

Core Animation通常对CALayer的所有属性(可以做动画的属性)做动画，但是UIView把关联的图层的这个特性关闭了。(就是说，创建一个layer改变其颜色属性，有默认的动画，但是如果直接用view.layer来改变其颜色属性，是没有隐式动画效果的)

```
当CALayer的属性改变时：
1，图层首先检测自己是否有委托代理(UIView的layer的话，view就是该layer的代理<CALayerDelegate>),是否实现- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event;如果有，直接调用并返回结果。
2，如果没有代理，或者没有实现上述方法，图层直接检查包含属性名称对应行为映射的actions字典。
3，如果actions字典里没有对应的属性，图层接着在它的style字典里接着搜索属性名。
4，若在style里面也找不到对应的行为，图层则会直接调用定义了每个属性的标准行为的defaultActionForKey方法。
所以一轮完整的搜索结束之后，-actionForKey:要么返回空（这种情况下将不会有动画发生），要么是CAAction协议对应的对象，最后CALayer拿这个结果去对先前和当前的值做动画。

“当不在一个动画块的实现中，UIView对所有图层行为返回nil，但是在动画block范围之内，它就返回了一个非空值”
```

CAAnimation子类有
//CAPropertyAnimation的子类, CAPropertyAnimation继承于CAAnimation

* CAKeyframeAnimation
* CABasicAnimation

//CAAnimation

* CATransition
* CAAnimationGroup


```
    ///可以通过设置图层的speed属性来控制所有该图层上的动画效果。
    self.window.layer.speed = 0;
    
```

beginTime指定了动画开始之前的延迟时间。
timeOffset和beginTime类似，但是和增加beginTime导致的延迟动画不同，增加timeOffset只是让动画快进到某一点，beginTime受speed的影响，timeOffset不受speed的影响。

事务中可以是设置动画的时间函数

```
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
```

时间函数的构造方法`[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]`有以下四个选项

//线性计时函数
kCAMediaTimingFunctionLinear 
//慢慢加速然后突然停止
kCAMediaTimingFunctionEaseIn 
//全速开始，慢慢减速
kCAMediaTimingFunctionEaseOut 
//慢慢加速 后慢慢减速
kCAMediaTimingFunctionEaseInEaseOut
//和上边的效果类似
kCAMediaTimingFunctionDefault”





















































































































































































































































































































































































