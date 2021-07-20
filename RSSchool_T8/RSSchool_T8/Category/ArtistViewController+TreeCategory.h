//
//  ArtistViewController+TreeCategory.h
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import "ArtistViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistViewController (TreeCategory)

- (UIBezierPath *)getFirstPartOfTree;
- (UIBezierPath *)getSecondPartOfTree;
- (UIBezierPath *)getThirdPartOfTree;

- (UIBezierPath *)getFirstPartOfHead;
- (UIBezierPath *)getSecondPartOfHead;
- (UIBezierPath *)getThirdPartOfHead;

- (UIBezierPath *)getFirstPartOfLandscape;
- (UIBezierPath *)getSecondPartOfLandscape;
- (UIBezierPath *)getThirdPartOfLandscape;

- (UIBezierPath *)getFirstPartOfPlanet;
- (UIBezierPath *)getSecondPartOfPlanet;
- (UIBezierPath *)getThirdPartOfPlanet;

@end

NS_ASSUME_NONNULL_END
