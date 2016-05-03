//
//  MyTableViewCell.m
//  ZXTestTextFieldInCell
//
//  Created by macmini on 16/4/29.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {

    self.text.delegate = self;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"ShouldBeginEditing == %ld textField ==  %@",(long)self.indexPath.row,textField.text);
    return YES;
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"DidBeginEditing == %ld textField ==  %@",(long)self.indexPath.row,textField.text);

}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"DidEndEditing == %ld textField ==  %@",(long)self.indexPath.row,textField.text);

    if ([self.delegate respondsToSelector:@selector(MyTableViewCellWithTextField:)]) {
        [self.delegate MyTableViewCellWithTextField:textField];
    }
}


@end
