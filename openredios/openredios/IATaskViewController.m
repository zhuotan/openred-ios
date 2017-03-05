//
//  IATaskViewController.m
//  openredios
//
//  Created by 谭卓 on 2017/3/2.
//  Copyright © 2017年 谭卓. All rights reserved.
//

#import "IAViewController.h"
#import "IATaskViewController.h"

@interface IATaskViewController ()

@end

@implementation IATaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taskLable.text = self.task;
}
- (IBAction)completeTask:(id)sender {
    IAViewController *tasksListView = self.delegate;
    [tasksListView.tasks removeObject:self.task];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
