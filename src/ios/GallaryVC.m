//
//  GallaryVC.m
//  zooming
//
//  Created by mac on 27/04/1937 SAKA.
//  Copyright (c) 1937 SAKA grr. All rights reserved.
//

#import "GallaryVC.h"

@interface GallaryVC ()

@end

@implementation GallaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setScrollViewConfig];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)btnCloseAvtion:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;{
    
    NSLog(@"scrollView.conf x=%F",scrollView.contentOffset.x);
    
    // First, determine which page is currently visible
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    indexCurrentImage=page;
    
    NSLog(@"page =%ld",(long)indexCurrentImage);
    
     NSLog(@"Image URL =%@",[self.arrImages objectAtIndex:indexCurrentImage]);
}
-(void)setScrollViewConfig{
    
    self.mainScrollView=[[UIScrollView alloc]initWithFrame:self.view.frame];
    self.mainScrollView.backgroundColor=[UIColor grayColor];
    self.mainScrollView.delegate=self;
    self.mainScrollView.pagingEnabled=YES;
    
    topView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 50)];
    topView.backgroundColor=[UIColor blackColor];
    topView.layer.opacity=0.4;
    
    btnClose=[[UIButton alloc]initWithFrame:CGRectMake(5, 2.5, 40, 40)];
    btnClose.backgroundColor=[UIColor redColor];
    [btnClose setImage:[UIImage imageNamed:@"close2.png"] forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(btnCloseAvtion:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btnClose];
    [self.view addSubview:topView];
    
    topView.hidden=NO;
    
    NSInteger intXpos=self.view.frame.size.width;
    
    
    self.arrImagesViews=[[NSMutableArray alloc]init];
    indexCurrentImage=0;
    self.mainScrollView.scrollEnabled=YES;

/*self.arrImages= [[NSMutableArray alloc]initWithObjects:
                      [UIImage imageNamed:@"1.jpg"],
                      [UIImage imageNamed:@"2.jpg"],
                      [UIImage imageNamed:@"3.jpg"],
                      [UIImage imageNamed:@"4.jpg"],
                      [UIImage imageNamed:@"5.jpg"],
                      [UIImage imageNamed:@"6.jpg"],
                      [UIImage imageNamed:@"7.jpg"],
                      [UIImage imageNamed:@"8.jpg"],
                      [UIImage imageNamed:@"9.jpg"],
                      nil];

<<<<<<< HEAD
*/
    
    NSLog(@"self.arrImages count = %d",self.arrImages.count);

=======

*/
>>>>>>> origin/master
    for (int i=0; i<[self.arrImages count]; i++)
    {
        
        AsyncImageView *imgView = [[AsyncImageView alloc]initWithFrame:CGRectMake((i*intXpos)+10, 2, self.view.frame.size.width-20, self.view.frame.size.height)];
<<<<<<< HEAD
        NSString* escapedUrlString =
        [[[self.arrImages objectAtIndex:i]objectForKey:@"image"] stringByAddingPercentEscapesUsingEncoding:
         NSUTF8StringEncoding];

        imgView.imageURL =[NSURL URLWithString:escapedUrlString];
        //imgView.image = [self.arrImages objectAtIndex:i];
=======



        //imgView.imageURL =[NSURL URLWithString:[[self.arrImages objectAtIndex:i]objectForKey:@"image"]];
        imgView.image = [self.arrImages objectAtIndex:i];
>>>>>>> origin/master

        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.clipsToBounds = YES;
        imgView.backgroundColor=[UIColor clearColor];
        [imgView setTag:i];
        [self.mainScrollView addSubview:imgView];
        
         UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewSingleTapped:)];
        singleTapRecognizer.numberOfTapsRequired = 1;
        [self.mainScrollView addGestureRecognizer:singleTapRecognizer];
        // Add doubleTap recognizer to the scrollView
        UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        
        [self.mainScrollView addGestureRecognizer:doubleTapRecognizer];
        [self.arrImagesViews addObject:imgView];
    }
    
    self.mainScrollView.contentSize=CGSizeMake(self.view.frame.size.width, 0);
    self.mainScrollView.backgroundColor=[UIColor grayColor];
    /*[self.view addSubview:self.mainScrollView];*/
    
}


#pragma mark -
#pragma mark - ScrollView gesture methods
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    // Get the location within the image view where we tapped
    CGPoint pointInView = [recognizer locationInView:self.mainScrollView];
    
    NSLog(@"pointInView X=%f Y=%f",pointInView.x,pointInView.y);
    
    NSLog(@"page =%ld",(long)indexCurrentImage);
    
    if (zoomingView) {
        zoomingView=nil;
    }
    topView.hidden=YES;
    zoomingView =[[ ZoomingView alloc] initWithNibName:@"ZoomingView" bundle:nil];
    
    AsyncImageView *imgView     =   [self.arrImagesViews objectAtIndex:indexCurrentImage];
    zoomingView.mainImage       =   imgView.image;
    [self presentViewController:zoomingView animated:NO completion:nil];
}

- (void)scrollViewSingleTapped:(UITapGestureRecognizer*)recognizer {
    // Get the location within the image view where we tapped
    CGPoint pointInView = [recognizer locationInView:self.mainScrollView];
    
    NSLog(@"pointInView X=%f Y=%f",pointInView.x,pointInView.y);
    
    NSLog(@"page =%ld",(long)indexCurrentImage);

    
    [self.view bringSubviewToFront:topView];
    
    topView.hidden=NO;
}




@end
