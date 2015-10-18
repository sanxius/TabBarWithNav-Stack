 //
//  introTable.m
//  TabBarWithNav
//
//  Created by  on 20/09/15.
//  Copyright (c) 2015 . All rights reserved.
//

#import "introTable.h"
#import "TabBarWithNav-Swift.h"

@interface introTable ()

@end

@implementation introTable{
    NSArray *introCell;
    NSArray *anteprimaintroCell;
    NSArray *selectIntroMovie;
}

// 4 elementi = Quattro Filmati

- (void)viewDidLoad {
    
    introCell = [NSArray arrayWithObjects:@"Intro", nil];

    anteprimaintroCell = [NSArray arrayWithObjects:@"1-Guida.jpg", nil];
    
    selectIntroMovie = [NSArray arrayWithObjects:@"0-001-004-LIS-Rosella", nil];
    
    [super viewDidLoad];
    
    UIImageView *preArrowImage =[[UIImageView alloc]init ];
    preArrowImage.image =[UIImage imageNamed:@"RosellaPNG.png"];
    preArrowImage.frame = CGRectMake(20, 60, 10, 30);
    [self.view addSubview:preArrowImage];

    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTapsRequired = 1;
    [preArrowImage setUserInteractionEnabled:YES];
    [preArrowImage addGestureRecognizer:singleTap];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)tapDetected{
    NSLog(@"single Tap on imageview");
}

@end
