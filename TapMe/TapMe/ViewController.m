//
//  ViewController.m
//  Tap Me
//
//  Created by Mike Jaoudi on 10/17/12.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupGame];
}

//Implementing our method
- (IBAction)buttonPressed{
    self.count++;
    
    label.text = [NSString stringWithFormat:@"Score\n%li",self.count];
}

- (void)setupGame{
    self.seconds = 30;
    self.count = 0;
    
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",_seconds];
    label.text = [NSString stringWithFormat:@"Score\n%li",self.count];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    
}

- (void)subtractTime{
    self.seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",_seconds];
    
    if(_seconds == 0){
        [self.timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You scored %li points",self.count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self setupGame];
}

@end

