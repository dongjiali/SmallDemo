//
//  MyCALayer.m
//  SmallDemo
//
//  Created by Dong JiaLi on 12-12-25.
//  Copyright (c) 2012年 sinsoft. All rights reserved.
//

#import "MyCALayer.h"
#import <QuartzCore/QuartzCore.h>
@implementation MyCALayer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        NSUInteger max = 16384;
        NSUInteger base10 = (max/2) - (max/2)%10;
        NSLog(@"%d",base10);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
        view.backgroundColor = [UIColor yellowColor];
        view.layer.shadowColor = [UIColor redColor].CGColor;
        view.layer.shadowOffset = CGSizeMake(0, 0);
        view.layer.shadowOpacity = 10;
        view.layer.shadowRadius = 10;
        view.layer.cornerRadius = 10;
//        [self addSubview:view];
//        [view release];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    UIColor *magentaColor = [UIColor colorWithRed:0.5f green:0.0f blue:0.5f alpha:1.0f];
//    
//    [magentaColor set];
//    
//    UIFont *helveticaBold = [UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0f];
//    
//    NSString *myString = @"I Learn Really Fast";
//    
//    [myString drawInRect:CGRectMake(100, /* x */
//                                    120, /* y */
//                                    100, /* width */ 200) /* height */
//                withFont:helveticaBold];
//    [myString drawAtPoint:CGPointMake(40, 180) withFont:helveticaBold];
//    UIColor *steelBlueColor = [UIColor colorWithRed:0.3f green:0.4f blue:0.6f alpha:1.0f];
//    CGColorRef colorRef = [steelBlueColor CGColor];
//    const CGFloat *components = CGColorGetComponents(colorRef);
//    NSUInteger componentsCount = CGColorGetNumberOfComponents(colorRef);
//    NSUInteger counter = 0;
//    for (counter = 0; counter < componentsCount; counter++) {
//        NSLog(@"Component %lu = %.02f", (unsigned long)counter + 1, components[counter]);
//    }
    // Drawing code
//    /* Create the path first. Just the path handle. */
//    CGMutablePathRef path = CGPathCreateMutable();
//    /* Here are our rectangle boundaries */
//    CGRect rectangle = CGRectMake(10.0f, 10.0f, 200.0f, 300.0f);
//    /* Add the rectangle to the path */
//    CGPathAddRect(path, NULL, rectangle);
//    /* Get the handle to the current context */
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    /* Add the path to the context */
//    CGContextAddPath(currentContext, path);
//    /* Set the fill color to cornflower blue */
//    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
//    /* Set the stroke color to brown */
//    [[UIColor brownColor] setStroke];
//    /* Set the line width (for the stroke) to 5 */
//    CGContextSetLineWidth(currentContext, 5.0f);
//    /* Stroke and fill the path on the context */
//    CGContextDrawPath(currentContext, kCGPathFillStroke);
//    /* Dispose of the path */
//    CGPathRelease(path);
    /* Get the handle to the current context */
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextSetShadowWithColor(currentContext, CGSizeMake(10.0f, 10.0f), 20.0f, [[UIColor grayColor] CGColor]);
//    /* Create the path first. Just the path handle. */
//    CGMutablePathRef path = CGPathCreateMutable();
//    /* Here are our rectangle boundaries */
//    CGRect firstRect = CGRectMake(55.0f, 60.0f, 150.0f, 150.0f);
//    /* Add the rectangle to the path */
//    CGPathAddRect(path, NULL, firstRect);
//    /* Add the path to the context */
//    CGContextAddPath(currentContext, path);
//    /* Set the fill color to cornflower blue */
//    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
//    /* Fill the path on the context */
//    CGContextDrawPath(currentContext, kCGPathFill);
//    /* Dispose of the path */
//    CGPathRelease(path);
    /* Get the handle to the current context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(currentContext);
//    CGContextSetShadowWithColor(currentContext,CGSizeMake(10.0f, 10.0f), 20.0f, [[UIColor grayColor] CGColor]);
//    /* Create the path first. Just the path handle. */
//    CGMutablePathRef path = CGPathCreateMutable();
//    /* Here are our rectangle boundaries */
//    CGRect firstRect = CGRectMake(55.0f,60.0f, 150.0f, 150.0f);
//    /* Add the rectangle to the path */
//    CGPathAddRect(path, NULL, firstRect);
//    /* Add the path to the context */
//    CGContextAddPath(currentContext, path);
//    /* Set the fill color to cornflower blue */
//    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
//    /* Fill the path on the context */
//    CGContextDrawPath(currentContext, kCGPathFill);
//    /* Dispose of the path */
//    CGPathRelease(path);
//    /* Restore the context to how it was when we started */
//    CGContextRestoreGState(currentContext);
    
    
//    [self drawRectAtTopOfScreen];
//    [self drawRectAtBottomOfScreen];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor *startColor = [UIColor redColor];
    CGFloat *startColorComponents = (CGFloat *)CGColorGetComponents([startColor CGColor]);
    UIColor *endColor = [UIColor greenColor];
    CGFloat *endColorComponents = (CGFloat *)CGColorGetComponents([endColor CGColor]);
    CGFloat colorComponents[8] = {
        /* Four components of the blue color (RGBA) */
        startColorComponents[0],
        startColorComponents[1],
        startColorComponents[2],
        startColorComponents[3], /* First color = blue */
        /* Four components of the green color (RGBA) */
        endColorComponents[0],
        endColorComponents[1],
        endColorComponents[2],
        endColorComponents[3], /* Second color = green */
    };
    CGFloat colorIndices[2] = {
        0.0f, /* Color 0 in the colorComponents array */ 1.0f, /* Color 1 in the colorComponents array */
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents (colorSpace, (const CGFloat *)&colorComponents, (const CGFloat *)&colorIndices, 2);
    CGColorSpaceRelease(colorSpace);
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGPoint startPoint, endPoint;
    startPoint = CGPointMake(0.0f, screenBounds.size.height / 2.0f);
    endPoint = CGPointMake(screenBounds.size.width, startPoint.y);
    CGContextDrawLinearGradient (currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
}


- (void) drawRectAtBottomOfScreen{
    /* Get the handle to the current context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGMutablePathRef secondPath = CGPathCreateMutable();
    CGRect secondRect = CGRectMake(150.0f, 250.0f, 100.0f, 100.0f);
    CGPathAddRect(secondPath, NULL, secondRect);
    CGContextAddPath(currentContext, secondPath);
    [[UIColor purpleColor] setFill];
    CGContextDrawPath(currentContext, kCGPathFill);
    CGPathRelease(secondPath);
}

- (void) drawRectAtTopOfScreen{
    /* Get the handle to the current context */
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadowWithColor(currentContext, CGSizeMake(10.0f, 10.0f), 20.0f, [[UIColor grayColor] CGColor]);
    /* Create the path first. Just the path handle. */
    CGMutablePathRef path = CGPathCreateMutable();
    /* Here are our rectangle boundaries */
    CGRect firstRect = CGRectMake(55.0f, 60.0f, 150.0f, 150.0f);
    /* Add the rectangle to the path */
    CGPathAddRect(path, NULL, firstRect);
    /* Add the path to the context */
    CGContextAddPath(currentContext, path);
    /* Set the fill color to cornflower blue */
    [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
    /* Fill the path on the context */
    CGContextDrawPath(currentContext, kCGPathFill);
    /* Dispose of the path */
    CGPathRelease(path);
    CGContextRestoreGState(currentContext);
    /*
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadowWithColor(currentContext, CGSizeMake(10.0f, 10.0f), 20.0f, [[UIColor grayColor] CGColor]);
     CGMutablePathRef path = CGPathCreateMutable();
    CGRect firstRect = CGRectMake(55.0f,60.0f, 150.0f, 150.0f);
     CGPathAddRect(path, NULL, firstRect);
     CGContextAddPath(currentContext, path);
     [[UIColor colorWithRed:0.20f green:0.60f blue:0.80f alpha:1.0f] setFill];
     CGContextDrawPath(currentContext, kCGPathFill);
     CGPathRelease(path);
    CGContextRestoreGState(currentContext);
     */
}

- (void)dealloc
{
    [super dealloc];
}
@end
