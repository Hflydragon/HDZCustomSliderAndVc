//
//  BaseViewController.m
//  GFDouBanDemo
//
//  Created by 黄feilong on 16/11/7.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUp];
}

- (void)setUp
{
    self.automaticallyAdjustsScrollViewInsets= YES;
    
    self.width = [UIScreen mainScreen].bounds.size.width;
    
    self.height = [UIScreen mainScreen].bounds.size.height;
}

- (void)useInteractivePopGesture
{
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)pushViewController:(NSString *)viewControllerName
{
    if(self.navigationController == nil) return;
    [self.navigationController pushViewController:[[NSClassFromString(viewControllerName) alloc] init] animated:YES];
}

- (void)popViewController
{
    if(self.navigationController == nil) return;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRootViewController
{
    if(self.navigationController == nil) return;
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popToViewController:(NSString *)viewControllerName
{
    if(self.navigationController == nil) return;
    
    [self.navigationController popToViewController:[[NSClassFromString(viewControllerName) alloc] init] animated:YES];

}

@synthesize enableUseInteractivePopGesture = _enableUseInteractivePopGesture;
-(void)setEnableUseInteractivePopGesture:(BOOL)enableUseInteractivePopGesture
{
    _enableUseInteractivePopGesture                            = enableUseInteractivePopGesture;
    self.navigationController.interactivePopGestureRecognizer.enabled = enableUseInteractivePopGesture;
}

- (BOOL)enableInteractivePopGestureRecognizer {
    
    return _enableUseInteractivePopGesture;
}


@end
