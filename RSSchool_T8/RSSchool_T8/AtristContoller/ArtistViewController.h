//
//  ArtistViewController.h
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import <UIKit/UIKit.h>
#import "PaletteViewController.h"
#import "RSSchool_T8-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistViewController : UIViewController <DrawProtocol, ObjTimerProtocol, ObjPicturePtorocol>

@property (nonatomic, strong) PaletteViewController *paletteChildVC;
@property (nonatomic, strong) TimerViewController *timerChildVC;
@property (nonatomic, strong) DrawingsViewController *drawingsController;

@end

NS_ASSUME_NONNULL_END
