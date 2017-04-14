//
//  BDJMePresenter.m
//  百思不得姐
//
//  Created by 付星 on 2016/11/9.
//    Copyright © 2016年 yizzuide. All rights reserved.
//

#import "BDJMePresenter.h"
#import "BDJMeWireframePort.h"
#import "BDJMeUserInterfacePort.h"
#import "BDJMeInteractorPort.h"
#import "ReactiveCocoa.h"
#import "BDJTopicExpressPack.h"
#import "BDJTopicRenderItem.h"


#define Interactor XFConvertInteractorToType(id<BDJMeInteractorPort>)
#define Interface XFConvertUserInterfaceToType(id<BDJMeUserInterfacePort>)
#define Routing XFConvertRoutingToType(id<BDJMeWireFramePort>)

@interface BDJMePresenter ()

@end

@implementation BDJMePresenter

#pragma mark - lifeCycle

- (void)initCommand
{
    XF_Debug_M()
    XF_CEXE_Begin
    XF_CEXE_(self.settingCommand, {
        LogWarning(@"!!!%@",input);
        [Routing transition2Setting];
    })
}

#pragma mark - DoAction
- (RACSignal *)DidFooterViewInitAction
{
    return [[Interactor fetchTopics] map:^id(XFRenderData  *renderData) {
        /* ---------------- 使用手动计算Frame ---------------- */
//        XF_SetExpressPack_(BDJTopicExpressPack, renderData)
        /* --------------------------------------------- */
        XF_SetExpressPack_Fast(renderData)
        return self.expressPack.expressPieces;
    }];
}

- (void)didTopicSelectAction:(XFExpressPiece *)expressPiece
{
    BDJTopicRenderItem *renderItem = expressPiece.renderItem;
    if ([renderItem.openURL hasPrefix:@"http:"]) {
        [Routing transition2BrowserWithURL:renderItem.openURL];
        return;
    }
    
    LogWarning(@"不支持的协议：%@",renderItem.openURL);
}


#pragma mark - ValidData


@end
