//
//  ViewController.m
//  TableHeadViewDemo
//
//  Created by WingChing Yip on 2018/9/2.
//  Copyright © 2018年 WingChing Yip. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建tableHeadView
    UIView *headView = [[UIView alloc] init];
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [headView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(headView);
        make.height.mas_equalTo(40);
    }];

    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor purpleColor];
    [headView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(headView);
        make.top.equalTo(view1.mas_bottom);
        make.height.mas_equalTo(50);
        make.bottom.equalTo(headView);
    }];

    // 方式1  systemLayoutSizeFittingSize: autolayout算出headview的高度
    CGFloat height = [headView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGRect frame = headView.bounds;
    frame.size.height = height;
    headView.frame = frame;
    [self.tableView setTableHeaderView:headView];
    
    // 方式2
//    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
//    headView.backgroundColor = [UIColor redColor];
//    self.tableView.tableHeaderView = headView;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"更新" style:UIBarButtonItemStyleDone target:self action:@selector(changeClick)];
    
}

- (void)changeClick {
    
    // 方式2
//    UIView *headView = self.tableView.tableHeaderView;
//    CGRect frame = headView.frame;
//    frame.size.height = 100;
//    headView.frame = frame;
//    [self.tableView setTableHeaderView:headView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"动态改变tableHeaderView的高度";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


@end
