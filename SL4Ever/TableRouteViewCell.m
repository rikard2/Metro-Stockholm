//
//  TableRouteViewCell.m
//  SL4Ever
//
//  Created by Rikard on 26/06/14.
//  Copyright (c) 2014 Rikard. All rights reserved.
//

#import "TableRouteViewCell.h"
#import "MetroDrawing.h"
#import "Helper.h"

@implementation TableRouteViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                // Initialization code
        //[self setBackgroundColor:UIColor.redColor];
    }
    [self setOpaque:NO];

    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during
+ (NSInteger)calculateRowHeight :(Route*)route {
    int row = 2;
    
    for (int i = 0; i < route.subRoutes.count; i++) {
        if ([route.subRoutes objectAtIndex:i] == nil) {
            continue;
        }
        if (i > 0) {
            row += 3;
        }
        row += 6;
    }
    int cnt = route.subRoutes.count;
    NSLog([NSString stringWithFormat:@"Row: %d", row]);
    return row * 14 + 40;
}

- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, UIColor.whiteColor.CGColor);
    CGContextFillRect(context, self.bounds);
    
    MetroDrawing *m = [[MetroDrawing alloc] init];
    [m setSize:10 :10 :14];
    
    int row = 2;
    int column = 6;
    
    for (int i = 0; i < self.route.subRoutes.count; i++) {
        if (i > 0) {
            [m drawConnectingLine:context :column :row :column :row + 4 :MetroDrawing.grayConnectingLineColor];
            row += 3;
        }
        row += 6;
    }
    
    row = 2;
    
    for (int i = 0; i < self.route.subRoutes.count; i++) {
        UIColor *col = UIColor.redColor;
        
        if (i == 0) {
            col = MetroDrawing.greenLineColor;
        } else if (i == 1) {
            col = MetroDrawing.redLineColor;
        }
        
        
        
        Route *r = [self.route.subRoutes objectAtIndex:i];
        if (i > 0) {
            row += 3;
        }
        
        if (r.transportLine == 17)
        {
            col = MetroDrawing.blueLineColor;
        }
        
        [m drawConnectingLine:context :column :row :column :row + 6 :col];
        
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *originComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:r.originDate];
        NSDateComponents *destComponents = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:r.destDate];
        //components.hour;
        NSString *orginDateStr = [NSString stringWithFormat:@"%01d:%02d", originComponents.hour, originComponents.minute];
        NSString *destDateStr = [NSString stringWithFormat:@"%01d:%02d", destComponents.hour, destComponents.minute];

        
        [m drawLineText:context :false :orginDateStr :0 :row];
        [m drawLineText:context :false :destDateStr :0 :row + 6];
        
        for (int z = 0; z < r.originDatesFuture.count; z++) {
            if (z >= 4) break;
            [m drawLineText:context :false :[Helper dateTime:[r.originDatesFuture objectAtIndex:z]] :0 :row + 1 + (z * 1) :MetroDrawing.grayConnectingLineColor];
        }
        
        for (int z = 0; z < r.originDatesFuture.count; z++) {
            if (z >= 2) break;
            //[m drawLineText:context :false :[Helper dateTime:[r.destDatesFututes objectAtIndex:z]] :0 :row + 7 + (z * 1) :MetroDrawing.grayConnectingLineColor];
        }
        
        NSString *destStationText = [NSString stringWithFormat:@"%@ (%@)", r.destinationStation.name, r.transportTowards];

        [m drawStation:context :r.originStation.name :column :row :FALSE :FALSE :col];
        [m drawStation:context :destStationText :column :row + 6 :FALSE :FALSE :col];
        
        row += 6;
    }
}


@end
