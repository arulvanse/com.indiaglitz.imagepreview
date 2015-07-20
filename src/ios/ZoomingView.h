//
//  ZoomingView.h
//  zooming
//
//  Created by mac on 27/04/1937 SAKA.
//  Copyright (c) 1937 SAKA grr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface ZoomingView : UIViewController<UIScrollViewDelegate,UIImagePickerControllerDelegate>{
    
  IBOutlet  UIButton *btnClose;
  IBOutlet  UIButton *btnSave;
    
}
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property( nonatomic, strong) NSURL *imageURL;
@property( nonatomic, strong) UIImage *mainImage;

@property (nonatomic, strong) IBOutlet UIView *topView;



@end
