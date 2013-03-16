//
//  EPAnimatedLabel.m
//
//  Created by Edward Patel on 2013-03-16.
//  Copyright (c) 2013 Edward Patel. All rights reserved.
//

#import "EPAnimatedLabel.h"

#import <QuartzCore/QuartzCore.h>

#define LABEL_SPEED_CONSTANT 15.0 // Higher == faster (basically pixels/second)

@implementation EPAnimatedLabel

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    // First time? Insert a container view above the label
    if (!haveContainer) {
        UIView *view = [[UIView alloc] initWithFrame:self.frame];
        view.clipsToBounds = YES;
        self.frame = self.bounds;
        [self.superview addSubview:view];
        [view addSubview:self];
        originalWidth = self.frame.size.width;
        if (_repeatCount == 0)
            _repeatCount = INFINITY;
        haveContainer = YES;
    }
    
    CGSize size = [text sizeWithFont:self.font];
    size.width = MAX(originalWidth, size.width);
    
    CGRect rect;
    rect.origin = CGPointZero;
    rect.size = size;
    self.frame = rect;
    
    CGFloat outside = rect.size.width - self.superview.frame.size.width;
    
    [self.layer removeAllAnimations];
    
    if (outside > 3) {
        CAKeyframeAnimation *animation;
        BOOL notRepeating = _repeatCount != INFINITY;
        
        animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        animation.duration = MAX(3.0, outside/LABEL_SPEED_CONSTANT) + (notRepeating ? 2.0 : 0.0);
        animation.fillMode = kCAFillModeForwards;
        animation.repeatCount = _repeatCount;
        
        NSMutableArray *values = [NSMutableArray array];
        NSMutableArray *keyTimes = [NSMutableArray array];
        NSMutableArray *timings = [NSMutableArray array];
        
        [values addObject:@(rect.size.width/2.0)];
        [keyTimes addObject:@(0+(notRepeating ? 0.2 : 0.0))];
        [timings addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        
        [values addObject:@(rect.size.width/2.0-outside)];
        [keyTimes addObject:@(0.5+(notRepeating ? 0.1 : 0.0))];
        [timings addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        
        [values addObject:@(rect.size.width/2.0)];
        [keyTimes addObject:@(1)];
        [timings addObject:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
        
        animation.values = values;
        animation.keyTimes = keyTimes;
        animation.timingFunctions = timings;
        
        [self.layer addAnimation:animation forKey:@"position.x"];
    }
}

@end
