//
//  ViewController.m
//  ZXTestTextFieldInCell
//
//  Created by macmini on 16/4/29.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "Person.h"


@interface ViewController () <UITableViewDataSource,UITableViewDelegate,MyTableViewCellDelegate>

@property (nonatomic,strong) NSMutableArray *datas;

@property (nonatomic,strong) UITableView *myTableView;

@property (nonatomic,strong) NSMutableDictionary *dic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [NSMutableArray array];
    
    for (int i = 0; i < 20 ; i ++) {
        Person *per  =[[Person alloc]init];
        per.name = [NSString stringWithFormat:@"张三%d",i];
        per.age = @"0";
        [self.datas addObject:per];
    }
    self.dic = [NSMutableDictionary dictionary];
    
    self.myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, 320, 528) style:UITableViewStyleGrouped];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"MyCell%@",indexPath];
//    MyTableViewCell *cell = [self.dic objectForKey:identifier];
//    if (!cell) {
//        cell = [[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:self options:nil].firstObject;
//        [self.dic setObject:cell forKey:identifier];
//    }

    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:self options:nil].firstObject;
    }
    cell.delegate = self;
    cell.indexPath = indexPath;
   Person *per = [self.datas objectAtIndex:indexPath.row];
    cell.name.text= per.name;
    cell.text.text = per.age;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view endEditing:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)btnClick:(UIButton *)sender {
    for (int i = 0; i < self.datas.count ; i ++) {
        Person *per  = self.datas[i];
        NSLog(@"per.name == %@ per.age== %@ \n",per.name,per.age);
    }
}
-(void)MyTableViewCellWithTextField:(UITextField *)textField
{
    MyTableViewCell *cell = (MyTableViewCell *)textField.superview.superview;
    NSIndexPath *indexPath = [self.myTableView indexPathForCell:cell];
    NSLog(@"indexPath.row == %ld",(long)indexPath.row);
    Person *per = [self.datas objectAtIndex:indexPath.row];
    per.age = textField.text;
//    [self.myTableView reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
@end
