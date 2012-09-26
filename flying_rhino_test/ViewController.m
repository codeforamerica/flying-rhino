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

    [UIView beginAnimations:@"test" context:nil];

    // appears that this defaults to @2x automatically
    NSArray * imageArray  = [[NSArray alloc] initWithObjects:
                             [UIImage imageNamed: @"Default.png"],
                             [UIImage imageNamed: @"Default-2.png"],
                             [UIImage imageNamed: @"Default-3.png"],
                             nil];

    imageView.animationImages = imageArray;
    imageView.animationDuration = 0.5;
    imageView.animationRepeatCount=1000;
        
    imageView.contentMode = UIViewContentModeScaleToFill;
        //[self.view addSubview:imgView];
    [imageView startAnimating];
    
        //[imageView setImage:image];

    [UIView commitAnimations];
    [super viewDidLoad];
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
