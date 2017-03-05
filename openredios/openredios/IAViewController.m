//
//  ViewController.m
//  openredios
//
//  Created by 谭卓 on 2017/3/2.
//  Copyright © 2017年 谭卓. All rights reserved.
//

#import "IAViewController.h"

@interface IAViewController ()

@end

@implementation IAViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tasks = [[NSMutableArray alloc] init];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL =
    [NSURL URLWithString:@"http://221.237.189.104:8080/suitangmap/NewsInfoAction?method=init"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id data, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            //NSLog(@"%@ %@", response, data);
            NSArray *array = data;
            for(NSDictionary* dic in array) {
                NSLog(@"%@",[dic objectForKey:@"title"]);
            }
        }
    }];
    [dataTask resume];
    
}

-(NSInteger) tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [self.tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    cell.textLabel.text = self.tasks[indexPath.row];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"taskSegue" sender:self.tasks[indexPath.row]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIViewController *destination =segue.destinationViewController;
    if([segue.identifier isEqualToString:@"taskSegue"]){
        [destination setValue:sender forKey:@"task"];
    }else{
        destination = [segue.destinationViewController topViewController];
    }
    [destination setValue:self forKey:@"delegate"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
