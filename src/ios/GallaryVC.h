//
//  GallaryVC.h
//  zooming
//
//  Created by mac on 27/04/1937 SAKA.
//  Copyright (c) 1937 SAKA grr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZoomingView.h"
#import "AsyncImageView.h"

@interface GallaryVC : UIViewController<UIScrollViewDelegate>{
    
    NSInteger indexCurrentImage;
    ZoomingView *zoomingView;
    
    IBOutlet UIButton *btnClose;
    IBOutlet UIView   *topView;
    
}
@property (nonatomic, strong) IBOutlet UIScrollView *mainScrollView;
@property (nonatomic, strong) NSArray *arrImages;
@property (nonatomic, strong) NSMutableArray *arrImagesViews;

-(IBAction)btnCloseAvtion:(id)sender;


@end
