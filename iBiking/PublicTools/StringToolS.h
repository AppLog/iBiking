//
//  TranslateDateString.h
//  ShangQingTong
//
//  Created by 张 寅 on 3/22/12.
//  Copyright (c) 2012 cmf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringToolS : NSObject
+(NSDictionary*)formatDateAndWeek:(NSString*)_dateStr byFormat:(NSString*)_format toFormat:(NSString*)_2format;

+(NSString*)StringReplaceTandN:(NSString*)aString;

+ (NSString*)URLencode:(NSString *)originalString
        stringEncoding:(NSStringEncoding)stringEncoding;

+(NSString *) FullURLencode:(NSString *)sUrl
             stringEncoding:(NSStringEncoding)stringEncoding;

+(NSString *) FullURLencode:(NSString *)sUrl;
@end
