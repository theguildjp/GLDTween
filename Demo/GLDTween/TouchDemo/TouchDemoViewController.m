//
//  TouchDemoViewController.m
//  GLDTween
//
//  Created by Takayuki Fukatsu on 2014/10/03.
//  Copyright (c) 2014 THE GUILD. All rights reserved.
//

#import "TouchDemoViewController.h"
#import "GLDTween.h"

@interface TouchDemoViewController ()

@end

@implementation TouchDemoViewController

NSArray* easings;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    easings = @[GLDEasingTypeEaseInCubic,
                GLDEasingTypeEaseOutCubic,
                GLDEasingTypeEaseInOutCubic,
                GLDEasingTypeEaseInQuad,
                GLDEasingTypeEaseOutQuad,
                GLDEasingTypeEaseInOutQuad,
                GLDEasingTypeEase];*/
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(screenDidToucth:)];
    [self.view addGestureRecognizer:gesture];
    
    self.box.center = CGPointMake(0,0);
    CGAffineTransform t = CGAffineTransformMakeTranslation(self.view.frame.size.width*0.5, self.view.frame.size.height*0.5);
    self.box.transform = t;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)screenDidToucth:(UITapGestureRecognizer*)gesture{
    
    CGPoint pt = [gesture locationInView:gesture.view];
    float rotation = arc4random()%360;
    float scale = arc4random() % 100 / 50.0 + 0.5;
    
    CGAffineTransform t = CGAffineTransformIdentity;
    t = CGAffineTransformTranslate(t, pt.x, pt.y);
    t = CGAffineTransformRotate(t, rotation*M_PI/180.0);
    t = CGAffineTransformScale(t, scale, scale);
    
    NSString* transition = [GLDTween easingNames][[self.picker selectedRowInComponent:0]];
    
    [GLDTween removeTween:self.box];
    [GLDTween addTween:self.box
            withParams:@{@"duration":@0.4,
                         @"easing": transition,
                         @"transform": [NSValue valueWithCGAffineTransform:t]}];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [GLDTween easingNames].count;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [GLDTween easingNames][row];
}


@end
