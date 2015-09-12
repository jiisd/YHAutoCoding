//
//  ViewController.m
//  Demo
//
//  Created by 郑亚恒 on 15/8/25.
//  Copyright © 2015年 郑亚恒. All rights reserved.
//
#define localPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userDate.plist"]

#import "ViewController.h"
#import "UserAccountModel.h"
#import "UIButton+Demo.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *archiverBtn;
@property (nonatomic, strong) UIButton *unArchiverBtn;
@property (nonatomic, strong) UIButton *clearDataBtn;
@property (nonatomic, strong) UserAccountModel *userModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - 加载数据

- (void)loadUserData {
    NSDictionary *dict = @{
                           @"userId" : @"001",
                           @"avatar" : [NSNull null],
                           @"username" : @"iOS",
                           @"email" : @"yahengzheng@163.com",
                           @"zx_balance" : @"999",
                           @"zs_balance" : @"111"
                           };
    
    self.userModel = [UserAccountModel accountModelWithDict:dict];
    //    NSLog(@"%@",self.userModel);
}
     
#pragma mark - 准备界面

#define btnHeight   40
#define leftMargin  20
#define rightMargin 20
#define topMargin   90
#define btnSpace    30

- (void)setupUI {
    [self.view addSubview:self.archiverBtn];
    [self.view addSubview:self.unArchiverBtn];
    [self.view addSubview:self.clearDataBtn];
    
    NSDictionary *views = @{
                        @"archiverBtn":self.archiverBtn,
                        @"unArchiverBtn":self.unArchiverBtn,
                        @"clearDataBtn":self.clearDataBtn
                            };
    
    NSDictionary *metrics = @{
                        @"btnHeight":@btnHeight,
                        @"leftMargin":@leftMargin,
                        @"rightMargin":@rightMargin,
                        @"topMargin":@topMargin,
                        @"btnSpace":@btnSpace
                              };
    
    self.archiverBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[archiverBtn]-rightMargin-|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[archiverBtn(==btnHeight)]" options:0 metrics:metrics views:views]];
    
    self.unArchiverBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[unArchiverBtn]-rightMargin-|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[archiverBtn]-btnSpace-[unArchiverBtn(==btnHeight)]" options:0 metrics:metrics views:views]];
    
    self.clearDataBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[clearDataBtn]-rightMargin-|" options:0 metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[unArchiverBtn]-btnSpace-[clearDataBtn(==btnHeight)]" options:0 metrics:metrics views:views]];
    
}

#pragma mark - 点击按钮触发的方法

- (void)archiver {
    
   [self loadUserData];
    
   BOOL flag = [NSKeyedArchiver archiveRootObject:self.userModel toFile:localPath];
    
    if (flag) {
        NSLog(@"归档成功,路径如下:--------------------------");
        NSLog(@"%@",localPath);
    }else {
        NSLog(@"归档失败");
    }
}

- (void)unArchiver {
    self.userModel = [NSKeyedUnarchiver unarchiveObjectWithFile:localPath];
    
//    NSString *str = self.userModel ? @"解档成功" : @"解档失败";
//    NSLog(@"%@",str);
    
    if (self.userModel) {
         NSLog(@"解档成功,内容如下:--------------------------");
        NSLog(@"%@",self.userModel);
    }else {
        NSLog(@"解档失败,请先归档");
    }
}

- (void)clearData {
    self.userModel = nil;
    BOOL flag = [NSKeyedArchiver archiveRootObject:self.userModel toFile:localPath];
    
    if (flag) {
        NSLog(@"清除用户数据成功");
    }else {
        NSLog(@"清除用户数据失败");
    }
}

#pragma mark - 控件懒加载

- (UIButton *)archiverBtn {
    if (!_archiverBtn) {
        
        _archiverBtn = [UIButton buttonWithTitle:@"点 击 归 档" titleColor:[UIColor blueColor] borderColor:[UIColor lightGrayColor] borderWidth:1];
        
        [_archiverBtn addTarget:self action:@selector(archiver) forControlEvents:UIControlEventTouchUpInside];
    }
    return _archiverBtn;
}

- (UIButton *)unArchiverBtn {
    if (!_unArchiverBtn) {
        
        _unArchiverBtn = [UIButton buttonWithTitle:@"点 击 解 档" titleColor:[UIColor blueColor] borderColor:[UIColor lightGrayColor] borderWidth:1];
        
        [_unArchiverBtn addTarget:self action:@selector(unArchiver) forControlEvents:UIControlEventTouchUpInside];
    }
    return _unArchiverBtn;
}

- (UIButton *)clearDataBtn {
    if (!_clearDataBtn) {
        
        _clearDataBtn = [UIButton buttonWithTitle:@"点 击 清 除 用 户 数 据" titleColor:[UIColor blueColor] borderColor:[UIColor lightGrayColor] borderWidth:1];

        [_clearDataBtn addTarget:self action:@selector(clearData) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearDataBtn;
}


@end
