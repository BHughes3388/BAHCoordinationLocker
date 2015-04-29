//
//  BAHCoordinationLockerViewController.m
//  Pods
//
//  Created by BHughes on 4/18/15.
//
//

#import "BAHCoordinationLockerViewController.h"

@interface BAHCoordinationLockerViewController ()

@end

@implementation BAHCoordinationLockerViewController{
    
    UIViewController *destinationView;
    BOOL animated;
    UILabel *unlockLabel;
    CFTimeInterval button1TapTime;
    CFTimeInterval button2TapTime;
    
    

}

@synthesize backgroundColor = _backgroundColor;
@synthesize tapViewSize = _tapViewSize;
@synthesize backGroundImage = _backGroundImage;
@synthesize frostedViewBackGroundColor = _frostedViewBackGroundColor;
@synthesize topTapViewTintColor = _topTapViewTintColor;
@synthesize topTapViewBorderTintColor = _topTapViewBorderTintColor;
@synthesize bottomTapViewTintColor = _bottomTapViewTintColor;
@synthesize bottomTapViewBorderTintColor = _bottomTapViewBorderTintColor;
@synthesize successLabelText = _successLabelText;
@synthesize successLabelTextColor = _successLabelTextColor;
@synthesize successLabelFont = _successLabelFont;
@synthesize tollerance = _tollerance;

@synthesize activateHour = _activateHour;
@synthesize deActivateHour = _deActivateHour;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureBackGroundView];
    [self configureTapView];
}

- (void)configureBackGroundView{
    
    //Sets a default color for the blur/frosted overlay
    if (!self.frostedViewBackGroundColor) {
        self.frostedViewBackGroundColor = [UIColor colorWithWhite:1.0f alpha:0.75f];
    }
    
    //Configures the backgroundView with an image or color
    self.backGroundImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.backGroundImageView setBackgroundColor:self.backgroundColor];
    [self.backGroundImageView setImage:self.backGroundImage];
    [self.view addSubview:self.backGroundImageView];
    
    //configures the blur/frosted view and add it above the backgroundImageView
    self.frostedView = [[UIView alloc]initWithFrame:self.view.frame];
    [self.frostedView setBackgroundColor:self.frostedViewBackGroundColor];
    [self.backGroundImageView addSubview:self.frostedView];

    
}

- (void)configureTapView{
    
    
    //Sets defaults for the top and bottom taps
    if (!self.tapViewSize) {
        self.tapViewSize = 75;
    }
    if (!self.topTapViewTintColor) {
        self.topTapViewTintColor = [UIColor colorWithRed:105/255.0f green:205/255.0f blue:245/255.0f alpha:0.75];
    }
    if (!self.bottomTapViewTintColor) {
        self.bottomTapViewTintColor = [UIColor colorWithRed:105/255.0f green:205/255.0f blue:245/255.0f alpha:0.75];
    }
    if (!self.topTapViewBorderTintColor) {
        self.topTapViewBorderTintColor = [UIColor whiteColor].CGColor;
    }
    if (!self.bottomTapViewBorderTintColor) {
        self.bottomTapViewBorderTintColor = [UIColor whiteColor].CGColor;
    }
    
    //configures topTabView
    self.topTapView = [self fingerTapView:self.tapViewSize];
    [self.topTapView setCenter:CGPointMake(self.view.center.x, 100)];
    self.topTapView.gestureRecognizers = [NSArray arrayWithObject:[self gestureRecognizerForTop]];
    [self.topTapView setBackgroundColor:self.topTapViewTintColor];
    [self.topTapView.layer setBorderColor:self.topTapViewBorderTintColor];
    [self.view addSubview:self.topTapView];
    
    //configures bottomTapView
    self.bottomTapView = [self fingerTapView:self.tapViewSize];
    [self.bottomTapView setCenter:CGPointMake(self.view.center.x, self.view.frame.size.height - 100)];
    self.bottomTapView.gestureRecognizers = [NSArray arrayWithObject:[self gestureRecognizerForBottom]];
    [self.bottomTapView setBackgroundColor:self.bottomTapViewTintColor];
    [self.bottomTapView.layer setBorderColor:self.bottomTapViewBorderTintColor];
    [self.view addSubview:self.bottomTapView];

}

-(void)animationLoop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    //This is where all the animation happens. It will simply repeat until it is unlocked.
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    //Randomly generates points for the topTabView that are within the screens width and the top half of the screen.
    CGFloat x = (self.tapViewSize/2) + (CGFloat) (arc4random() % (int) ((self.view.bounds.size.width) - self.tapViewSize));
    CGFloat y = (self.tapViewSize/2) + (CGFloat) (arc4random() % (int) ((self.view.bounds.size.height/2) - self.tapViewSize));
    
    CGPoint squarePostion = CGPointMake(x, y);
    self.topTapView.center = squarePostion;
    
    //Randomly generates points for the bottomTabView that are within the screens width and the bottom half of the screen.
    CGFloat x2 = (self.tapViewSize/2) + (CGFloat) (arc4random() % (int) ((self.view.bounds.size.width) - self.tapViewSize));
    CGFloat y2 = ((self.view.bounds.size.height/2) + (self.tapViewSize/2)) + (CGFloat) (arc4random() % (int) (self.view.bounds.size.height - ((self.view.bounds.size.height/2) + self.tapViewSize)));
    
    CGPoint squarePostion2 = CGPointMake(x2, y2);
    self.bottomTapView.center = squarePostion2;
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationLoop:finished:context:)];
    
    [UIView commitAnimations];
}

- (UITapGestureRecognizer*)gestureRecognizerForTop{
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapFromTop:)];
    [gestureRecognizer setDelegate:self];
    [gestureRecognizer setNumberOfTapsRequired:1];
    return gestureRecognizer;
}

- (UITapGestureRecognizer*)gestureRecognizerForBottom{
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapFromBottom:)];
    [gestureRecognizer setDelegate:self];
    [gestureRecognizer setNumberOfTapsRequired:1];
    return gestureRecognizer;
}


- (UIView*)fingerTapView:(float)size{
    
    //Generates the tabViews.. which at this point is always a circle
    
    CGRect tabRect = CGRectMake(0, 0, size, size);
    
    UIView *tapView = [[UIView alloc]initWithFrame:tabRect];
    [tapView.layer setCornerRadius:size/2];
    [tapView.layer setBorderWidth:2.0f];
    [tapView setClipsToBounds:YES];
    return tapView;
    
}


- (void)handleTapFromTop:(UITapGestureRecognizer *)tapRecognizer{
    
    if (tapRecognizer.state == UIGestureRecognizerStateEnded)
    {
        button1TapTime = CACurrentMediaTime();
        [self testForSimultaneousTap];
    }
    
    
}

- (void)handleTapFromBottom:(UITapGestureRecognizer *)tapRecognizer{
    
    if (tapRecognizer.state == UIGestureRecognizerStateEnded)
    {
        button2TapTime = CACurrentMediaTime();
        [self testForSimultaneousTap];
    }
    
}

- (void)testForSimultaneousTap{
    
    //Test to see if the time between the touching of each view is under or equale to the tollerance
    if (!self.tollerance) {
        self.tollerance = 0.2;
    }
    
    if (fabs(button1TapTime - button2TapTime) <= self.tollerance)
    {
        // Do stuff
        [self successfulUnlock];
    }
    
}

- (void) lockView:(UIViewController*)view{
    
    [self lockView:view animated:NO];
    
}

- (void) lockView:(UIViewController*)viewController animated:(BOOL)flag{
    
    destinationView = viewController;
    animated = flag;
    [self lockView];

}

- (void)lockView{
    
    self.view.layer.affineTransform = CGAffineTransformMakeScale(0.0, 0.0);
    [self.view setAlpha:0.0f];
    
    [destinationView.view addSubview:self.view];
    
    CGFloat duration;
    if (animated) {
        duration =.5f;

    }else{
        duration = 0.0f;
    }
    
    [UIView animateWithDuration:duration
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         self.view.layer.affineTransform = CGAffineTransformMakeScale(1.15, 1.15);
                         [self.view setAlpha:0.8];

                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.2f
                                               delay:0.0f
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{

                                              self.view.layer.affineTransform = CGAffineTransformMakeScale(1.0, 1.0);
                                              [self.view setAlpha:1.0f];
                                              
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              
                                              [destinationView presentViewController:self animated:NO completion:^{
                                                  [self animationLoop:@"loop" finished:[NSNumber numberWithInt:1] context:nil];
                                              }];
                                              [self.view removeFromSuperview];
                                              
                                          }];
                         
                     }];
    
}


- (void)successfulUnlock{
    
    if (!self.successLabelText) {
        self.successLabelText = @"Unlocked!";
    }
     
    if (!self.successLabelTextColor) {
        self.successLabelTextColor = [UIColor colorWithRed:255/255.0f green:0/255.0f blue:30/255.0f alpha:.5f];
    }
    if (!self.successLabelFont) {
        self.successLabelFont = [UIFont fontWithName:@"HelveticaNeue" size:45];
    }
  
    unlockLabel = [[UILabel alloc]init];
    [unlockLabel setText:self.successLabelText];
    [unlockLabel setFont:self.successLabelFont];
    [unlockLabel setTextColor:self.successLabelTextColor];
    [unlockLabel sizeToFit];
    [unlockLabel setCenter:self.view.center];

    unlockLabel.layer.affineTransform = CGAffineTransformMakeScale(0.0, 0.0);
    [unlockLabel setAlpha:0.0f];
    
    [self.view addSubview:unlockLabel];

    
    [UIView animateWithDuration:0.75f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         unlockLabel.layer.affineTransform = CGAffineTransformMakeScale(1.35, 1.35);
                         [unlockLabel setAlpha:1.0f];
                         [self.topTapView setAlpha:0.0f];
                         [self.bottomTapView setAlpha:0.0f];
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.2f
                                               delay:0.0f
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              
                                              unlockLabel.layer.affineTransform = CGAffineTransformMakeScale(1.0, 1.0);
                                              
                                          }
                                          completion:^(BOOL finished) {
                                            
                                              [self performSelector:@selector(unlockViewController) withObject:nil afterDelay:0.5f];
                            
                     }];
    
                     }];
    
}

- (void) unlockViewController{
    
    [self.view insertSubview:destinationView.view atIndex:0];
    destinationView.view.layer.affineTransform = CGAffineTransformMakeScale(0.95, 0.95);

    [UIView animateWithDuration:0.55f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                        
                         [self.backGroundImageView setAlpha:0.0f];
                         [unlockLabel setAlpha:0.0f];
                         destinationView.view.layer.affineTransform = CGAffineTransformMakeScale(1.0, 1.0);
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [self dismissViewControllerAnimated:NO completion:nil];
                         [destinationView.view removeFromSuperview];

                     }];
    
}

- (void)checkSettingsForCoordinationLockerOnView:(UIViewController*)viewController{
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
    NSInteger currentHour = [components hour];
    NSInteger currentMinute = [components minute];
    NSInteger currentSecond = [components second];
    
    NSNumber *activateHour = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"activate_hour"];
    
    NSNumber *deActivateHour = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"deactivate_hour"];
    
    if (currentHour < deActivateHour.integerValue && (currentHour > activateHour.integerValue || (currentMinute < 0 || currentSecond < 0))) {
        // Lock the view
        [self lockView:viewController animated:YES];
    }else{
        
    }
}

+ (void)setActivateHour:(NSNumber *)activateHour{
    
    [[NSUserDefaults standardUserDefaults] setObject:activateHour forKey:@"activate_hour"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+ (void)setDeActivateHour:(NSNumber *)deActivateHour{
    
    [[NSUserDefaults standardUserDefaults] setObject:deActivateHour forKey:@"deactivate_hour"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}


-(BOOL)shouldAutorotate{
    
    return NO;
}

-(NSUInteger)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationPortrait;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
