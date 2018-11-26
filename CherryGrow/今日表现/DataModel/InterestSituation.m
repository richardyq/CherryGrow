//
//  InterestSituation.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/26.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "InterestSituation.h"


@implementation InterestDetSituation

- (NSInteger) cateId{
    return self.cate.cateId;
}

- (void) setCateId:(NSInteger)cateId{
    [self.cate setCateId:cateId];
}
@end

@implementation InterestSituation

- (id) init{
    self = [super init];
    if (self) {
        self.det = [InterestDetSituation new];
    }
    return self;
}

#pragma mark - settingAndGetting
- (NSInteger) cateId{
    return self.det.cateId;
}

- (void) setCateId:(NSInteger)cateId{
    [self.det setCateId:cateId];
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

- (NSString*) statusName{
    NSString* statusName = @"";
    switch (self.status) {
        case 0:
            statusName = @"表现很差";
            break;
        case 1:
            statusName = @"表现一般";
            break;
        case 2:
            statusName = @"表现很好";
            break;
        default:
            break;
    }
    return statusName;
}

- (NSString*) cateName{
    NSString* cateName = @"";
    switch (self.cateId) {
        case 1:
            cateName = @"钢琴";
            break;
        case 2:
            cateName = @"绘画";
            break;
        case 3:
            cateName = @"舞蹈";
            break;
        default:
            break;
    }
    return cateName;
}
@end
