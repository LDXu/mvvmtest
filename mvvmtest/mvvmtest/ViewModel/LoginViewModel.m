//
//  LoginViewModel.m
//  mvvmtest
//
//  Created by XuBill on 2016/12/4.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginModel.h"
@interface LoginViewModel ()
@property (nonatomic, strong) LoginModel *model;
@end

@implementation LoginViewModel

- (void)loginStateWithAccount:(NSString*)account pwd:(NSString*)pwd{

    _model = [LoginModel shareInstance];
    _model.account = account;
    _model.pwd = pwd;
    [_model loginStateSuccess:^{
        _isLogined = YES;
        if ([self.viewModelDelegate respondsToSelector:@selector(loadDataSuccess:)]) {
            [self.viewModelDelegate loadDataSuccess:self];
        }
    } faile:^{
        _isLogined = NO;
        if ([self.viewModelDelegate respondsToSelector:@selector(loadDataFailure:)]) {
            [self.viewModelDelegate loadDataFailure:self];
        }
    }];

}
@end
