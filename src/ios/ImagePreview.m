#import "ImagePreview.h"

@implementation ImagePreview

- (void)greet:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];
    NSString* name = [[command arguments] objectAtIndex:0];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:msg];

    [self success:result callbackId:callbackId];
}

- (void)openGallary:(CDVInvokedUrlCommand*)command{
    
    NSString* callbackId = [command callbackId];
   // NSArray* arrImages = [command arguments];
   // NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];
   /* CDVPluginResult* result = [CDVPluginResult
                              resultWithStatus:CDVCommandStatus_OK
                              messageAsString:msg];
    
    [self success:result callbackId:callbackId]; */
    
    NSMutableArray *arrImages = [[NSMutableArray alloc]initWithObjects:
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

    
    if ([arrImages count]>0) {
        GallaryVC *preview =[[ GallaryVC alloc] initWithNibName:@"GallaryVC" bundle:nil];
        preview.arrImages=arrImages;
        UIViewController *rootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
        [rootVC presentViewController:preview animated:YES completion:nil];
        
        
    }
}
- (void) closeGallary:(CDVInvokedUrlCommand*)command{
    
}

@end