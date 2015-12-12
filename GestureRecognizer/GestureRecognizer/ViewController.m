//
//  ViewController.m
//  GestureRecognizer
//
//  Created by Joker on 15/12/12.
//  Copyright © 2015年 Joker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

//点击手势 (UITapGestureRecognizer)
//滑动手势 (UISwipeGestureRecognizer)
//旋转手势 (UIRotationGestureRecognizer)
//捏合手势 (UIPinchGestureRecognizer)
//长按手势 (UILongPressGestureRecognizer)
//平移手势 (UIPanGestureRecognizer)
//屏幕边缘平移手势 (UIScreenEdgePanGestureRecognizer)

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //单击手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(single:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:singleTap];
    
    //双击手势
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTap];
    
    //建立单极手势和双击手势之间的关系
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    //滑动手势（有方向  you ） 添加多个方向需要再添加
    UISwipeGestureRecognizer *swipeR = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeR:)];
    swipeR.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeR];
    
    UISwipeGestureRecognizer *swipeL = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeL:)];
    swipeL.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeL];
    
    //旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
    [self.view addGestureRecognizer:rotation];
    
    //长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongPress:)];
    [self.view addGestureRecognizer:longPress];
    
    //平移手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    //[self.view addGestureRecognizer:pan];
    
    //屏幕边缘平移手势  平移 和 这个有冲突
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePan:)];
    edgePan.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:edgePan];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)single:(UITapGestureRecognizer *)gesture {
    NSLog(@"danji %ld",(long)gesture.state);
}
- (void)doubleTap:(UITapGestureRecognizer *)gesture {
    NSLog(@"shuangji %ld",(long)gesture.state);
}

- (void)swipeR:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"huadong direction:%ld state:%ld",gesture.direction, gesture.state);
}

- (void)swipeL:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"huadong direction:%ld state:%ld",gesture.direction, gesture.state);
}

- (void)rotation:(UIRotationGestureRecognizer *)gesture {
    NSLog(@"xuanzhuan rotation:%f Velocity:%f state:%ld",gesture.rotation,gesture.velocity,gesture.state);
}

- (void)LongPress:(UILongPressGestureRecognizer *)gesture {
    NSLog(@"longPress %ld:",gesture.state);
}

- (void)panAction:(UIPanGestureRecognizer *)gesture {
    NSLog(@"pan");
}

- (void)edgePan:(UIScreenEdgePanGestureRecognizer *)gesture {
    NSLog(@"edgepan");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
