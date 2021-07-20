//
//  ColorButton.m
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import "ColorButton.h"

@implementation ColorButton

- (void)awakeFromNib{
    [super awakeFromNib];

    self.layer.cornerRadius = 10.0;
    [self.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.layer setShadowRadius:1.0];
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.25];
    
    [self.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.layer setBorderWidth:8.0];
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    
    if (selected){
        [self.layer setBorderWidth:2.0];
    }
    else
    {
        [self.layer setBorderWidth:8.0];
    }
}


@end
