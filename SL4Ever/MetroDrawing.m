//
//  MetroDrawing.m
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "MetroDrawing.h"

@implementation MetroDrawing

/*
    Färger för tunnelbanekartan
*/
+ (UIColor*)greenLineColor {
    return [UIColor colorWithRed:102.0f/255.0f
                           green:153.0f/255.0f
                            blue:51.0f/255.0f
                           alpha:1.0f];
}
+ (UIColor*)redLineColor {
    return [UIColor colorWithRed:255/255.0f
                           green:51/255.0f
                            blue:102/255.0f
                           alpha:1.0f];
}
+ (UIColor*)blueLineColor {
    return [UIColor colorWithRed:0.0/255.0f
                           green:153.0f/255.0f
                            blue:153.0f/255.0f
                           alpha:1.0f];
}
+ (UIColor*)grayConnectingLineColor {
    return [UIColor colorWithRed:200.0/255.0f
                           green:200.0f/255.0f
                            blue:200.0f/255.0f
                           alpha:1.0f];
}

- (id)init {
    self = [super init];
    
    if (self) {
        columns = 10;
        rows = 10;
        width = 10;
    }
    
    return self;
}

- (void)setSize :(NSInteger)c :(NSInteger)r :(NSInteger)w {
    columns = c;
    rows = r;
    width = w;
}

/*
    Rita ring för stationen + skriv ut texten (rakt eller roterat)
*/
- (void)drawStation :(CGContextRef)context :(NSString*)text :(NSInteger)column :(NSInteger)row :(BOOL)rotate :(BOOL)endStation :(UIColor*)lineColor {
    [self drawLineText:context :rotate :text :column :row];
    [self drawStopCircle:context :column :row :endStation :lineColor];
}

/*
    Rita texten för en tunnelbanestation.
*/
- (void)drawLineText :(CGContextRef)context :(BOOL)rotate :(NSString*)text :(NSInteger)column :(NSInteger)row {
    [self drawLineText:context :rotate :text :column :row :UIColor.blackColor];
}

/*
    Rita texten för en tunnelbanestation.
*/
- (void)drawLineText :(CGContextRef)context :(BOOL)rotate :(NSString*)text :(NSInteger)column :(NSInteger)row :(UIColor*)cl {
    
    //UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    UIFont *font = [UIFont systemFontOfSize:13];
    CGSize stringSize = [text sizeWithAttributes:@{NSFontAttributeName: font}];
    
    CGContextSaveGState(context); // Spara "statet". Vi vill bara rotera en liten del.
    
    int textMaxWidth = 100;
    
    // Grader att rotera (radianer)
    CGFloat angleRadians = M_PI / 180 * (float) 50;
    CGFloat restRadians = M_PI / 180 * (float) (90 - 50);
    
    // Lite trigonometri (räkna ut hur långt till vänster texten ska vara när den är roterad (den roterade texten ska sluta vid cirkeln för tunnelbanestationen).
    int targetX = textMaxWidth * (sinf(restRadians));
    
    if (rotate) {
        CGContextTranslateCTM(context, column * width , row * width);   // sätter origo till vänster/uppe för vår texter
        CGContextRotateCTM(context, angleRadians);                      // roterar texten efter origo
    }
    
    [cl set]; // sätt färgen (fattar inte riktigt det här...)
    
    // Tänk på att vid rotation vrider vi origo med CGContextTranslateCTM
    if (rotate) {
        // Positionera den roterade texten efter vår nya origo.
        [text drawInRect: CGRectMake(
                                     column * width + width * 2 + 1,
                                     row * width - width / 2 + width / 2.3,
                                     stringSize.width,
                                     stringSize.height
                                     )
          withAttributes:@{}];
         
    } else {
        // Positionera texten (inte efter ny origo).
        [text   drawInRect:CGRectMake(
                                    column * width + width * 2 + 1,
                                    row * width - width / 2 + width / 2.3,
                                    stringSize.width,
                                    stringSize.height
                                    )
            withAttributes:@{NSFontAttributeName: font}];
    }
    
    CGContextRestoreGState(context);
}

/*
    Rita ut rutnätet (för debugging)
*/
- (void)drawGridLines:(CGContextRef)context {
    
    UIColor *lightGray = [UIColor colorWithRed:233.0f/255.0f
                                         green:233.0f/255.0f
                                          blue:233.0f/255.0f
                                         alpha:1.0f];
    
    CGContextBeginPath(context);
    
    // vertikala linjer
    for (int x = 0; x < columns + 1; x++) {
        CGContextMoveToPoint(context, x * width, 0);
        CGContextAddLineToPoint(context, x * width, rows * width);
    }
    
    // horizontella linjer
    for (int y = 0; y < rows + 1; y++) {
        CGContextMoveToPoint(context, 0, y * width);
        CGContextAddLineToPoint(context, rows  * width, y * width);
    }
    
    CGContextSetStrokeColorWithColor(context, lightGray.CGColor);
    CGContextStrokePath(context);
}

/*
    Rita cirkel för tunnelbanestation.
*/
- (void) drawStopCircle :(CGContextRef)context :(NSInteger)column :(NSInteger)row :(BOOL)ending :(UIColor*)color {
    int extra = (ending) ? 5 : 2;
    
    CGRect rect = CGRectMake(column * width - extra, row * width - extra, width + extra * 2, width + extra * 2);
    
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, UIColor.whiteColor.CGColor);
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, rect);
    CGContextDrawPath(context, kCGPathFillStroke);
}

/*
    Rita linje mellan tunnelbanestationer.
*/
- (void)drawConnectingLine :(CGContextRef)context :(NSInteger)fromColumn :(NSInteger)fromRow :(NSInteger)toColumn :(NSInteger)toRow :(UIColor*)color {
    CGContextSetLineWidth(context, 10);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, fromColumn * width + width / 2, fromRow * width + width / 2);
    CGContextAddLineToPoint(context, toColumn  * width + width / 2, toRow * width + width / 2);
    CGContextStrokePath(context);
}

@end
