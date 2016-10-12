# Cell_Tableview
cell里面嵌套UItableview，关键还在于计算，把外层的tableview高度缓存在对应的model里
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
