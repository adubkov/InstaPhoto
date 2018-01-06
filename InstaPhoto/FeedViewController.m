//
//  FeedViewController.m
//  InstaPhoto
//
//  Created by Alexey Dubkov on 1/5/18.
//  Copyright © 2018 Alexey Dubkov. All rights reserved.
//

#import "FeedViewController.h"
#import "FavoritesViewController.h"
#import "ProfileViewController.h"

@interface FeedViewController ()

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Feed";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_feed"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    // Favorites Button
    UIButton *favoritesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    favoritesButton.frame = CGRectMake(60, 100, 200, 44);
    [favoritesButton setTitle:@"View Favorites" forState:UIControlStateNormal];
    favoritesButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:favoritesButton];
    [favoritesButton addTarget:self action:@selector(showFavorites:) forControlEvents:UIControlEventTouchUpInside];
    
    // Profile Button
    UIButton *profileButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    profileButton.frame = CGRectMake(60, 200, 200, 44);
    [profileButton setTitle:@"View Profile" forState:UIControlStateNormal];
    profileButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:profileButton];
    [profileButton addTarget:self action:@selector(showProfile:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showFavorites:(UIButton *)sender {
    FavoritesViewController *favoritesViewController = [[FavoritesViewController alloc] init];
    [self.navigationController pushViewController:favoritesViewController animated:YES];
}

- (void)showProfile:(UIButton *)sender {
    // Profile View Controller
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    FavoritesViewController *favoritesViewController = [[FavoritesViewController alloc] init];
    UINavigationController *profileNavController = [[UINavigationController alloc] initWithRootViewController:profileViewController];

    // Tab Bar Controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:@[profileNavController, favoritesViewController]];

    [self.navigationController pushViewController:tabBarController animated:YES];
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
