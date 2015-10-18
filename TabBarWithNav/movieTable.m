//
//  movieTable.m
//  TabBarWithNav
//
//  Created by  on 20/09/15.
//  Copyright (c) 2015 . All rights reserved.
//

#import "movieTable.h"
#import "moviePlayController.h"


@interface movieController ()

@end

@implementation movieController {
    NSArray *movieCell;
    NSArray *anteprimamovieCell;
    NSArray *selectMovie;
}

@synthesize segmentControl;
//@synthesize videoLIS;


//@synthesize tableView;
UITableView *tableView;

// 18 elementi = Diciasette Filmati

- (void)viewDidLoad {
    
    movieCell = [NSArray arrayWithObjects:@"Guida Museo", @"Guida Museo2", @"Guida Museo3", @"Guida Museo4", @"Guida Museo5", @"Guida Museo6", @"Guida Museo7", @"Guida Museo8", @"Guida Museo9", @"Guida Museo10", @"Guida Museo11", nil];
    
    anteprimamovieCell = [NSArray arrayWithObjects:@"1_a.jpg", @"2_a.jpg", @"3_a.jpg", @"4_a.jpg", @"5_a.jpg", @"6_a.jpg", @"7_a.jpg", @"8_a.jpg", @"9_a.jpg", @"10_a.jpg", @"11_a.jpg", nil];
    
    selectMovie = [NSArray arrayWithObjects:@"1_a", @"2_a", @"3_a", @"4_a", @"5_a", @"6_a", @"7_a", @"8_a", @"9_a", @"10_a", @"11_a", nil];
  
    
    [super viewDidLoad];
    
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [movieCell count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *simpleTableIdentifier = @"vocemovieCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text=[movieCell objectAtIndex:indexPath.row];
    cell.imageView.image =[UIImage imageNamed:[anteprimamovieCell objectAtIndex:indexPath.row]];
    
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"STANZE MUSEO";
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Metodo che segnala il nr riga toccata
    NSInteger _lastClickedRow;
    NSString *selectedFilm;
    
    
    NSInteger row = indexPath.row;

    
    _lastClickedRow = indexPath.row;
    
    //nr di cella toccata --> vado a selezionare il filmato.
    NSLog(@"%ld" , (long)_lastClickedRow);
    
    NSLog(@"%ld" , (long)row);
    
    selectedFilm=[selectMovie objectAtIndex:indexPath.row];
    NSLog(@"%@ in didSelectRowAtIndexPath" , selectedFilm);
    
    
    [self performSegueWithIdentifier:@"segueSelezione" sender:selectedFilm];

//    //Verifico STato della proprio UISegmentedControl
//    if (self.segmentControl.selectedSegmentIndex==0)
//    {
//        [self performSegueWithIdentifier:@"segueVideo" sender:selectedFilm];
//    }
//    else
//    {
//        [self performSegueWithIdentifier:@"segueTesto" sender:selectedFilm];
//    }

    
 //   [self performSegueWithIdentifier:@"segueVideo" sender:selectedFilm];

//    Mi restituisce la RIGA
//    [self performSegueWithIdentifier:@"segueVideo" sender:indexPath];

    
    //[myMovie moviePlayer:selectedMovie];
    
    //[myMovie playVideo:_lastClickedRow];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@" , @"effettuato Segue");
    NSString *selectedFilm;
    
    selectedFilm=sender;
    
    if ([segue.identifier isEqualToString:@"segueSelezione"]) {
        
        moviePlayController *destViewController = segue.destinationViewController;

        NSLog(@"%@ in Segue" , selectedFilm);
        [destViewController playSelezione:selectedFilm];
        
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
