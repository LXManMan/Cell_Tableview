//
//  CommentCell.m
//  Cell_Tableview
//
//  Created by chuanglong02 on 16/10/10.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import "CommentCell.h"
@interface CommentCell()

@end
static CGFloat cellHeight = 0;

@implementation CommentCell
+ (CGFloat)cellHeight {
    return cellHeight;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.commentLabel];
        self.commentLabel.layer.borderWidth = 2;
        self.commentLabel.layer.borderColor =[UIColor purpleColor].CGColor;
        
    }
    return self;
}
-(void)setCommentModel:(CommentModel *)commentModel
{
    cellHeight = 0;
    _commentModel = commentModel;
    _commentLabel.text = commentModel.message;
   
    CGFloat height =[self stringSizeWithFont:[UIFont systemFontOfSize:15.0] string:commentModel.message width:DeviceW - 20].height;
    
    height = height >20?height:20;
    self.commentLabel.frame = CGRectMake(10, 2, DeviceW- 20, height);

    cellHeight =  height + 5;
    
    
}
#pragma mark---动态高度---
-(CGSize)stringSizeWithFont:(UIFont *)font string:(NSString *)string width:(CGFloat)width
{
    
    
    CGRect rect =[string boundingRectWithSize:CGSizeMake(width, 10000) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}
-(UILabel *)commentLabel
{
    if (!_commentLabel) {
        _commentLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 2, DeviceW- 20, 20)];
        _commentLabel.numberOfLines = 0;
        _commentLabel.font =[UIFont systemFontOfSize:15.0];
//        _commentLabel.backgroundColor = LBRandomColor;
        
    }
    return _commentLabel;
}
@end
