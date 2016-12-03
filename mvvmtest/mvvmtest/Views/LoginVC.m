//
//  LoginVC.m
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "LoginModel.h"
#import "LoginViewModel.h"
@interface LoginVC ()<ViewModelDelegate>
{
    LoginModel *Lmodel;
}
@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) LoginViewModel *viewModel;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self initLoginModel];
    [self initLoginView];

}

- (void)initLoginModel{

    Lmodel = [LoginModel shareInstance];
    
}

- (void)initLoginView{

    [self.view addSubview:self.loginView];

}

-(void)bindViewModel{

    self.viewModel=[[LoginViewModel alloc]init];
    self.viewModel.viewModelDelegate=self;
    
}

- (void)loadDataSuccess:(LoginViewModel *)viewModel{

    NSLog(@"Y");
    if (viewModel.isLogined) {
        NSLog(@"这边可以放返回数据,vm的只读属性");
    }
    
}

- (void)loadDataFailure:(LoginViewModel *)viewModel{

    NSLog(@"N");
    if (!viewModel.isLogined) {
        NSLog(@"这边可以放返回数据,vm的只读属性");
    }
    
}

- (LoginView*)loginView{

    if (!_loginView) {
        LoginView *loginV = [[[NSBundle mainBundle]loadNibNamed:@"LoginView" owner:nil options:nil]objectAtIndex:0];
        loginV.frame = self.view.bounds;
        _loginView = loginV;
        kWeakSelf(self);
        _loginView.loginBlock = ^(NSString *account,NSString *pwd){
            [weakself.viewModel loginStateWithAccount:account pwd:pwd];
        };
    }
    return _loginView;
    
}

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
