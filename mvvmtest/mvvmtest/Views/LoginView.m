//
//  LoginView.m
//  MVCTest
//
//  Created by XuBill on 16/9/3.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()
@property (weak, nonatomic) IBOutlet UITextField *account;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@end

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    [super awakeFromNib];
    _loginBtn.enabled = NO;
    [self registerObservers];
}

#pragma mark - 观察者
-(void)registerObservers{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onTextDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];
    [_pwd addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)removeObservers{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    [_pwd removeObserver:self forKeyPath:@"text"];
}

-(void)onTextDidChanged:(NSNotification*)noti{
    
    if  (_account.text.length&&_pwd.text.length) {
        _loginBtn.enabled = YES;
    }else{
        _loginBtn.enabled = NO;
    }

}

- (IBAction)login:(id)sender {
    
    if (!_account.hasText||!_pwd.hasText) {
        NSLog(@"弹出提示没有填写");
        return;
    }
    if (self.loginBlock) {
        _loginBlock(_account.text, _pwd.text);
    }
    
}

- (void)dealloc{
    [self removeObservers];
}

@end
