//
//  YKTelBook.m
//  YKTelBook
//
//  Created by xiaofans on 16/6/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "YKTelBook.h"
#import "YKPerson.h"


@implementation YKTelBook

- (instancetype)init
{
    self = [super init];
    if (self) {
        _personsArray = [NSKeyedUnarchiver unarchiveObjectWithFile:@"persons.data"];
        if (!_personsArray) {
            _personsArray = [[NSMutableArray alloc] initWithCapacity:1000];
        }
    }
    return self;
}

- (BOOL)addPerson {
    char ch[20];
    
    YKPerson *person = [[YKPerson alloc] init];
    printf("请输入您要添加的联系人姓名：");
    scanf("%s", ch);
    ch[19] = '\0';
    person.name = [NSString stringWithUTF8String:ch];
    
    printf("请输入添加的联系人电话号码：");
    scanf("%s", ch);
    ch[19] = '\0';
    person.telNumber = [NSString stringWithUTF8String:ch];
    
    [_personsArray addObject:person];
    
    [NSKeyedArchiver archiveRootObject:_personsArray toFile:@"persons.data"];
    
    return YES;
}

- (BOOL)deledatePerson {
    char ch[4];
    
    printf("请输入您要删除的联系人编号：");
    scanf("%s",ch);
    ch[3] = '\0';
    
    int n = atoi(ch);
    if (n <= 0 || n > _personsArray.count)
    {
        printf("对不起，您输入的编号不存在！\n");
        return NO;
    }
    
    [_personsArray removeObjectAtIndex:n-1];
    
    [NSKeyedArchiver archiveRootObject:_personsArray toFile:@"persons.data"];
    printf("联系人删除成功！\n");
    
    return YES;
}

- (BOOL)updatePerson {
    
    char ch[4];
    printf("请输入您要修改的联系人编号：");
    scanf("%s",ch);
    ch[3] = '\0';
    
    int n =  atoi(ch);
    if (n > _personsArray.count || n <= 0)
    {
        printf("对不起，您输入的编号有误！\n");
        return NO;
    }
    
    char chh[20];
    printf("请输入修改后的联系人姓名：");
    scanf("%s",chh);
    chh[19] = '\0';
    YKPerson *person = [[YKPerson alloc] init];
    person.name = [NSString stringWithUTF8String:chh];
    printf("请输入修改后的联系人电话号码：");
    scanf("%s",chh);
    chh[12] = '\0';
    person.telNumber = [NSString stringWithUTF8String:chh];
    
    _personsArray[n-1] = person;
    
    
    [NSKeyedArchiver archiveRootObject:_personsArray toFile:@"persons.data"];
    printf("联系人修改成功！\n");
    
    return YES;
}

- (BOOL)findPerdon {
    
    char ch[20];
    printf("请输入您要查找的联系人姓名或电话：");
    scanf("%s",ch);
    ch[19] = '\0';
    NSString *str = [NSString stringWithUTF8String:ch];
    
    BOOL bz = NO;
    for (YKPerson *person in _personsArray)
    {
        
        if ([person.name isEqualToString:str] || [person.telNumber isEqualToString:str])
        {
            
            printf("%s\t\t%s\n", [person.name UTF8String], [person.telNumber UTF8String]);
            bz = YES;
        }
    }
    if (bz == NO)
    {
        printf("对不起，查无此人！\n");
    }
    
    return YES;
}

- (void)showAllPerson {
    if (_personsArray.count == 0)
    {
        printf("对不起，通讯录目前空无一人！\n");
    }
    else
    {
        int c = 0;
        printf("编号\t姓名\t\t电话号码\n");
        for (YKPerson *preson in _personsArray)
        {
            c++;
            
            printf("%02d\t%s\t\t%s\n", c, [preson.name UTF8String], [preson.telNumber UTF8String]);
        }
    }
}



@end
