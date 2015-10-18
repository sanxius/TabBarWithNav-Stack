//
//  SecondViewController.m
//  TabBarWithNav
//
//  Created by  on 20/09/15.
//  Copyright (c) 2015 . All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //immagine sul background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"sfondo1334x750.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //testoMuseo.font = UIFont(name: "ArialMT", size: 32 )
    //testoMuseo.text=testoMuseo.text.stringByAppendingString(String(testoStanza!))
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return NO; }

@end
