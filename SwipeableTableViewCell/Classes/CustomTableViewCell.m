//
//  CustomTableViewCell.m
//  SwipeableTableViewCell
//
//  Created by Maitrayee Ghosh on 12/05/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import "CustomTableViewCell.h"
static UIView *lastOpenedCellView;
@implementation CustomTableViewCell

- (void)awakeFromNib {
    
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeCellLeft:)];
    leftSwipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.SwipableUIView addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeCellRight:)];
    rightSwipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    [self.SwipableUIView addGestureRecognizer:rightSwipeGesture];

}

#pragma mark - Left Swipe

- (void)SwipeCellLeft:(UISwipeGestureRecognizer *)recognizer
{
    if (lastOpenedCellView!=nil) {
        [self hideButtonsForView:lastOpenedCellView];
    }
    
    UIView *upperView  = recognizer.view;
    lastOpenedCellView=upperView;
    [self showHiddenButtonsForView:upperView];
    
}

#pragma mark - Right Swipe

- (void)SwipeCellRight:(UISwipeGestureRecognizer *)recognizer
{
    UIView *upperView  = recognizer.view;
    [self hideButtonsForView:upperView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - Add little Animation

-(void)showHiddenButtonsForView:(UIView *)cellView
{
    [UIView animateWithDuration:0.5
                          delay:0.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0.5
                        options:0 animations:^{
                            cellView.frame=CGRectMake(-150, 0,  cellView.frame.size.width, cellView.frame.size.height);
                        }
                     completion:^(BOOL finished) {
                         //Completion Block
                     }];
}

-(void)hideButtonsForView:(UIView *)cellView
{
    [UIView animateWithDuration:0.5
                          delay:0.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:0.5
                        options:0 animations:^{
                            cellView.frame=CGRectMake(0, 0,  cellView.frame.size.width, cellView.frame.size.height);
                        }
                     completion:^(BOOL finished) {
                         //Completion Block
                     }];
}

@end
