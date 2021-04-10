//
//  AnimatedCircledView.m
//  Terna
//
//  Created by Luigi Scherillo on 10/04/21.
//

#import "AnimatedCircledView.h"

@implementation AnimatedCircledView

- (void)drawRect:(CGRect)rect {
    [self drawImageHolderViewFrame:rect startAngle:self.startAngle];
}

- (void)drawImageHolderViewFrame: (CGRect)frame startAngle: (CGFloat)startAngle
{
    CGRect ovalRect = CGRectMake(CGRectGetMinX(frame) , CGRectGetMinY(frame) , frame.size.width, frame.size.height);
    UIBezierPath* ovalPath = [UIBezierPath bezierPath];
    [ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: -91 * M_PI/180 endAngle: -startAngle * M_PI/180 clockwise: YES];
    [UIColor.redColor setStroke];
    ovalPath.lineWidth = 2;
    [ovalPath stroke];
}

@end
