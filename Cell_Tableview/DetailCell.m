//
//  DetailCell.m
//  Cell_Tableview
//
//  Created by chuanglong02 on 16/10/10.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "DetailCell.h"
#import "CommentModel.h"
#import "CommentCell.h"
@interface DetailCell()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *commentTableview;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *messageLabel;
@end
static CGFloat cellHeight = 40;
@implementation DetailCell
+(CGFloat)cellHeight
{
    return cellHeight;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.nameLabel.frame = CGRectMake(10, 0, DeviceW - 20, 20);
        self.messageLabel.frame = CGRectMake(10, CGRectGetMaxY(self.nameLabel.frame), DeviceW - 20, 20);
        self.commentTableview.frame = CGRectMake(0, CGRectGetMaxY(self.messageLabel.frame) + 10, DeviceW, 0);
        [self.contentView addSubview:self.commentTableview];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.messageLabel];
        
    }
    return self;
}
-(void)setDetailmodel:(DetailModel *)detailmodel
{
    _detailmodel = detailmodel;
    
    _nameLabel.text = detailmodel.name;
    _messageLabel.text = detailmodel.message;
    CGFloat commentHeight = 0;
    for (int i = 0; i< detailmodel.commentArray.count; i++) {
        CommentModel *cmodel =detailmodel.commentArray[i];
        
        //评论上下各留2  ，左右留10；
        CGFloat height = [self stringSizeWithFont:[UIFont systemFontOfSize:15.0] string:cmodel.message width:DeviceW - 20].height ;
        height = height>20?height:20;
        height = height + 5;
        commentHeight += height;
    }
    self.commentTableview.frame= CGRectMake(0, CGRectGetMaxY(self.messageLabel.frame) + 10, DeviceW, commentHeight);
    if (_detailmodel.height == 0) {
        _detailmodel.height = commentHeight +1 + 50;
    }
    cellHeight = _detailmodel.height;
    [self.commentTableview reloadData];
}
#pragma mark - TableView data source
//两个tableview嵌套，父table放所有信息，子table放评论列表
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.detailmodel.commentArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSLog(@"%f",[CommentCell cellHeight]);
    return [CommentCell cellHeight];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentCell *cell = (CommentCell *) [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
    if (!cell) {
        cell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
    }
   
    
    cell.commentModel = self.detailmodel.commentArray[indexPath.row];
    cell.backgroundColor =[UIColor brownColor];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
}


#pragma mark---动态高度---
-(CGSize)stringSizeWithFont:(UIFont *)font string:(NSString *)string width:(CGFloat)width
{
    
    
    CGRect rect =[string boundingRectWithSize:CGSizeMake(width, 10000) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}
-(UITableView *)commentTableview
{
    if (!_commentTableview) {
        _commentTableview =[[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _commentTableview.delegate = self;
        _commentTableview.dataSource = self;
        _commentTableview.scrollEnabled = NO;
    }
    return _commentTableview;
}
-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel =[[UILabel alloc]init];
        _nameLabel.font =[UIFont systemFontOfSize:16.0];
        _nameLabel.backgroundColor = [UIColor purpleColor];
        
    }
    return _nameLabel;
}
-(UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel =[[UILabel alloc]init];
        _messageLabel.backgroundColor =[UIColor greenColor];
        _messageLabel.font =[UIFont systemFontOfSize:15.0];
    }
    return _messageLabel;
}
@end
