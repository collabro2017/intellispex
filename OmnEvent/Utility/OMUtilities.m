//
//  OMUtilities.m
//  ICYMI
//
//  Created by Zahid Hussain on 30/11/2017.
//  Copyright © 2017 ellisa. All rights reserved.
//

#import "OMUtilities.h"

@implementation OMUtilities

+ (NSString *) getOfflinePostDataDirPath
{
    NSString * offlinePostsDataDirPath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"OfflinePostsData"];
    
    BOOL isDir;
    if(![[NSFileManager defaultManager] fileExistsAtPath:offlinePostsDataDirPath isDirectory:&isDir]) {
        
        NSError * error = nil;
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath: offlinePostsDataDirPath
                                                 withIntermediateDirectories:YES
                                                                  attributes:nil
                                                                       error:&error];
        if (!success)
            NSLog(@"Failed to create directory at path : %@ ", offlinePostsDataDirPath);
        else
            NSLog(@"Successfully created offline posts data directory at path : %@ ", offlinePostsDataDirPath);
    }
    
    NSLog(@"Offline Data Path : %@ ", offlinePostsDataDirPath);
    return offlinePostsDataDirPath;
}
+ (BOOL) isEventCreatedFromWebConsole:(NSString *)type
{
    NSString *eventType = type;
    BOOL blnResult = NO;
    if(eventType != nil && ![eventType isKindOfClass:[NSNull class]] && [[eventType lowercaseString] isEqualToString:@"web-console"]) {
        blnResult = YES;
    }
    
    return blnResult;
}

+ (NSString *) dateToString:(NSDate *) date format:(NSString *) strFormat
{
    //******************
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //    [dateFormat setDateFormat:@"EEE, MMM dd yyyy hh:mm a"];//Wed, Dec 14 2011 1:50 PM
    [dateFormat setDateFormat:strFormat];//Dec 14 2011 1:50 PM
    
    NSString *str_date = [dateFormat stringFromDate:date];
    
    return str_date;
}

+ (NSString *) removeWhiteSpacesFromString:(NSString *)string
{
    NSString *str = [string stringByReplacingOccurrencesOfString:@"  " withString:@""];
    return [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

+ (UIImage *) stampOn:(UIImage *)image withDate:(NSDate *)date
{
    UIImage *finalImage = image;
    BOOL flag = [[NSUserDefaults standardUserDefaults] boolForKey:@"IS_TIMESTAMP_ENABLED"];
    if (flag == TRUE) {
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy/MM/dd HH:mm"];
        
        if (date == nil) {
            date = [NSDate date];
        }
        
        NSString *str_date = [dateFormat stringFromDate:date];
        finalImage = [OMUtilities drawText:str_date inImage:image];
    }
    
    return finalImage;
}

+(UIImage *) drawText:(NSString*) text inImage:(UIImage*) image
{
    
    CGFloat fontSize = 0.06 * image.size.width;
    if (fontSize < 15) {
        fontSize = 15;
    }
    
    CGFloat xPos = image.size.width * 0.05;
    CGFloat yPos = image.size.height - (image.size.height * 0.125);
    
    if ((image.size.width / image.size.height) > 2.0) {
        yPos = image.size.height - ((image.size.width / image.size.height) * 90);
    }
    
    UIFont *font = [UIFont boldSystemFontOfSize:fontSize];
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    CGRect rect = CGRectMake(xPos, yPos, image.size.width, image.size.height);
        
    [[UIColor yellowColor] set];
    [text drawInRect:CGRectIntegral(rect) withFont:font];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageFromColor:(UIColor *)color withRect:(CGRect ) rect{

    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)mergeImage:(UIImage*)mask overImage:(UIImage*)source inSize:(CGSize)size
{
    //Capture image context ref
    
    UIImageView *totalimage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    UIImageView *firstImage=[[UIImageView alloc] initWithImage:mask];
    UIImageView *secondImage=[[UIImageView alloc] initWithImage:source];
    
    [totalimage addSubview:firstImage];
    [totalimage addSubview:secondImage];
    
    UIGraphicsBeginImageContext(totalimage.bounds.size);
    [totalimage.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    //Draw images onto the context
    [source drawInRect:CGRectMake(0, 0, source.size.width, source.size.height)];
    [mask drawInRect:CGRectMake(0, 0, mask.size.width, mask.size.height)];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return viewImage;
}

@end
