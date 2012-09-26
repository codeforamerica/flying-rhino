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
}

- (void)startAnimation
{
    [UIView beginAnimations:@"test" context:nil];
    
    // appears that this defaults to @2x automatically
    NSArray * imageArray  = [[NSArray alloc] initWithObjects:
                             [UIImage imageNamed: @"Default.png"],
                             [UIImage imageNamed: @"Default-2.png"],
                             [UIImage imageNamed: @"Default-3.png"],
                             nil];
    
    imageView.animationImages = imageArray;
    imageView.animationDuration = 0.5;
    
    imageView.contentMode = UIViewContentModeScaleToFill;
    [imageView startAnimating];
    [UIView commitAnimations];
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
