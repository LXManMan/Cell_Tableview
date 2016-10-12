//
//  DetailModel.h
//  Cell_Tableview
//
//  Created by chuanglong02 on 16/10/10.
//  Copyright © 2016年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *message;
@property(nonatomic,strong)NSMutableArray *commentArray;
@property(nonatomic,assign)float height;
@end
