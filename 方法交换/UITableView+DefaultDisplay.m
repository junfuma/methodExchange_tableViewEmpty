//
//  UITableView+DefaultDisplay.m
//  方法交换
//
//  Created by 开拍网ios研发 on 2018/11/1.
//  Copyright © 2018年 开拍网ios研发. All rights reserved.
//

#import "UITableView+DefaultDisplay.h"
#import <objc/message.h>

const  char LGDefaultView ;
@implementation UITableView (DefaultDisplay)


+ (void)load{
//    只加载一次
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken , ^{
        Method orignMethod = class_getInstanceMethod(self, @selector(reloadData));
        
        Method currentMethod = class_getInstanceMethod(self, @selector(MJF_reloadData));

        method_exchangeImplementations(orignMethod, currentMethod);
    });
    
}

- (void)MJF_reloadData{
    [self MJF_reloadData];//调用系统的reloadData
    [self fillDefaultView];//处理自己的
}

- (void)fillDefaultView{
    id<UITableViewDataSource> dataSource = self.dataSource ;
    NSInteger section = ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]?[dataSource numberOfSectionsInTableView:self] :1);
    
    
    NSInteger   rows = 0 ;
    for (int i = 0; i<section; i++) {
        rows = [dataSource tableView:self numberOfRowsInSection:section];
    }
    
    if (!rows) {
//
        self.lgDefaultView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
        self.lgDefaultView.backgroundColor = [UIColor redColor];
        [self addSubview:self.lgDefaultView];
    }else{
        self.lgDefaultView.hidden = YES;
    }

}

#pragma mark -  getter/setter

- (void)setLgDefaultView:(UIView *)lgDefaultView
{
    objc_setAssociatedObject(self, &LGDefaultView, lgDefaultView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)lgDefaultView
{
   return objc_getAssociatedObject(self, &LGDefaultView);
}
@end
