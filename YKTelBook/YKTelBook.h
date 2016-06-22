//
//  YKTelBook.h
//  YKTelBook
//
//  Created by xiaofans on 16/6/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YKTelBook : NSObject

@property (nonatomic, strong) NSMutableArray *personsArray;

- (BOOL)addPerson;
- (BOOL)deledatePerson;
- (BOOL)updatePerson;
- (BOOL)findPerdon;
- (void)showAllPerson;

@end
