//
//  introMovie.h
//  TabBarWithNav
//
//  Created by  on 25/09/15.
//  Copyright © 2015 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface introMovie : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;

@property (weak, nonatomic) IBOutlet UIImageView *introPush;


//@property (readwrite) BOOL *videoLIS;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

-(IBAction) segmentedControlChanged;

@end
