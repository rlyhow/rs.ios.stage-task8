//
//  PaletteViewController.m
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import "PaletteViewController.h"
#import "ArtistViewController.h"
#import "ColorButton.h"
#import "../CustomColors/UIColor+CustomColor.h"

@interface PaletteViewController ()
@property (weak, nonatomic) IBOutlet ColorButton *btn_1;
@property (weak, nonatomic) IBOutlet ColorButton *btn_2;
@property (weak, nonatomic) IBOutlet ColorButton *btn_3;
@property (weak, nonatomic) IBOutlet ColorButton *btn_4;
@property (weak, nonatomic) IBOutlet ColorButton *btn_5;
@property (weak, nonatomic) IBOutlet ColorButton *btn_6;
@property (weak, nonatomic) IBOutlet ColorButton *btn_7;
@property (weak, nonatomic) IBOutlet ColorButton *btn_8;
@property (weak, nonatomic) IBOutlet ColorButton *btn_9;
@property (weak, nonatomic) IBOutlet ColorButton *btn_10;
@property (weak, nonatomic) IBOutlet ColorButton *btn_11;
@property (weak, nonatomic) IBOutlet ColorButton *btn_12;

@property (weak, nonatomic) NSTimer *t;
@property (strong, nonatomic) NSMutableArray<UIColor *> *arrayOfColors;
@property (strong, nonatomic) NSMutableArray<UIButton *> *arrayOfButtons;

@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfButtons = [NSMutableArray new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.btn_1.backgroundColor = [UIColor Color_1];
    self.btn_2.backgroundColor = [UIColor Color_2];
    self.btn_3.backgroundColor = [UIColor Color_3];
    self.btn_4.backgroundColor = [UIColor Color_4];
    self.btn_5.backgroundColor = [UIColor Color_5];
    self.btn_6.backgroundColor = [UIColor Color_6];
    self.btn_7.backgroundColor = [UIColor Color_7];
    self.btn_8.backgroundColor = [UIColor Color_8];
    self.btn_9.backgroundColor = [UIColor Color_9];
    self.btn_10.backgroundColor = [UIColor Color_10];
    self.btn_11.backgroundColor = [UIColor Color_11];
    self.btn_12.backgroundColor = [UIColor Color_12];
    
}

- (IBAction)savePalette:(id)sender {
    id<DrawProtocol> strongDelegate = self.delegate;
    
    self.arrayOfColors = [NSMutableArray new];
    for (UIButton* button in self.arrayOfButtons) {
        [self.arrayOfColors addObject:button.backgroundColor];
    }
    while (self.arrayOfColors.count != 3) {
        [self.arrayOfColors addObject:[UIColor blackColor]];
    }
    [strongDelegate chooseColor:self.arrayOfColors];
    
    // Remove Palette Controller
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

- (IBAction)selectColor:(UIButton *)sender {
    if (!sender.isSelected) {
        sender.selected = YES;
        self.view.backgroundColor = sender.backgroundColor;
        [self startAnimationChangeViewColor];
        
        if (self.arrayOfButtons.count < 3) {
            [self.arrayOfButtons addObject:sender];
        } else if (self.arrayOfButtons.count == 3) {
            self.arrayOfButtons.firstObject.selected = NO;
            [self.arrayOfButtons removeObjectAtIndex:0];
            [self.arrayOfButtons addObject:sender];
        }
    } else {
        [self.arrayOfButtons removeObject:sender];
        sender.selected = NO;
    }
}

- (void)startAnimationChangeViewColor {
    
    [UIView animateWithDuration:0.0 delay:1.0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
             self.view.backgroundColor = [UIColor whiteColor];
         } completion:^(BOOL finished) {
         }];
}
@end
