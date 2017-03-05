//
//  ViewController.h
//  openredios
//
//  Created by 谭卓 on 2017/3/2.
//  Copyright © 2017年 谭卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface IAViewController: UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *tasks;
@end

