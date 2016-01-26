//
//  ViewController.m
//  XTPageControl
//
//  Created by admin on 16/1/26.
//  Copyright © 2016年 xt. All rights reserved.
//

#import "ViewController.h"
#import "XTPageViewController.h"
#import "XTSubPageViewController.h"

@interface ViewController ()<XTPageViewControllerDataSource> {
    XTPageViewController *_pageViewController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.title = @"XTPageViewController";
    _pageViewController = [[XTPageViewController alloc] initWithTabBarStyle:XTTabBarStyleCursorHollow];
    _pageViewController.forceLeftAligment = YES;
    _pageViewController.tabBarBackgroundColor = [UIColor whiteColor];
    _pageViewController.dataSource = self;
    
    
    [_pageViewController willMoveToParentViewController:self];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _pageViewController.view.frame = CGRectMake(0, [self.topLayoutGuide length], self.view.bounds.size.width, self.view.bounds.size.height - [self.topLayoutGuide length]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfPages {
    return 2;
}
- (NSString*)titleOfPage:(NSInteger)page {
    return [NSString stringWithFormat:@"我是第%d个标题", page];
}
- (UIViewController*)constrollerOfPage:(NSInteger)page {
    XTSubPageViewController *controller = [[XTSubPageViewController alloc] init];
    return controller;
}

@end
