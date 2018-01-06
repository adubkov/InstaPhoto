//
//  FeedViewController.h
//  InstaPhoto
//
//  Created by Alexey Dubkov on 1/5/18.
//  Copyright © 2018 Alexey Dubkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController

@property (strong, nonatomic) UINavigationController *navController;

- (void)showFavorites:(UIButton *)sender;
- (void)showProfile:(UIButton *)sender;

@end
