//
//  ProfileViewController.m
//  InstaPhoto
//
//  Created by Alexey Dubkov on 1/5/18.
//  Copyright © 2018 Alexey Dubkov. All rights reserved.
//

#import "ProfileViewController.h"

@import AFNetworking;

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"tab_icon_favorites"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://127.0.0.1:8080/users/3.json"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [manager GET:url.absoluteString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        self.userProfile = responseObject;
        [self responseSuccessful];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"NSError: %@", error.localizedDescription);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)responseSuccessful {
    self.view.backgroundColor = [UIColor whiteColor];
    
    // ScrollView
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(320, 776);
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.scrollView];
    
    // Photo View
    //UIImageView *photoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo.jpg"]];
    UIImageView *photoView = [[UIImageView alloc] init];
    [photoView setImageWithURL:[NSURL URLWithString:self.userProfile[@"profilePhoto"]]
              placeholderImage:[UIImage imageNamed:@"placeholder-person"]];
    [photoView setContentMode:UIViewContentModeScaleAspectFit];
    photoView.frame = CGRectMake(20, 20, 100, 114);
    [self.scrollView addSubview:photoView];
    
    // Name Label
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 180, 40)];
    nameLabel.text = [NSString stringWithFormat: @"Name: %@ %@", self.userProfile[@"firstName"], self.userProfile[@"lastName"]];
    [self.scrollView addSubview:nameLabel];
    
    // City Label
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 280, 40)];
    cityLabel.text = [NSString stringWithFormat: @"From %@", self.userProfile[@"city"]];
    [self.scrollView addSubview:cityLabel];
    
    // Biography TextView
    UITextView *biography = [[UITextView alloc] initWithFrame:CGRectMake(12, 260, 300, 180)];
    biography.font = [UIFont fontWithName:@"Helvetica" size:15];
    biography.editable = NO;
    biography.text = self.userProfile[@"biography"];
    [self.scrollView addSubview:biography];
    
    // Member since Label
    UILabel *memberSinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 736, 280, 40)];
    memberSinceLabel.text = [NSString stringWithFormat:@"Member since: %@", self.userProfile[@"memberSince"]];
    [self.scrollView addSubview:memberSinceLabel];
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
