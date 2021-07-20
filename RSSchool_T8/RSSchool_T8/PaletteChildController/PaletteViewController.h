//
//  PaletteViewController.h
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import <UIKit/UIKit.h>

@protocol DrawProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface PaletteViewController : UIViewController

@property (weak, nonatomic)id <DrawProtocol> delegate;

@end

@protocol DrawProtocol <NSObject>

- (void)chooseColor:(NSMutableArray<UIColor *> *)color;

@end

NS_ASSUME_NONNULL_END
