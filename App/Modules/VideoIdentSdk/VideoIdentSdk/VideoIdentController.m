//
//  VideoIdentSdk.m
//  VideoIdentSdk
//
//  Created by phu nguyen on 2/22/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

#import "VideoIdentController.h"

@implementation VideoIdentController

- (instancetype)init {
    
    if (self = [super init]) {
        NSLog(@"Initialized - VideoIdentController");
    }
    return self;
}

- (void)initialize:(NSString *)token controller:(UIViewController *)controller {
    VideoIdentViewController *videoIdentController = [VideoIdentViewController new];
    videoIdentController.token = token;
    
    [controller presentViewController:videoIdentController animated:YES completion:nil];
}

@end

@implementation VideoIdentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *label = [UILabel new];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    [label setText:[NSString stringWithFormat:@"Welcome to VideoIdentSDK \nStarting VideoIdent/Esign flow with token: %@", _token]];
    label.numberOfLines = 0;
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UIButton *closeButton = [UIButton new];
    [closeButton setTitle:@"Close" forState:UIControlStateNormal];
    [closeButton setBackgroundColor:[UIColor colorWithRed:249.0/255 green:86.0/255 blue:1.0/255 alpha:1.0]];
    closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    [closeButton addTarget:self action:@selector(closeCurrentWindow:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:label];
    [self.view addSubview:closeButton];
    
    NSArray *buttonConstraints = [NSArray arrayWithObjects:
                            [NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20],
                            [NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.safeAreaLayoutGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:30],
                            [NSLayoutConstraint constraintWithItem:closeButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:1.0],
                            nil];
    NSArray *labelConstraints = [NSArray arrayWithObjects:
                                  [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30],
                                  [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30],
                                 [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0],
                                  nil];
    
    [self.view addConstraints:buttonConstraints];
    [self.view addConstraints:labelConstraints];
    [label addConstraint:[NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:100.0]];
}

- (void)closeCurrentWindow:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"VideoIdentViewController - dealloc");
}

@end
