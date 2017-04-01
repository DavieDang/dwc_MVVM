//
//  ViewController.m
//  dwc_MVVM
//
//  Created by admin on 2017/4/1.
//  Copyright © 2017年 com.gz.bingoMobileSchools. All rights reserved.
//

#import "ViewController.h"
#import "wcHeader.h"
#import "wcViewModel.h"
#import "wcCell.h"
#import "wcModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *wcTableView;
@property (nonatomic, strong) wcViewModel *viewModel;



@end

@implementation ViewController


-(UITableView *)wcTableView{
    if (!_wcTableView) {
        _wcTableView = [[UITableView alloc] initWithFrame:self.view.frame];
        _wcTableView.delegate = self;
        _wcTableView.dataSource = self;
        
        [_wcTableView registerClass:[wcCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _wcTableView;
}



-(wcViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[wcViewModel alloc] init];
        
        wcModel *model1 = [[wcModel alloc] init];
        model1.wc_title = @"fff";
        wcModel *model2 = [[wcModel alloc] init];
        model2.wc_title = @"fff222";
        wcModel *model3 = [[wcModel alloc] init];
        model3.wc_title = @"fff333";
        _viewModel.dataArr = @[model1,model2,model3];
        
    }
    
    return _viewModel;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    wcCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[wcCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell setData:self.viewModel.dataArr[indexPath.row]];
    
    return cell;
}

-(void)setUpView{
    [self.view addSubview:self.wcTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
