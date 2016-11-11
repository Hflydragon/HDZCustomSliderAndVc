//
//  ViewController.m
//  HDZCustSliderAndVc
//
//  Created by 黄feilong on 16/11/11.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "ViewController.h"
#import "HDZManager.h"
#define Kwidth [UIScreen mainScreen].bounds.size.width

#define Keight [UIScreen mainScreen].bounds.size.height

@interface ViewController () <HDZCustomSliderVCDelegate>
@property (nonatomic,strong)HDZCustomMenusScroll *menu;

@property (nonatomic,strong)NSArray *titleArray;

@property (nonatomic,strong)HDZCustomSliderVC *customSliderVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置滑动的条目菜单
    self.titleArray = @[@"电影",@"读书",@"电视",@"活动",@"音乐",@"段子",@"各种",@"新闻"];
    
    HDZCustomMenusScroll *menu = [[HDZCustomMenusScroll alloc] initWithFrame:CGRectMake(0, 20, Kwidth, 40)];
    [menu setUpTitleArrays:self.titleArray];
    [self.view addSubview:menu];
    self.menu = menu;
    menu.menuScrollerDidSelectItem = ^(HDZCustomMenusScroll *menu,NSString *title,NSUInteger index){
        self.customSliderVC.selectIndex = index;
    };
    [menu clickDefault];
    [self.customSliderVC reloadData];
}


-(HDZCustomSliderVC *)customSliderVC
{
    if (_customSliderVC==nil) {
        _customSliderVC = [[HDZCustomSliderVC alloc] init];
        _customSliderVC.childViewControllersArray = @[@"BaseViewController",@"BaseViewController",@"BaseViewController",@"BaseViewController",@"BaseViewController",@"BaseViewController",@"BaseViewController",@"BaseViewController"];
        [_customSliderVC willMoveToParentViewController:self];
        _customSliderVC.view.frame = CGRectMake(0,CGRectGetMaxY(self.menu.frame), Kwidth, Keight - CGRectGetMaxY(self.menu.frame));
        _customSliderVC.delegate = self;
        [self addChildViewController:_customSliderVC];
        [self.view addSubview:_customSliderVC.view];
    }
    return _customSliderVC;
}

#pragma mark HDZCustomSliderVCDelegate
-(NSInteger)numberOfChildVCInCustomSliderVC
{
    return self.titleArray.count;
}
- (void)customSliderDidScroll:(UIScrollView *)scroll andSegmentPage:(NSInteger)page
{
    if(page==self.menu.selectedindex) return;
    self.menu.selectedindex  = page;
}

- (NSString *)firstControllerData
{
    return nil;
}

@end
