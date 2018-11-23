//
//  SleepSituation.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SleepSituation.h"

@implementation SleepDetSituation

@end

@implementation SleepSituation
/*

 @property (nonatomic, assign) NSInteger code;
 @property (nonatomic, assign) NSInteger status;
 @property (nonatomic, assign) NSInteger score;
 */

- (id) init{
    self = [super init];
    if (self) {
        self.det = [SleepDetSituation new];
    }
    return self;
}

- (NSInteger) code{
    return self.det.code;
}

- (void) setCode:(NSInteger)code{
    [self.det setCode:code];
}

- (NSInteger) status{
    return self.det.status;
}

- (void) setStatus:(NSInteger)status{
    [self.det setStatus:status];
}

- (NSInteger) score{
    return self.det.score;
}

- (void) setScore:(NSInteger)score{
    [self.det setScore:score];
}

@end

@implementation SleepSituationParam

@end
