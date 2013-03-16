//
//  ViewController.m
//  Demo
//
//  Created by Edward Patel on 2013-03-16.
//  Copyright (c) 2013 Edward Patel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textChanged:(id)sender
{
    self.theLabel.text = [sender text];
}

@end
