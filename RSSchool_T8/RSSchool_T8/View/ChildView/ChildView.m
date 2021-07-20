//
//  ChildView.m
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import "ChildView.h"

@implementation ChildView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.layer setCornerRadius:40.0];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setShadowRadius:4.0];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.25];
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
}

@end
