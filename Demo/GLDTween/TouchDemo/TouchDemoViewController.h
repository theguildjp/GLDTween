//
//  TouchDemoViewController.h
//  GLDTween
//
//  Created by 深津 貴之 on 2014/10/03.
//  Copyright (c) 2014年 THE GUILD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TouchDemoViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong,nonatomic) IBOutlet UIView* box;
@property (strong,nonatomic) IBOutlet UIPickerView *picker;
@end
