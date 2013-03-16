//
//  ViewController.h
//  Demo
//
//  Created by Edward Patel on 2013-03-16.
//  Copyright (c) 2013 Edward Patel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *theLabel;

- (IBAction)textChanged:(id)sender;

@end
