//
//  wcViewModel.h
//  dwc_MVVM
//
//  Created by admin on 2017/4/1.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wcViewModel : NSObject

@property (nonatomic, strong) NSArray *dataArr;

-(void)getData:(void(^)(NSArray *dataArray,NSError *error))compeleted;

@end
