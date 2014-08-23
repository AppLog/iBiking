//
//  TranslateDateString.m
//  ShangQingTong
//
//  Created by 张 寅 on 3/22/12.
//  Copyright (c) 2012 cmf. All rights reserved.
//

#import "StringToolS.h"
#import "Definition.h"
@implementation StringToolS
+(NSDictionary*)formatDateAndWeek:(NSString*)_dateStr byFormat:(NSString*)_format toFormat:(NSString*)_2format;
{
    NSDate *tempDate;
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyyMMdd-HHmmss"];
    [formatter setDateFormat:_format];
    tempDate=[formatter dateFromString:_dateStr];
    [formatter setDateFormat:@"EEEE"];    
    NSString *weekStr=[formatter stringFromDate:tempDate];
    [formatter setDateFormat:_2format];
    NSString *formatStr=[formatter stringFromDate:tempDate];
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:weekStr,@"week",formatStr,@"date", nil];
    return dic;
}
+(NSString*)StringReplaceTandN:(NSString*)aString;
{
    return [[aString stringByReplacingOccurrencesOfString:@"\t" withString:@""] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}



//使用自定义的编码格式来编码URL的参数部分
+ (NSString*)URLencode:(NSString *)originalString
        stringEncoding:(NSStringEncoding)stringEncoding
{
    //!  @  $  &  (  )  =  +  ~  `  ;  '  :  ,  /  ?
    //%21%40%24%26%28%29%3D%2B%7E%60%3B%27%3A%2C%2F%3F
    NSArray *escapeChars = [NSArray arrayWithObjects:@";" , @"/" , @"?" , @":" ,
                            @"@" , @"&" , @"=" , @"+" ,    @"$" , @"," ,
                            @"!", @"'", @"(", @")", @"*", nil];
    
    NSArray *replaceChars = [NSArray arrayWithObjects:@"%3B" , @"%2F", @"%3F" , @"%3A" ,
                             @"%40" , @"%26" , @"%3D" , @"%2B" , @"%24" , @"%2C" ,
                             @"%21", @"%27", @"%28", @"%29", @"%2A", nil];
    
    int len = [escapeChars count];
    
    NSMutableString *temp = [[originalString
                              stringByAddingPercentEscapesUsingEncoding:stringEncoding]
                             mutableCopy];
    
    int i;
    for (i = 0; i < len; i++) {
        
        [temp replaceOccurrencesOfString:[escapeChars objectAtIndex:i]
                              withString:[replaceChars objectAtIndex:i]
                                 options:NSLiteralSearch
                                   range:NSMakeRange(0, [temp length])];
    }
    
    NSString *outStr = @"";
    @try {
        outStr = [NSString stringWithString: temp];
        
    }
    @catch (NSException *exception) {
        NSLog(@"Error:%@",exception.description);
    }
    @finally {
        
    }
    
    
    return outStr;
}


//使用自己指定的字符串编码格式编码完整的URL
+(NSString *) FullURLencode:(NSString *)sUrl
           stringEncoding:(NSStringEncoding)stringEncoding;
{
    if (sUrl == nil||[sUrl length ] ==0) {
        SLOG(@"输入的产品地址为空。");
        return @"";
    }
    NSInteger index = 0;
    NSRange range = [sUrl rangeOfString:@"?"];
    index = range.location;
    if (range.location == NSNotFound) {
        return sUrl;
    }
    NSString *sParmeters = [sUrl substringFromIndex:index+1];
    NSString *sFirstPart = [sUrl substringToIndex:index];
    
    NSString *sEncodedParmeters = [StringToolS URLencode:sParmeters stringEncoding:stringEncoding];
    NSString *sFinalUrl = [NSString stringWithFormat:@"%@?%@",sFirstPart,sEncodedParmeters];
    return sFinalUrl;
}

//默认使用UTF8格式来编码完整的URL
+(NSString *) FullURLencode:(NSString *)sUrl
{
    return [StringToolS FullURLencode:sUrl stringEncoding:NSUTF8StringEncoding];
}
@end
