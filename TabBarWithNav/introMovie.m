//
//  introMovie.m
//  TabBarWithNav
//
//  Created by  on 25/09/15.
//  Copyright © 2015 . All rights reserved.
//

#import "introMovie.h"
#import "TabBarWithNav-Swift.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TextController.h"

@implementation introMovie

@synthesize segmentControl;
//@synthesize videoLIS;

NSString *selectIntroMovie;


- (void)viewDidLoad {
    
    [super viewDidLoad];
    selectIntroMovie = @"0-001-004-LIS-Rosella";
    self.navigationItem.title=@"INTRODUZIONE";

    // -----------------------------
    // One finger, two taps
    // -----------------------------
    
    // Create gesture recognizer
    UITapGestureRecognizer *oneFingerOneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerOneTap)];
    
    // Set required taps and number of touches
    [oneFingerOneTap setNumberOfTapsRequired:1];
    [oneFingerOneTap setNumberOfTouchesRequired:1];
    
    // Add the gesture to the view
    [[self view] addGestureRecognizer:oneFingerOneTap];

    //[introImage addGestureRecognizer:singleTap];

//    videoLIS=TRUE;
    
    //immagine sul background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"sfondo1334x750.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)oneFingerOneTap
{
    NSLog(@"Action: One finger, two taps");
    NSString *showIntroFilm;
    showIntroFilm = selectIntroMovie;
    if (self.segmentControl.selectedSegmentIndex==0)
            {
                [self performSegueWithIdentifier:@"segueIntroMovie" sender:showIntroFilm];
            }
//    else
//            {
//                [self performSegueWithIdentifier:@"segueIntroTesto" sender:showIntroFilm];
//            }
}

// Code to respond to gesture here

    // adesso devo compilare un bel segue?

    //    [self performSegueWithIdentifier:@"introVideo" sender:self];

// }


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@" , @"effettuato Segue");
    NSString *selectedIntroFilm;
    
    selectedIntroFilm=sender;
    
    if ([segue.identifier isEqualToString:@"segueIntroMovie"]) {
        
        playMovieSwift *destViewController = segue.destinationViewController;
        
        NSLog(@"%@ in segueIntroMovie" , selectedIntroFilm);
        
        [destViewController playVideo:selectedIntroFilm];
        
//        [segment titleForSegmentAtIndex:segment.selectedSegmentIndex];

    }
    
    if ([segue.identifier isEqualToString:@"segueIntroTesto"]) {
        
        NSLog(@"%@ in segueIntroTesto" , selectedIntroFilm);
        TextControllerSwift *destViewController = segue.destinationViewController;
//        TextController *destViewController = segue.destinationViewController;
        [destViewController playText:selectedIntroFilm];
//        [destViewController viewDidLoad];
    
        }
}


-(IBAction) segmentedControlChanged{
    
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
//            videoLIS=TRUE;
//            NSLog(videoLIS ? @"LIS" : @"Testo");
            NSLog(@"LIS Selected");
            break;
        case 1:

//            videoLIS=FALSE;
//            NSLog(videoLIS ? @"LIS" : @"Testo");
            NSLog(@"TESTO Selected");
            [self performSegueWithIdentifier:@"segueIntroTesto" sender:selectIntroMovie];
            segmentControl.selectedSegmentIndex=0;
            break;
        default:
            break;
            //proviamo la strada delle Notifiche
    }
}

@end
