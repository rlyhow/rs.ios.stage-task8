//
//  ControlButton.m
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import "ControlButton.h"
#import "../../CustomColors/UIColor+CustomColor.h"

@implementation ControlButton

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self.layer setShadowRadius:1.0];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.25];
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setCornerRadius:10.0];
    [self.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    
    [self setTitleColor:[UIColor lightGreenSea] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
}


- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (!enabled) {
        [self setAlpha:0.5];
    } else {
        [self setAlpha:1.0];
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    
    if (highlighted){
        [self.layer setShadowRadius:2.0];
        [self.layer setShadowColor:[UIColor lightGreenSea].CGColor];
        [self.layer setShadowOpacity:1];
    }
    else
    {
        [self.layer setShadowRadius:1.0];
        [self.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.layer setShadowOpacity:0.25];
    }
}
@end
