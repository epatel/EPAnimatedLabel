//
//  EPAnimatedLabel.h
//  Demo
//
//  Created by Edward Patel on 2013-03-16.
//  Copyright (c) 2013 Edward Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPAnimatedLabel : UILabel {
    BOOL haveContainer;
    CGFloat originalWidth;
}

@property (nonatomic, assign) float repeatCount;

@end
