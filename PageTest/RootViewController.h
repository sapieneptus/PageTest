//
//  RootViewController.h
//  NewPageTest
//
//  Created by Chris Fuentes on 3/16/17.
//  Copyright © 2017 microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

