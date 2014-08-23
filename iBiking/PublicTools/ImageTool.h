//
//  ImageTool.h
//  iHome
//
//  Created by Chen Shengzhi on 14-5-7.
//  Copyright (c) 2014年 com.9tong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageTool : NSObject
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur ;
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
+ (UIImage *)getSubImage:(UIImage *)image toRect:(CGRect)rect;
@end
