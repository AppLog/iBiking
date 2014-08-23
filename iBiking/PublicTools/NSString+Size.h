//
//  NSString+Size.h
//  iHome
//
//  Created by shangze_mac_20131209 on 14-5-26.
//  Copyright (c) 2014年 com.9tong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)

-(CGSize)boundingRectWithSize:(CGSize)size
                 withTextFont:(UIFont *)font
              withLineSpacing:(CGFloat)lineSpacing;
//sting转AttributedString
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing;
@end
