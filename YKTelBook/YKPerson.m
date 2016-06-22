//
//  YKPerson.m
//  YKTelBook
//
//  Created by xiaofans on 16/6/22.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "YKPerson.h"

@implementation YKPerson

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_telNumber forKey:@"telNumber"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _telNumber = [aDecoder decodeObjectForKey:@"telNumber"];
    }
    return self;
}




@end
