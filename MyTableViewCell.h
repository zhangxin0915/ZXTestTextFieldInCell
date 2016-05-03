//
//  MyTableViewCell.h
//  ZXTestTextFieldInCell
//
//  Created by macmini on 16/4/29.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTableViewCellDelegate <NSObject>

- (void)MyTableViewCellWithTextField:(UITextField *)textField;

@end

@interface MyTableViewCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic,strong) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UITextField *text;

@property (nonatomic,weak) id<MyTableViewCellDelegate> delegate;

@end
