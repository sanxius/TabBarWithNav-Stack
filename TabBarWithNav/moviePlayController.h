//
//  moviePlayController.h
//  
//
//  Created by  on 12/10/15.
//  Copyright © 2015 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface moviePlayController : UIViewController
{
    UISegmentedControl *segmentControl;

}

-(void)playSelezione : (NSString *)selected;

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UIImageView *selectPush;
- (IBAction) segmentedControlChanged;

@end
