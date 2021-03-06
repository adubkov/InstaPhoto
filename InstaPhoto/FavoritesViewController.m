//
//  FavoritesViewController.m
//  InstaPhoto
//
//  Created by Alexey Dubkov on 1/5/18.
//  Copyright © 2018 Alexey Dubkov. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Favorites";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_favorites"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];

    // Photo View
    UIButton *buttonView = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonView setImage:[UIImage imageNamed:@"button_on"]
                forState:UIControlStateNormal];
    [buttonView setImage:[UIImage imageNamed:@"button_off"]
                forState:UIControlStateHighlighted];
    [buttonView setFrame:CGRectMake(150, 150, 100, 100)];
    [self.view addSubview:buttonView];
    [buttonView addTarget:self
                   action:@selector(showZoomedPicture:)
         forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showZoomedPicture:(UIButton *)sender {
    UIViewController *zoomedImageViewController = [[UIViewController alloc] init];
    zoomedImageViewController.view.frame = self.view.frame;
    zoomedImageViewController.title = @"My photo";
    
    UIImageView *photoView = [[UIImageView alloc]
                              initWithImage:[UIImage imageNamed:@"photo.jpg"]];
    [photoView setContentMode:UIViewContentModeScaleAspectFit];
    photoView.frame = zoomedImageViewController.view.frame;
    [zoomedImageViewController.view addSubview:photoView];
    
    [self.navigationController pushViewController:zoomedImageViewController animated:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
