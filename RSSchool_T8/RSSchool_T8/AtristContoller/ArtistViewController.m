//
//  ArtistViewController.m
//  RSSchool_T8
//
//  Created by Mikita Shalima on 19.07.21.
//

#import "ArtistViewController.h"
#import "ControlButton.h"
#import "UIColor+CustomColor.h"
#import "ArtistViewController+TreeCategory.h"
#import <LinkPresentation/LPLinkMetadata.h>

@interface ArtistViewController ()

@property (weak, nonatomic) IBOutlet ControlButton *openPaletteBtn;
@property (weak, nonatomic) IBOutlet ControlButton *drawBtn;
@property (weak, nonatomic) IBOutlet ControlButton *openTimerBtn;
@property (weak, nonatomic) IBOutlet ControlButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIView *CanvasView;

@property (weak, nonatomic) NSTimer *mytimer;
@property (nonatomic) float defaultDrawingTime;
@property (nonatomic) NSString *defaultPicture;
@property (strong, nonatomic) NSMutableArray<UIColor *> *arrayOfColors;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.shareBtn.enabled = NO;
    self.defaultPicture = @"Head";
    self.defaultDrawingTime = 1.0;
    self.arrayOfColors = [NSMutableArray arrayWithObjects:[UIColor blackColor], [UIColor blackColor], [UIColor blackColor], nil];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupNavigationBarItems];
    [self setupCanvas];
}

- (void)setupNavigationBarItems {
    
    //title
    UILabel *lblTitle = [[UILabel alloc] init];
    lblTitle.text = @"Artist";
    lblTitle.textColor = [UIColor blackColor];
    lblTitle.font = [UIFont fontWithName:@"Montserrat-Regular" size:17.0];
    self.navigationItem.titleView = lblTitle;
    
    // right item
    UIBarButtonItem *drawings = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(openDrawings)];
    self.navigationItem.rightBarButtonItem = drawings;
    
    [drawings setTitleTextAttributes:@{
        NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0]
   } forState:UIControlStateNormal];
    
    // back item
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Artist"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:nil
                                                                action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    [backItem setTitleTextAttributes:@{
        NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0]
   } forState:UIControlStateNormal];
    
    // цвет всех надписей navigationTabBar
    self.navigationController.navigationBar.tintColor = [UIColor lightGreenSea];
}

- (void)openDrawings {
    
    if (!self.drawingsController)
    {
        self.drawingsController = [DrawingsViewController new];
    }
    
    self.drawingsController.delegate = self;
    [self.navigationController pushViewController:self.drawingsController animated:YES];
}

- (void)setupCanvas {
    self.CanvasView.layer.cornerRadius = 8.0;
    self.CanvasView.backgroundColor = [UIColor whiteColor];
    
    self.CanvasView.layer.shadowRadius = 4.0;
    self.CanvasView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:178.0/255.0 blue:255.0/255.0 alpha:1].CGColor;
    self.CanvasView.layer.shadowOffset = CGSizeMake(0, 0);
    self.CanvasView.layer.shadowOpacity = 0.25;
    self.CanvasView.clipsToBounds = false;
    
}

//delegates

- (void)chooseColor:(NSMutableArray<UIColor *> *)color {
    self.arrayOfColors = color;
}

- (void)getTimerWithTimeValue:(float)timeValue {
    self.defaultDrawingTime = timeValue;
}

- (void)getPictureWithPictureValue:(NSString * _Nonnull)pictureValue {
    self.defaultPicture = pictureValue;
}

//

- (IBAction)openTimer:(id)sender {
    if (!self.timerChildVC)
    {
        self.timerChildVC = [[TimerViewController alloc] init];
    }
    
    self.timerChildVC.delegate = self;
    
    [self addChildViewController:self.timerChildVC];
    self.timerChildVC.view.frame = CGRectMake(0, 333.0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.timerChildVC.view];
    [self.timerChildVC didMoveToParentViewController:self];
    
}

- (IBAction)openPalette:(id)sender {
    // Add Palette Controller
    if (!self.paletteChildVC)
    {
        self.paletteChildVC = [[PaletteViewController alloc] init];
    }
    
    self.paletteChildVC.delegate = self;
    
    [self addChildViewController:self.paletteChildVC];
    self.paletteChildVC.view.frame = CGRectMake(0, 333.0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:self.paletteChildVC.view];
    [self.paletteChildVC didMoveToParentViewController:self];
}

- (IBAction)pressDrawBtn:(UIButton *)sender {
    if ([@"Reset" isEqualToString:sender.titleLabel.text]) {
        [self.drawBtn setTitle:@"Draw" forState:UIControlStateNormal];
        
        self.openPaletteBtn.enabled = YES;
        self.openTimerBtn.enabled = YES;
        self.shareBtn.enabled = NO;
        
        self.CanvasView.layer.sublayers = nil;
    } else {
        
        self.openPaletteBtn.enabled = NO;
        self.openTimerBtn.enabled = NO;
        self.drawBtn.enabled = NO;
        
        //  рисунок
        CAShapeLayer *firstPartOfPicture = [CAShapeLayer layer];
        CAShapeLayer *secondPartOfPicture = [CAShapeLayer layer];
        CAShapeLayer *thirdPartOfPicture = [CAShapeLayer layer];
                
        if ([self.defaultPicture isEqualToString:@"Tree"]) {
            [firstPartOfPicture setPath:[self getFirstPartOfTree].CGPath];
            [secondPartOfPicture setPath:[self getSecondPartOfTree].CGPath];
            [thirdPartOfPicture setPath:[self getThirdPartOfTree].CGPath];
        } else if ([self.defaultPicture isEqualToString:@"Head"]) {
            [firstPartOfPicture setPath:[self getFirstPartOfHead].CGPath];
            [secondPartOfPicture setPath:[self getSecondPartOfHead].CGPath];
            [thirdPartOfPicture setPath:[self getThirdPartOfHead].CGPath];
        } else if ([self.defaultPicture isEqualToString:@"Landscape"]) {
            [firstPartOfPicture setPath:[self getFirstPartOfLandscape].CGPath];
            [secondPartOfPicture setPath:[self getSecondPartOfLandscape].CGPath];
            [thirdPartOfPicture setPath:[self getThirdPartOfLandscape].CGPath];
        } else if ([self.defaultPicture isEqualToString:@"Planet"]) {
            [firstPartOfPicture setPath:[self getFirstPartOfPlanet].CGPath];
            [secondPartOfPicture setPath:[self getSecondPartOfPlanet].CGPath];
            [thirdPartOfPicture setPath:[self getThirdPartOfPlanet].CGPath];
        } else {
            NSLog(@"NO PICTURE");
        }
        
        [firstPartOfPicture setStrokeStart:0];
        [firstPartOfPicture setStrokeEnd:0];
        [firstPartOfPicture setFillColor:UIColor.clearColor.CGColor];
        [firstPartOfPicture setStrokeColor:self.arrayOfColors[0].CGColor];
        [firstPartOfPicture setLineWidth:1.0];
        
        [secondPartOfPicture setStrokeStart:0];
        [secondPartOfPicture setStrokeEnd:0];
        [secondPartOfPicture setFillColor:UIColor.clearColor.CGColor];
        [secondPartOfPicture setStrokeColor:self.arrayOfColors[1].CGColor];
        [secondPartOfPicture setLineWidth:1.0];
        
        [thirdPartOfPicture setStrokeStart:0];
        [thirdPartOfPicture setStrokeEnd:0];
        [thirdPartOfPicture setFillColor:UIColor.clearColor.CGColor];
        [thirdPartOfPicture setStrokeColor:self.arrayOfColors[2].CGColor];
        [thirdPartOfPicture setLineWidth:1.0];
        
        [self.CanvasView.layer addSublayer:firstPartOfPicture];
        [self.CanvasView.layer addSublayer:secondPartOfPicture];
        [self.CanvasView.layer addSublayer:thirdPartOfPicture];
        
        // NSTimer
        self.mytimer = [NSTimer scheduledTimerWithTimeInterval:0.0167 repeats:YES block:^(NSTimer * _Nonnull timer) {
            
            float timedraw = self.defaultDrawingTime;
            
            if (firstPartOfPicture.strokeEnd >= 1 && secondPartOfPicture.strokeEnd >= 1 && thirdPartOfPicture.strokeEnd >= 1) {
                [self.mytimer invalidate];
                
                [self.drawBtn setTitle:@"Reset" forState:UIControlStateNormal];
                self.drawBtn.enabled = YES;
                self.shareBtn.enabled = YES;
            }
            
            float line = 1.0f / (60.0f * timedraw);
            [firstPartOfPicture setStrokeEnd:firstPartOfPicture.strokeEnd += line];
            [secondPartOfPicture setStrokeEnd:secondPartOfPicture.strokeEnd += line];
            [thirdPartOfPicture setStrokeEnd:thirdPartOfPicture.strokeEnd += line];
        }];
    }
}

- (IBAction)saveImage:(id)sender {
               
    UIGraphicsBeginImageContextWithOptions(self.CanvasView.bounds.size, YES, 0);
    self.CanvasView.layer.cornerRadius = 0.0;
    [self.CanvasView.layer renderInContext:UIGraphicsGetCurrentContext()];
    self.CanvasView.layer.cornerRadius = 8.0;
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
        
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[image, self] applicationActivities:nil];
    activityViewController.popoverPresentationController.sourceView = self.shareBtn;
    [self presentViewController:activityViewController animated:YES completion:nil];
    
}

- (LPLinkMetadata *)activityViewControllerLinkMetadata:(UIActivityViewController *)activityViewController API_AVAILABLE(ios(13.0))
{
    UIImage * theImage = [UIImage imageNamed: @"miniIcon"];
    NSItemProvider * iconProvider = [[NSItemProvider alloc] initWithObject:theImage];
    LPLinkMetadata * metaData = [[LPLinkMetadata alloc] init];
    metaData.iconProvider = iconProvider;

    return metaData;
}

@end
