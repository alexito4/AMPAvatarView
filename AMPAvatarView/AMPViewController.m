//
//  AMPViewController.m
//  AMPAvatarView
//
//  Created by Alejandro Martinez on 29/06/13.
//  Copyright (c) 2013 Alejandro Martinez. All rights reserved.
//

#import "AMPViewController.h"
#import "AMPAvatarView.h"
#import "UIColor+AMPAdditions.h"

@interface AMPViewController ()

@end

@implementation AMPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AMPAvatarView *avatar2 = [[AMPAvatarView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    avatar2.image = [UIImage imageNamed:@"avatar"];
    [self.view addSubview:avatar2];
	
    [self.avatar setImage:[UIImage imageNamed:@"avatar"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderWithChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [self.avatar setBorderWith:slider.value];
}

- (IBAction)changeBorderColor:(id)sender {
    [self.avatar setBorderColor:[UIColor randomColor]];
}

- (IBAction)sliderShadowChangeed:(id)sender {
    UISlider *slider = (UISlider *)sender;
    [self.avatar setShadowRadius:slider.value];
}

- (IBAction)changeShadowColor:(id)sender {
    [self.avatar setShadowColor:[UIColor randomColor]];
}
@end
