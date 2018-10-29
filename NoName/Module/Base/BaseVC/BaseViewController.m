//
//  BaseViewController.m
//  NoName
//
//  Created by Danish on 2018/10/24.
//  Copyright © 2018 Danish. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

#pragma mark- overwrite methods

- (BOOL)isHideNavgationBar {
    return NO;
}

- (void)goToBack {
    UIViewController *vc = [self.navigationController popViewControllerAnimated:YES];
    if (vc == nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)addBackButton {
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(goToBack)];
    item.style = UIBarButtonItemStylePlain;
    self.navigationItem.leftBarButtonItem = item;
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
