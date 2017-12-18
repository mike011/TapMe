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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Implementing our method
- (IBAction)buttonPressed{
    count++;
    
    label.text = [NSString stringWithFormat:@"Score\n%i",count];
}

- (void)setupGame{
    _seconds = 30;
    count = 0;
    
    timerLabel.text = [NSString stringWithFormat:@"Time: %i",_seconds];
    label.text = [NSString stringWithFormat:@"Score\n%i",count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];

}

- (void)subtractTime{
    _seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %i",_seconds];
    
    if(_seconds == 0){
        [timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You scored %i points",count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self setupGame];
}

@end
