//
//  main.m
//  YKTelBook
//
//  Created by xiaofans on 16/6/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKMenu.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 菜单
        // 添加练习人
        // 删除联系人
        // 修改联系
        // 查找
        // 显示所有联系人
        // 退出系统
        
        YKMenu *menu = [[YKMenu alloc] init];
        while (1) {
            [menu showMenu];
            if ([menu inPut]) {
                break;
            }
        }
    }
    return 0;
}
