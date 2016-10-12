//
//  DetailCell.h
//  Cell_Tableview
//
//  Created by chuanglong02 on 16/10/10.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"
@interface DetailCell : UITableViewCell
@property(nonatomic,strong)DetailModel *detailmodel;
@property(nonatomic,copy)void (^sendClick)(NSInteger outIndex,NSInteger in_index);
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong)UITableView *commentTableview;
+(CGFloat)cellHeight;
@end
