//
//  BDJMePresenter.h
//  百思不得姐
//
//  Created by 付星 on 2016/11/9.
//    Copyright © 2016年 yizzuide. All rights reserved.
//

#import "BDJMeEventHandlerPort.h"
#import "XFPresenter.h"


@interface BDJMePresenter : XFPresenter <BDJMeEventHandlerPort>

@property (nonatomic, strong) RACCommand *settingCommand;
@end
