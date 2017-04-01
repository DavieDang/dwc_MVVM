//
//  wcViewModel.m
//  dwc_MVVM
//
//  Created by admin on 2017/4/1.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

#import "wcViewModel.h"
#import "wcHeader.h"

@implementation wcViewModel

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
    
    return _dataArr;
}


-(void)getData:(void (^)(NSArray *, NSError *))compeleted{
    
//    [BaseNetManager post:@"" parameters:nil success:^(id responseObject) {
//        compeleted(nil,nil);
//    } failure:^(NSError *error) {
//        compeleted(nil,nil);
//    }];
    
}

@end
