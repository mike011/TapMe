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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    self->label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    self->timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
    _buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    _secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    _backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
    [self setupGame];
}

- (AVAudioPlayer *)setupAudioPlayerWithFile:(NSString *)file type:(NSString *)type
{
    // 1
    //NSString *path = [NSString stringWithFormat:@"%@/%@.%@", [[NSBundle mainBundle] resourcePath], file, type];
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // 2
    NSError *error;
    
    // 3
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // 4
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }
    
    return audioPlayer;
}

//Implementing our method
- (IBAction)buttonPressed{
    self.count++;
    
    label.text = [NSString stringWithFormat:@"Score\n%li",self.count];
    
    [_buttonBeep play];
}

- (void)setupGame{
    self.seconds = 30;
    self.count = 0;
    
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",_seconds];
    label.text = [NSString stringWithFormat:@"Score\n%li",self.count];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];
    
    [_backgroundMusic setVolume:0.3];
    [_backgroundMusic play];
}

- (void)subtractTime{
    self.seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",_seconds];
    
    [_secondBeep play];
    
    if(_seconds == 0){
        [self.timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You scored %li points",self.count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self setupGame];
}

- (void)extraFunction{
    self.seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",_seconds];
    
    [_secondBeep play];
    
    if(_seconds == 0){
        [self.timer invalidate];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!" message:[NSString stringWithFormat:@"You scored %li points",self.count] delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [alert show];
    }
}

@end

