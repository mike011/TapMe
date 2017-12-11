//
//  ViewController.h
//  Tap Me
//
//  Created by Mike Jaoudi on 10/17/12.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel *label;
    IBOutlet UILabel *timerLabel;
    
    NSInteger count;
    NSInteger seconds;
    
    NSTimer *timer; //ADD THIS!!
}

- (IBAction) buttonPressed;
- (void)setupGame;
- (void)subtractTime;

@end
