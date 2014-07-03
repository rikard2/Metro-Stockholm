//
//  MetroView.m
//  SL4Ever
//
//  Created by Rikard on 23/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "MetroView.h"
#import "MetroDrawing.h"

@implementation MetroView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1.0);
    
    // colors
    
    self->columns = 25;
    self->rows = 25;
    self->width = 320 / self->columns;
    
    UIColor *greenLine = MetroDrawing.greenLineColor;
    UIColor *blueLine = MetroDrawing.blueLineColor;
    
    UIColor *grayLine = MetroDrawing.grayConnectingLineColor;
    UIColor *redLine = MetroDrawing.redLineColor;

    
    //[self drawGridLines:context];
    UIColor *lineColor = UIColor.greenColor;
    // Gröna linjen
    
    [self drawConnectingLine:context :1 :68 :7 :68 :grayLine];
    
    
    [self drawConnectingLine:context :24 :8 :1 :8 :greenLine];
    [self drawConnectingLine:context :1 :8 :1 :160 :greenLine];
    
    [self drawConnectingLine:context :1 :44 :4 :44 :grayLine];
    
    [self drawConnectingLine:context :1 :72 :7 :72 :grayLine];
    [self drawConnectingLine:context :1 :74 :7 :74 :grayLine];
    
    //[self drawLineText:context :TRUE :@"Hässelby Strand" :24 :8];
    //[self drawStopCircle:context :24 :8 :TRUE :greenLine];
    
    [self drawStation :context :@"Hässelby Strand" :24 :8 :TRUE :TRUE :greenLine];
    [self drawStation :context :@"Hässelby Gård" :21 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Johannelund" :19 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Vällingby" :17 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Råcksta" :15 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Blackeberg" :13 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Islandstorget" :11 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Ängbyplan" :9 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Åkeshov" :7 :8 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Brommaplan" :1 :12 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"Abrahamsberg" :1 :14 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"Stora Mossen" :1 :16 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"Kristineberg" :1 :18 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"Thorildsplan" :1 :20 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"" :1 :44 :FALSE :FALSE :greenLine];
    
    [self drawStation :context :@"" :1 :72 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"" :1 :74 :FALSE :FALSE :greenLine];
    
    [self drawStation :context :@"Medborgarplatsen" :1 :120 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"Skanstull" :1 :122 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"Gullmarsplan" :1 :124 :FALSE :FALSE :greenLine];
    
    [self drawConnectingLine:context :1 :136 :24 :136 :greenLine];
    [self drawConnectingLine:context :7 :136 :7 :148 :greenLine];
    [self drawConnectingLine:context :7 :148 :24 :148 :greenLine];
    [self drawConnectingLine:context :1 :160 :24 :160 :greenLine];
    
    [self drawStation :context :@"Skarpnäck" :24 :136 :TRUE :TRUE :greenLine];
    [self drawStation :context :@"Bagarmossen" :21 :136 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Kärrtorp" :19 :136 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Björkhagen" :17 :136 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Hammarbyhöjden" :15 :136 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Skärmarbrink" :7 :136 :TRUE :FALSE :greenLine];
    
    [self drawStation :context :@"Farsta Strand" :24 :148 :TRUE :TRUE :greenLine];
    [self drawStation :context :@"Farsta" :21 :148 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Hökarängen" :19 :148 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Gubbängen" :17 :148 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Tallkrogen" :15 :148 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Skogskyrkogården" :13 :148 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Sandsborg" :11 :148 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Blåsut" :9 :148 :TRUE :FALSE :greenLine];
    
    [self drawStation :context :@"Hagsätra" :24 :160 :TRUE :TRUE :greenLine];
    [self drawStation :context :@"Rågsved" :21 :160 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Högdalen" :19 :160 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Bandhagen" :17 :160 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Stureby" :15 :160 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Svedmyra" :13 :160 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Sockenplan" :11 :160 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Enskede gård" :9 :160 :TRUE :FALSE :greenLine];
    [self drawStation :context :@"Globen" :7 :160 :TRUE :FALSE :greenLine];
    
    //[self drawStation :context :@"T-Centralen" :1 :30 :FALSE :FALSE :greenLine];
    
    [self drawConnectingLine:context :24 :28 :4 :28 :blueLine];
    [self drawConnectingLine:context :4 :28 :4 :70 :blueLine];
    
    [self drawStation :context :@"Hjulsta" :24 :28 :TRUE :TRUE :blueLine];
    [self drawStation :context :@"Tensta" :21 :28 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Rinkeby" :19 :28 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Rissne" :17 :28 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Duvbo" :15 :28 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Sundbyb. C" :13 :28 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Vreten" :11 :28 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Huvudsta" :9 :28 :TRUE :FALSE :blueLine];
    
    [self drawConnectingLine:context :24 :36 :4 :36 :blueLine];
    
    [self drawStation :context :@"Akalla" :24 :36 :TRUE :TRUE :blueLine];
    [self drawStation :context :@"Husby" :21 :36 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Kista" :19 :36 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Hallonbergen" :17 :36 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Näckrosen" :15 :36 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Solna C" :13 :36 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Vreten" :11 :36 :TRUE :FALSE :blueLine];
    [self drawStation :context :@"Huvudsta" :9 :36 :TRUE :FALSE :blueLine];
    
    [self drawStation :context :@"Västa skogen" :4 :40 :FALSE :FALSE :blueLine];
    [self drawStation :context :@"Stadshagen" :4 :42 :FALSE :FALSE :blueLine];
    [self drawStation :context :@"Fridhemsplan" :4 :44 :FALSE :FALSE :blueLine];
    [self drawStation :context :@"Kungst." :4 :70 :FALSE :FALSE :blueLine];
    
    // red line
    [self drawConnectingLine:context :24 :54 :7 :54 :redLine];
    [self drawConnectingLine:context :24 :62 :7 :62 :redLine];
    [self drawConnectingLine:context :7 :54 :7 :96 :redLine];
    [self drawConnectingLine:context :7 :54 :7 :118 :redLine];
    [self drawConnectingLine:context :7 :118 :24 :118 :redLine];
    [self drawConnectingLine:context :7 :96 :24 :96 :redLine];
    
    [self drawStation :context :@"Mörby C" :24 :54 :TRUE :TRUE :redLine];
    [self drawStation :context :@"Danderyds sjukhus" :21 :54 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Bergshamra" :19 :54 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Universitetet" :17 :54 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Tekniska Hgsk." :15 :54 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Stadion" :13 :54 :TRUE :FALSE :redLine];
    
    [self drawStation :context :@"Ropsten" :24 :62 :TRUE :TRUE :redLine];
    [self drawStation :context :@"Gärdet" :21 :62 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Karlaplan" :19 :62 :TRUE :FALSE :redLine];
    
    [self drawStation :context :@"Östermalmstorg" :7 :64 :FALSE :FALSE :redLine];
    
    [self drawStation :context :@"" :1 :68 :FALSE :FALSE :greenLine];
    [self drawStation :context :@"" :4 :68 :FALSE :FALSE :blueLine];
    [self drawStation :context :@"T-Centralen" :7 :68 :FALSE :FALSE :redLine];
    
    [self drawStation :context :@"Gamla stan" :7 :72 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Slussen" :7 :74 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Mariatorget" :7 :78 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Zinkensdamm" :7 :80 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Hornstull" :7 :82 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Liljeholmen" :7 :84 :FALSE :FALSE :redLine];
    
    
    [self drawStation :context :@"Fruängen" :24 :96 :TRUE :TRUE :redLine];
    [self drawStation :context :@"Västertorp" :21 :96 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Hägerstensåsen" :19 :96 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Telefonplan" :17 :96 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Midsommarkransen" :15 :96 :TRUE :FALSE :redLine];
    
    [self drawStation :context :@"Norsborg" :24 :118 :TRUE :TRUE :redLine];
    [self drawStation :context :@"Hallunda" :21 :118 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Alby" :19 :118 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Fittja" :17 :118 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Masmo" :15 :118 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Vårby Gård" :13 :118 :TRUE :FALSE :redLine];
    [self drawStation :context :@"Vårberg" :11 :118 :TRUE :FALSE :redLine];
    
    [self drawStation :context :@"Skärholmen" :7 :110 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Sätra" :7 :108 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Bredäng" :7 :106 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Mälarhöjden" :7 :104 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Axelsberg" :7 :102 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Örnsberg" :7 :100 :FALSE :FALSE :redLine];
    [self drawStation :context :@"Aspudden" :7 :98 :FALSE :FALSE :redLine];
    
    /*
        BOTTOM HALF
     */
    
    
}
- (void)drawStation :(CGContextRef)context :(NSString*)text :(NSInteger)column :(NSInteger)row :(BOOL)rotate :(BOOL)endStation :(UIColor*)lineColor {
    [self drawLineText:context :rotate :text :column :row];
    [self drawStopCircle:context :column :row :endStation :lineColor];
}
- (void)drawLineText :(CGContextRef)context :(BOOL)rotate :(NSString*)text :(NSInteger)column :(NSInteger)row {
    [self drawLineText:context :rotate :text :column :row :UIColor.blackColor];
}

- (void)drawLineText :(CGContextRef)context :(BOOL)rotate :(NSString*)text :(NSInteger)column :(NSInteger)row :(UIColor*)color {
    
    UIFont *font = [UIFont systemFontOfSize:14];
    
    CGSize stringSize = [text sizeWithFont:font];
    
    CGContextSaveGState(context);
    
    int textMaxWidth = 100;
    
     /* ROTATE */
    CGFloat angleRadians = M_PI / 180 * (float) 50;
    CGFloat restRadians = M_PI / 180 * (float) (90 - 50);
    
    int targetX = textMaxWidth * (sinf(restRadians));
    int targetY = stringSize.width * cosf(restRadians);
    
    if (rotate) {
        CGContextTranslateCTM(context, column * width , row * width); // sätter origo till position
        CGContextRotateCTM(context, angleRadians); // roterar efter origo
    }
    /* END ROTATE */
    
    [color set];
    if (rotate) {
        [text drawInRect:CGRectMake(-targetX + (textMaxWidth - stringSize.width) - width * 3,
                                    -width * 2, stringSize.width,stringSize.height) withFont:font];
    } else {
        [text drawInRect:CGRectMake(column * width + width * 2,row * width, stringSize.width,stringSize.height) withFont:font];
    }
    
    CGContextRestoreGState(context);
}
- (void)drawGridLines:(CGContextRef)context {
    
    UIColor *lightGray = [UIColor colorWithRed:233.0f/255.0f
                                         green:233.0f/255.0f
                                          blue:233.0f/255.0f
                                         alpha:1.0f];
    
    UIColor *blackColor = [UIColor grayColor];
    
    CGContextBeginPath(context);
    // lines
    for (int x = 0; x < columns + 1; x++) {
        CGContextMoveToPoint(context, x * width, 0);
        CGContextAddLineToPoint(context, x * width, rows * width);
    }
    for (int y = 0; y < rows + 1; y++) {
        CGContextMoveToPoint(context, 0, y * width);
        CGContextAddLineToPoint(context, rows  * width, y * width);
    }
    
    CGContextSetStrokeColorWithColor(context, lightGray.CGColor);
    CGContextStrokePath(context);
}

- (void )drawStopCircle :(CGContextRef)context :(NSInteger)column :(NSInteger)row :(BOOL)ending :(UIColor*)color {
    int extra = (ending) ? 5 : 2;
    
    CGRect rect = CGRectMake(column * width - extra, row * width - extra, width + extra * 2, width + extra * 2);
    
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, UIColor.whiteColor.CGColor);
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, rect);
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void)drawConnectingLine :(CGContextRef)context :(NSInteger)fromColumn :(NSInteger)fromRow :(NSInteger)toColumn :(NSInteger)toRow :(UIColor*)color {
    CGContextSetLineWidth(context, 10);
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, fromColumn * width + width / 2, fromRow * width + width / 2);
    CGContextAddLineToPoint(context, toColumn  * width + width / 2, toRow * width + width / 2);
    CGContextStrokePath(context);
}


@end
