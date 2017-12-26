//
//  ViewController.h
//  Tap Me
//
//  Created by Mike Jaoudi on 10/17/12.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>{
    IBOutlet UILabel *label;
    IBOutlet UILabel *timerLabel;
}

@property AVAudioPlayer *buttonBeep;
@property AVAudioPlayer *secondBeep;
@property AVAudioPlayer *backgroundMusic;

@property (nonatomic, assign) NSTimer *timer;
@property NSInteger count;
@property NSInteger seconds;
- (IBAction) buttonPressed;
- (void)setupGame;
- (void)subtractTime;

@end
