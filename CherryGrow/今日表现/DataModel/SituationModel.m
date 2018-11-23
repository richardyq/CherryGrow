//
//  SituationModel.m
//  CherryGrow
//
//  Created by YinQ on 2018/11/23.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "SituationModel.h"
#import "UserModel.h"
@implementation SituationModel

- (NSString*) id{
    return self.record.id;
}

- (void) setId:(NSString *)rid{
    [self.record setId:rid];
}

- (NSString*) date{
    return self.record.date;
}

- (void) setDate:(NSString *)date{
    [self.record setDate:date];
}

- (NSString*) userId{
    UserModel* user = self.record.user;
    return user.userId;
}

- (NSString*) userName{
    UserModel* user = self.record.user;
    return user.userName;
}

- (NSString*) updateTime{
    return self.record.updateTime;
}

- (void) setUpdateTime:(NSString *)updateTime{
    [self.record setUpdateTime:updateTime];
}

- (NSInteger) type{
    return self.record.type;
}

- (void) setType:(NSInteger)type{
    [self.record setType:type];
}
@end
