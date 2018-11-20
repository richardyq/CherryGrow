//
//  AddSleepSituationRequest.h
//  CherryGrow
//
//  Created by YinQ on 2018/11/20.
//  Copyright © 2018年 YinQ. All rights reserved.
//

#import "CDJsonRequest.h"
#import "SleepSituation.h"

@interface AddSleepSituationRequest : CDJsonRequest

- (id) initWithSleepSituation:(SleepSituation*) situation;

@end
