//
//  CommentCell.h
//  Cell_Tableview
//
//  Created by chuanglong02 on 16/10/10.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
//#import "DetailModel.h"
@interface CommentCell : UITableViewCell
@property(nonatomic,strong)CommentModel *commentModel;
@property(nonatomic,strong)UILabel *commentLabel;
+(CGFloat)cellHeight;
@end
