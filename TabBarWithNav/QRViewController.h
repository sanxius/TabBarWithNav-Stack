//
//  QRViewController.h
//  TabBarWithNav
//
//  Created by  on 20/09/15.
//  Copyright (c) 2015 . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface QRViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>
//
{
    UISegmentedControl *segmentControl;

}

@property (weak, nonatomic) IBOutlet UIView *viewPreview;
@property (weak, nonatomic) IBOutlet UIButton *buttonStart;
//@property (readwrite) BOOL *videoLIS;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

- (IBAction)startStopReading:(id)sender;
- (IBAction) segmentedControlChanged;

@end





