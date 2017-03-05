//
//  IANewTaskViewController.m
//  openredios
//
//  Created by 谭卓 on 2017/3/2.
//  Copyright © 2017年 谭卓. All rights reserved.
//

#import "IAViewController.h"
#import "IANewTaskViewController.h"

@interface IANewTaskViewController ()

@end

@implementation IANewTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)SaveAction:(UIButton *)sender {
    if([self.textField.text length] == 0){
        return;
    }
    IAViewController *tasksListView = (IAViewController*)self.delegate;
    [tasksListView.tasks addObject:self.textField.text];
    [self Close:sender];
    
}
- (IBAction)Close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
