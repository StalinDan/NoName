//
//  NNRDVTabbarVC.m
//  NoName
//
//  Created by Danish on 2018/10/26.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "NNRDVTabbarVC.h"
#import "NNVideoVC.h"
#import "NNChatVC.h"
#import "NNShopVC.h"
#import "NNMineVC.h"
#import "BaseNavVC.h"
#import <RDVTabBarItem.h>

@interface NNRDVTabbarVC ()<RDVTabBarControllerDelegate>
{
    NSInteger selectedTabBarIiemTag;
}
@end

@implementation NNRDVTabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NNVideoVC *videoVC = [[NNVideoVC alloc]init];
    videoVC.title = @"视频";
    BaseNavVC *videoNavVC = [[BaseNavVC alloc]initWithRootViewController:videoVC];
    
    NNChatVC *chatVC = [[NNChatVC alloc]init];
    BaseNavVC *chatNavVC = [[BaseNavVC alloc]initWithRootViewController:chatVC];
    
    NNShopVC *shopVC = [[NNShopVC alloc]init];
    BaseNavVC *shopNavVC = [[BaseNavVC alloc]initWithRootViewController:shopVC];
    
    NNMineVC *mineVC = [[NNMineVC alloc]init];
    BaseNavVC *myNavVC = [[BaseNavVC alloc]initWithRootViewController:mineVC];
    
    self.viewControllers = @[videoNavVC,chatNavVC,shopNavVC,myNavVC];
    
    [self customizeTabBarForController:self];

    self.delegate = self;
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarController {
    NSArray *tabbarSelectedImages = @[@"tabbar_home_selected",@"tabbar_order_selected",@"tabbar_message_selected",@"tabbar_my_selected"];
    NSArray *tabbarUnSelectedImages = @[@"tabbar_home_unSelected",@"tabbar_order_unSelected",@"tabbar_message_unSelected",@"tabbar_my_unSelected"];
    NSArray *tabbarTitles = @[@"视频",@"购物车",@"消息",@"我的"];
    int index = 0;
    for (RDVTabBarItem *tabBarItem in [[tabBarController tabBar] items]) {
        
        tabBarItem.title = [NSString stringWithFormat:@"%@",tabbarTitles[index]];
         //修改tabberItem的title颜色
        NSDictionary *selectedTitleDic = @{NSForegroundColorAttributeName:NN_COLOR_Tabbar_Selected,NSFontAttributeName:NN_FONT(16)};
        tabBarItem.selectedTitleAttributes = selectedTitleDic;
        
        NSDictionary *unSelectedTitleDic = @{NSForegroundColorAttributeName:NN_COLOR_Tabbar_UnSelected,NSFontAttributeName:NN_FONT(16)};
        tabBarItem.unselectedTitleAttributes = unSelectedTitleDic;
        
        UIImage *selectedImg = IMAGE(tabbarSelectedImages[index]);
        UIImage *unSelectedImg = IMAGE(tabbarUnSelectedImages[index]);
        
        //设置tabberItem的选中和未选中图片
        [tabBarItem setFinishedSelectedImage:selectedImg withFinishedUnselectedImage:unSelectedImg];
        tabBarItem.tag = index + 100;
        index ++;
        
    }
}

- (BOOL)tabBarController:(RDVTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (selectedTabBarIiemTag == viewController.rdv_tabBarItem.tag) {
        return NO;
    } else {
        selectedTabBarIiemTag = viewController.rdv_tabBarItem.tag;
        return YES;
    }
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
