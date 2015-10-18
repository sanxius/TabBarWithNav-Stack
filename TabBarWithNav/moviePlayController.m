//
//  moviePlayController.m
//  
//
//  Created by  on 12/10/15.
//  Copyright © 2015 . All rights reserved.
//

#import "moviePlayController.h"
#import "TabBarWithNav-Swift.h"
#import "TabBarController.h"

@implementation moviePlayController

@synthesize segmentControl;

NSString *selectMovie;


- (void)viewDidLoad {

[super viewDidLoad];

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

//immagine sul background
UIGraphicsBeginImageContext(self.view.frame.size);
[[UIImage imageNamed:@"sfondo1334x750.png"] drawInRect:self.view.bounds];
UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
UIGraphicsEndImageContext();
self.view.backgroundColor = [UIColor colorWithPatternImage:image];
//Background
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//preparazione a passare al Film o al Testo
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@" , @"effettuato Segue");
    NSString *selectedFilm;
    
    selectedFilm=sender;
    
    if ([segue.identifier isEqualToString:@"segueVideo"]) {
        
        playMovieSwift *destViewController = segue.destinationViewController;
        NSLog(@"%@ in segueVideo" , selectedFilm);
        [destViewController playVideo:selectedFilm];
        
    }
    if ([segue.identifier isEqualToString:@"segueTesto"]) {
        NSLog(@"%@ in segueTesto" , selectedFilm);
        TextControllerSwift *destViewController = segue.destinationViewController;
        [destViewController playText:selectedFilm];
        
    }
}


- (void)oneFingerOneTap
{
    NSLog(@"Action: One finger, two taps");
    NSString *showFilm;
    showFilm = selectMovie;
    NSLog(@"%@ in segueTesto" , selectMovie);

    NSLog(@"%@ in segueTesto" , showFilm);

    if (self.segmentControl.selectedSegmentIndex==0)
    {
        [self performSegueWithIdentifier:@"segueVideo" sender:showFilm];
    }
//    else
//    {
//        [self performSegueWithIdentifier:@"segueTesto" sender:showFilm];
//    }
}


-(void)playSelezione:(NSString *)selected
{
    NSLog(@"%@ in moviePlayController" , selected);
    selectMovie=selected;
    NSLog(@"%@ in moviePlayController" , selectMovie);

}


//controllo come è messo il Segmented.... Approfondimento o LIS
-(IBAction) segmentedControlChanged{
    
    switch (segmentControl.selectedSegmentIndex) {
        case 0:
            //            NSLog(videoLIS ? @"LIS" : @"Testo");
            NSLog(@"LIS Selected");
            //            videoLIS=TRUE;
            //            NSLog(videoLIS ? @"LIS" : @"Testo");
            
            break;
        case 1:
            //            NSLog(videoLIS ? @"LIS" : @"Testo");
            
            NSLog(@"TESTO Selected");
            [self performSegueWithIdentifier:@"segueTesto" sender:selectMovie];
            segmentControl.selectedSegmentIndex=0;
            //            videoLIS=FALSE;
            //            NSLog(videoLIS ? @"LIS" : @"Testo");
            
            break;
        default:
            break;
            //proviamo la strada delle Notifiche
    }
}

@end
