//
//  QRViewController.m
//  TabBarWithNav
//
//  Created by  on 20/09/15.
//  Copyright (c) 2015 . All rights reserved.
//

#import "QRViewController.h"
#import "TabBarWithNav-Swift.h"
#import "TabBarController.h"

@interface QRViewController ()

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
//@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic) BOOL isReading;

-(BOOL)startReading;
-(void)stopReading;

@end

@implementation QRViewController

@synthesize segmentControl;
//@synthesize videoLIS;

NSString *stringValue;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initially make the captureSession object nil.
    _captureSession = nil;
    
    // Set the initial value of the flag to NO.
    _isReading = NO;
    
    
    //immagine sul background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"sfondo1334x750.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sfondo1334x750"]];
//    [self.view addSubview:backgroundView];

    
}


// Delegati per far presente che si è in BackGround o si è VIVI

//-(void)viewWillAppear:(BOOL)animated
//{
//    
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationIsActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
//    
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationEnteredForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
//}
//
//- (void)applicationIsActive:(NSNotification *)notification {
//    NSLog(@"Application Did Become Active");
//}
//
//- (void)applicationEnteredForeground:(NSNotification *)notification {
//    NSLog(@"Application Entered Foreground");
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)startReading {
    NSError *error;
    
    // Get an instance of the AVCaptureDevice class to initialize a device object and provide the video
    // as the media type parameter.
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Get an instance of the AVCaptureDeviceInput class using the previous device object.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
    
    if (!input) {
        // If any error occurs, simply log the description of it and don't continue any more.
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    // Initialize the captureSession object.
    _captureSession = [[AVCaptureSession alloc] init];
    // Set the input device on the capture session.
    [_captureSession addInput:input];
    
    
    // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [_captureSession addOutput:captureMetadataOutput];
    
    // Create a new serial dispatch queue.
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:[NSArray arrayWithObject:AVMetadataObjectTypeQRCode]];
    
    // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
    _videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    [_videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_videoPreviewLayer setFrame:_viewPreview.layer.bounds];
    [_viewPreview.layer addSublayer:_videoPreviewLayer];
    
    
    // Start video capture.
    [_captureSession startRunning];
    
    return YES;
}

-(void)stopReading{
    // Stop video capture and make the capture session object nil.
    [_captureSession stopRunning];
    _captureSession = nil;
    
    // Remove the video preview layer from the viewPreview view's layer.
    [_videoPreviewLayer removeFromSuperlayer];
    
    if (self.segmentControl.selectedSegmentIndex==0)
    {
        [self performSegueWithIdentifier:@"segueQRVideo" sender:stringValue];
    }
    else
    {
        [self performSegueWithIdentifier:@"segueQRTesto" sender:stringValue];
    }
//    [self performSegueWithIdentifier:@"segueQR" sender:stringValue];

}


//Parte l'azione dopo avere cliccato.
- (IBAction)startStopReading:(id)sender{
    if (!_isReading) {
        // This is the case where the app should read a QR code when the start button is tapped.
        if ([self startReading]) {
            // If the startReading methods returns YES and the capture session is successfully
            // running, then change the start button title and the status message.
        }
    }
    else{
        // In this case the app is currently reading a QR code and it should stop doing so.
        [self stopReading];
    }
    
    _isReading = !_isReading;
}


#pragma mark - AVCaptureMetadataOutputObjectsDelegate method implementation

-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{

    // Check if the metadataObjects array is not nil and it contains at least one object.
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        // Get the metadata object.
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
            // If the found metadata is equal to the QR code metadata then update the status label's text,
            // stop reading and change the bar button item's title and the flag's value.
            // Everything is done on the main thread.
//            [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
        stringValue = metadataObj.stringValue ? metadataObj.stringValue : @"Unable to decode";
            
            //check stringValue
            
            NSString *nomeFile = [stringValue stringByAppendingString:@".m4v"];
                                  
            NSLog(@"%@", nomeFile);
        
            NSString *path = [[NSBundle mainBundle] pathForResource:stringValue ofType:@"m4v"];
            
            NSLog(@"%@", path);

            if (path!=nil) {
            // Trovata la Risorsa per cui vado dentro l'if
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
//            [_bbitemStart performSelectorOnMainThread:@selector(setTitle:) withObject:@"Start!" waitUntilDone:NO];
            
            _isReading = NO;
            }
            else {
                NSLog(@"%@",@"Path Inesistente");
            }
            
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@" , @"effettuato Segue");
    NSString *selectedQRFilm;
    
    selectedQRFilm=sender;
    
    if ([segue.identifier isEqualToString:@"segueQRVideo"]) {
    
        
        playMovieSwift *destViewController = segue.destinationViewController;
    
        NSLog(@"%@ in segueQRVideo" , selectedQRFilm);
        [destViewController playVideo:selectedQRFilm];
        
    }

    if ([segue.identifier isEqualToString:@"segueQRTesto"]) {
    
            NSLog(@"%@ in segueQRTesto" , selectedQRFilm);
            TextControllerSwift *destViewController = segue.destinationViewController;
            //        TextController *destViewController = segue.destinationViewController;
            [destViewController playText:selectedQRFilm];
            //        [destViewController viewDidLoad];
            
    }
    
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

@end