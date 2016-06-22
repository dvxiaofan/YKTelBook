//
//  YKMenu.m
//  YKTelBook
//
//  Created by xiaofans on 16/6/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "YKMenu.h"

@implementation YKMenu

- (instancetype)init
{
    self = [super init];
    if (self) {
        _itemsArray = @[@"增加一个联系人",@"删除一个联系人",@"修改一个联系人",@"查找联系人",@"显示所有联系人",@"退出系统"];
        _telBook = [[YKTelBook alloc] init];
    }
    return self;
}

- (void)showMenu {
    int nn = 0;
    for (NSString *str in _itemsArray) {
        nn++;
        printf("%d、%s\n", nn, [str UTF8String]);
    }
}

- (BOOL)inPut {
    char ch[2];//
    printf("请输入您想进行的操作编号(1-6)：");
    scanf("%s",ch);
    ch[1] = '\0';//斩断多余输入字符串
    if (strcmp(ch, "1") == 0)
    {
        if ([_telBook addPerson])
        {
            printf("联系人添加成功！\n");
        }
        else
        {
            printf("联系人添加失败！\n");
        }
    }
    else if (strcmp(ch, "2") == 0)
    {
        [_telBook deledatePerson];
    }
    else if (strcmp(ch, "3") == 0)
    {
        [_telBook updatePerson];
    }
    else if (strcmp(ch, "4") == 0)
    {
        [_telBook findPerdon];
    }
    else if (strcmp(ch, "5") == 0)
    {
        [_telBook showAllPerson];
    }
    else if (strcmp(ch, "6") == 0)
    {
        return YES;
    }
    else
    {
        printf("对不起，您的输入有误！\n");
    }
    return NO;
}






@end
