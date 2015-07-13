//
//  NSString+extend.m
//  
//
//  Created by Joe-c on 15/6/16.
//
//

#import "NSString+extend.h"

@implementation NSString (extend)
- (CGSize)sizeWithFont:(UIFont *)font{
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = font;
    return [self sizeWithAttributes:attr];
    
}

- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)size{
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = font;
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
@end
