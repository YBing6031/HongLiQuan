//
//  UIImage+YBIconFont.m
//  Iconfont封装
//
//  Created by 尚往文化 on 17/2/10.
//  Copyright © 2017年 YBing. All rights reserved.
//

#import "UIImage+YBIconFont.h"
#import "YBIconFont.h"

@implementation UIImage (YBIconFont)

+ (UIImage *)imageWithInfo:(YBIconInfo *)info {
    CGFloat size = info.size;
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat realSize = size * scale;
    UIFont *font = [YBIconFont fontWithSize:realSize];
    UIGraphicsBeginImageContext(CGSizeMake(realSize, realSize));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if ([info.text respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        /**
         * 如果这里抛出异常，请打开断点列表，右击All Exceptions -> Edit Breakpoint -> All修改为Objective-C
         * See: http://stackoverflow.com/questions/1163981/how-to-add-a-breakpoint-to-objc-exception-throw/14767076#14767076
         */
        [info.text drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: info.color}];
    } else {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, info.color.CGColor);
        [info.text drawAtPoint:CGPointMake(0, 0) withFont:font];
#pragma clang pop
    }
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithText:(NSString *)text color:(UIColor *)color size:(CGSize)size
{    
    CGFloat scale = [UIScreen mainScreen].scale;
    UIFont *font = [YBIconFont fontWithSize:size.width*scale];
    UIGraphicsBeginImageContext(CGSizeMake(size.width*scale, size.height*scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if ([text respondsToSelector:@selector(drawAtPoint:withAttributes:)]) {
        [text drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName: color}];
    } else {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CGContextSetFillColorWithColor(context, color.CGColor);
        [text drawAtPoint:CGPointMake(0, 0) withFont:font];
#pragma clang pop
    }
    
    UIImage *image = [UIImage imageWithCGImage:UIGraphicsGetImageFromCurrentImageContext().CGImage scale:scale orientation:UIImageOrientationUp];
    UIGraphicsEndImageContext();
    
    return image;
}

@end
