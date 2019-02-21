//
//  VideoIdentSdk.m
//  VideoIdentSdk
//
//  Created by phu nguyen on 2/20/19.
//  Copyright © 2019 anonymous. All rights reserved.
//
#import <Masonry/View+MASAdditions.h>
#import "VideoIdentSdk.h"


@implementation VideoIdentSdk

- (instancetype)init {
    if ([super init]) {
        NSLog(@"Initialized - VideoIdentSdk");
    }
    return self;
}

- (void)initializeWithToken:(NSString *)token fromController:(UIViewController *)controller {
    UIViewController *tempViewController = [UIViewController new];
    [tempViewController.view setBackgroundColor:[UIColor whiteColor]];
    
    [tempViewController setTitle:@"Video Ident"];
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setText:[NSString stringWithFormat:@"VideoIdentSdk with %@", token]];
    [titleLabel sizeToFit];
    [tempViewController.view addSubview:titleLabel];
        
    titleLabel.center = tempViewController.view.center;
    
    [controller.navigationController pushViewController:tempViewController animated:YES];
}

@end
