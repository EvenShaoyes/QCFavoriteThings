//
//  NSString+extend.h
//  
//
//  Created by Joe-c on 15/6/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (extend)

/**
 *  计算文字的size
 *  font : 文字字体
 */
- (CGSize)sizeWithFont:(UIFont *)font;


/**
 *  计算文字的size
 *
 *  @param font 文字字体
 *  @param size 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font size:(CGSize)size;
@end
