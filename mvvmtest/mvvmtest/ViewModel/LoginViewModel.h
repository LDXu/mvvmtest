//
//  LoginViewModel.h
//  mvvmtest
//
//  Created by XuBill on 2016/12/4.
//  Copyright © 2016年 xubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LoginViewModel;
@protocol ViewModelDelegate <NSObject>
@optional
-(void)loadDataSuccess:(LoginViewModel*)viewModel;
-(void)loadDataFailure:(LoginViewModel*)viewModel;
@end

@interface LoginViewModel : NSObject
@property(nonatomic,weak)id<ViewModelDelegate> viewModelDelegate;
@property (nonatomic, assign, readonly) BOOL isLogined;
- (void)loginStateWithAccount:(NSString*)account pwd:(NSString*)pwd;
@end
