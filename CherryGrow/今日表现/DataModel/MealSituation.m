//
//  MealSituation.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/19.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "MealSituation.h"

@implementation MealDetSituationModel

@end



@implementation MealSituation

- (id) init{
    self = [super init];
    if (self) {
        self.det = [MealDetSituationModel new];
    }
    return self;
}

- (NSInteger) code{
    return self.det.code;
}

- (void) setCode:(NSInteger)code{
    [self.det setCode:code];
}

- (NSInteger) speed{
    return self.det.speed;
}

- (void) setSpeed:(NSInteger)speed{
    [self.det setSpeed:speed];
}

- (NSInteger) amount{
    return self.det.amount;
}

- (void) setAmount:(NSInteger)amount{
    [self.det setAmount:amount];
}

- (NSInteger) feed{
    return self.det.feed;
}

- (void) setFeed:(NSInteger)feed{
    [self.det setFeed:feed];
}

- (CGFloat) score{
    return self.det.score;
}

- (void) setScore:(CGFloat)score{
    [self.det setScore:score];
}

@end

@implementation MealSituationParam

@end
