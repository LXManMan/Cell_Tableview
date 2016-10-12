//
//  ViewController.m
//  Cell_Tableview
//
//  Created by chuanglong02 on 16/10/10.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "ViewController.h"
#import "DetailModel.h"
#import "CommentModel.h"
#import "DetailCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *myTableview;
@property(nonatomic,strong)NSMutableArray *dataA;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray *nameA = @[@"小明1",@"小红2",@"小李3",@"小刚4",@"小赵",@"小张"];
    NSString *string = @"今天天气真特么好，";
    NSString *subString= @"大撒比，扯犊子给点儿孜然，我要bbq价格热狗和家人关机啦按两个加热轧空如果过热空格热加工我如果李建安二极管拉人给家人过来骄傲而老公家";
    for (int i = 0; i< nameA.count; i++) {
        DetailModel *detail_model =[[DetailModel alloc]init];
        detail_model.name = nameA[i];
        detail_model.message = [nameA[i] stringByAppendingString:string];
        detail_model.commentArray =[NSMutableArray array];
        for (int j = 0; j<i+1; j++) {
            CommentModel *comment_model =[[CommentModel alloc]init];
             comment_model.message = [NSString stringWithFormat:@"%d个说%@",j,subString];
            for (int k = 0; k< j; k++) {
                comment_model.message =[comment_model.message stringByAppendingString:subString];
            }
           
            [detail_model.commentArray addObject:comment_model];
        }
        [self.dataA addObject:detail_model];
    }
//    NSLog(@"%@",_da
    [self.view addSubview:self.myTableview];

}
#pragma mark - TableView data source
//两个tableview嵌套，父table放所有信息，子table放评论列表
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataA.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //在model中建个height参数存储高度
    DetailModel *model = self.dataA[indexPath.row];
    if (model.height==0) {
        return [DetailCell cellHeight];
    }else{
        return model.height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailCell *cell = (DetailCell *) [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    if (!cell) {
        cell = [[DetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailCell"];
    }

    cell.detailmodel = self.dataA[indexPath.row];
   
//    cell.index =[indexPath row];
//    cell.cellData = [self.dataA objectAtIndex:[indexPath row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.sendBlock = ^(NSInteger index){
//        
//        [self addComment:index];
//    };
    return cell;
    
}

-(UITableView *)myTableview
{
    if (!_myTableview) {
        _myTableview =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, DeviceW, DeviceH) style:UITableViewStylePlain];
        _myTableview.delegate = self;
        _myTableview.dataSource = self;
        
    }
    return _myTableview;
}
-(NSMutableArray *)dataA
{
    if (!_dataA) {
        _dataA  =[NSMutableArray array];
        
        
    }
    return _dataA;
}

@end
