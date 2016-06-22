//
//  YKMenu.h
//  YKTelBook
//
//  Created by xiaofans on 16/6/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YKTelBook.h"

@interface YKMenu : NSObject

@property (nonatomic, strong) NSArray *itemsArray;
@property (nonatomic, strong) YKTelBook *telBook;


- (void)showMenu;
- (BOOL)inPut;

@end
