//
//  UIImage+Size.m
//  百思不得姐
//
//  Created by 付星 on 2016/11/26.
//  Copyright © 2016年 yizzuide. All rights reserved.
//

#import "UIImage+Size.h"

@implementation UIImage (Size)

- (UIImage *)topPartImageForDestSize:(CGSize)dest;
{
    UIGraphicsBeginImageContextWithOptions(dest, NO, 0.0);
    CGFloat h = dest.width * self.size.height / self.size.width;
    [self drawInRect:CGRectMake(0, 0, dest.width, h)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

- (UIImage *)cricle
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *cricle = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return cricle;
}
@end
