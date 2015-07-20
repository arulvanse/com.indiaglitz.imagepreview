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
-(IBAction)btnCloseAvtion:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView;{
    
    NSLog(@"scrollView.conf x=%F",scrollView.contentOffset.x);
    
    // First, determine which page is currently visible
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = (NSInteger)floor((scrollView.contentOffset.x * 2.0f + pageWidth) / (pageWidth * 2.0f));
    
    indexCurrentImage=page;
    
    NSLog(@"page =%ld",(long)indexCurrentImage);
}
-(void)setScrollViewConfig{
    topView.hidden=NO;
    
    NSInteger intXpos=self.view.frame.size.width;
    self.mainScrollView.delegate=self;
        
    
    self.arrImagesViews=[[NSMutableArray alloc]init];
    indexCurrentImage=0;
    self.mainScrollView.scrollEnabled=YES;
    for (int i=0; i<[self.arrImages count]; i++)
    {
        
        AsyncImageView *imgView = [[AsyncImageView alloc]initWithFrame:CGRectMake((i*intXpos)+10, 2, self.view.frame.size.width-20, self.view.frame.size.height)];
        imgView.imageURL =[NSURL URLWithString:[[self.arrImages objectAtIndex:i]objectForKey:@"image"]];
        //imgView.image = [self.arrImages objectAtIndex:i];
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
    
    self.mainScrollView.contentSize=CGSizeMake([self.arrImages count]*self.view.frame.size.width, 0);
    self.mainScrollView.backgroundColor=[UIColor grayColor];
    
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
    
    topView.hidden=NO;
}




@end
