//
//  TabBarController.m
//  TabBarWithNav
//
//  Created by  on 30/09/15.
//  Copyright © 2015 . All rights reserved.
//

#import "TabBarController.h"

@implementation TabBarController

@synthesize segmentControl;
@synthesize videoLIS;
//@synthesize checkSegmentedControlState;

- (void)viewDidLoad {
    [super viewDidLoad];
//    videoLIS=TRUE;
//    NSLog(videoLIS ? @"LIS" : @"Testo");

    
    // Do any additional setup after loading the view, typically from a nib.
}
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
//            videoLIS=FALSE;
//            NSLog(videoLIS ? @"LIS" : @"Testo");

            break;
        default:
            break;
    //proviamo la strada delle Notifiche
  }
}

-(BOOL)statoLIS{
    return self.videoLIS;
}

//-(BOOL)checkSegmentedControlState{
//    if ((segmentControl.selectedSegmentIndex==0)) {
////            NSLog(videoLIS ? @"LIS" : @"Testo");
//            return TRUE;
//            }
//            else
//            {
////            NSLog(videoLIS ? @"LIS" : @"Testo");
//            return FALSE;
//            }
//    }
@end
