//
//  IATaskViewController.h
//  openredios
//
//  Created by 谭卓 on 2017/3/2.
//  Copyright © 2017年 谭卓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IATaskViewController : UIViewController
@property (weak,nonatomic) NSString *task;
@property (weak,nonatomic) id delegate;
@property (weak, nonatomic) IBOutlet UILabel *taskLable;

@end
