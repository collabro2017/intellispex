//
//  OMUtilities.h
//  ICYMI
//
//  Created by Zahid Hussain on 30/11/2017.
//  Copyright © 2017 ellisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OMUtilities : NSObject

+(NSString *) getOfflinePostDataDirPath;
+(BOOL) isEventCreatedFromWebConsole:(NSString *) type;
+(NSString *) dateToString:(NSDate *) date format:(NSString *) strFormat;
+(NSString *) removeWhiteSpacesFromString:(NSString *) string;
+(UIImage *) stampOn:(UIImage *)image withDate:(NSDate *) date;
+(UIImage *) drawText:(NSString*) text inImage:(UIImage*) image;
+ (UIImage *)imageFromColor:(UIColor *)color withRect:(CGRect ) rect;
+(UIImage *)mergeImage:(UIImage*)mask overImage:(UIImage*)source inSize:(CGSize)size;

@end
