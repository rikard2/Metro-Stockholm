//
//  MetroDrawing.h
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MetroDrawing : NSObject {
    NSInteger columns;
    NSInteger rows;
    NSInteger width;
}

- (void)setSize :(NSInteger)c :(NSInteger)r :(NSInteger)w;
- (void)drawStation :(CGContextRef)context :(NSString*)text :(NSInteger)column :(NSInteger)row :(BOOL)rotate :(BOOL)endStation :(UIColor*)lineColor;
- (void)drawLineText :(CGContextRef)context :(BOOL)rotate :(NSString*)text :(NSInteger)column :(NSInteger)row;
+ (UIColor*)greenLineColor;
+ (UIColor*)redLineColor;
+ (UIColor*)blueLineColor;
+ (UIColor*)grayConnectingLineColor;

- (void )drawStopCircle :(CGContextRef)context :(NSInteger)column :(NSInteger)row :(BOOL)ending :(UIColor*)color;
- (void)drawLineText :(CGContextRef)context :(BOOL)rotate :(NSString*)text :(NSInteger)column :(NSInteger)row :(UIColor*)color;
- (void)drawConnectingLine :(CGContextRef)context :(NSInteger)fromColumn :(NSInteger)fromRow :(NSInteger)toColumn :(NSInteger)toRow :(UIColor*)color;

@end
