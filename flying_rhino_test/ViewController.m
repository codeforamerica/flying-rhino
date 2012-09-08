//
//  ViewController.m
//  flying_rhino_test
//
//  Created by Jesse Bounds on 8/31/12.
//  Copyright (c) 2012 rebounds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // appears that this defaults to @2x automatically
    UIImage *image = [UIImage imageNamed: @"Default.png"];
    [imageView setImage:image];
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
