//
//  VideoIdentSdk.h
//  VideoIdentSdk
//
//  Created by phu nguyen on 2/20/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VideoIdentSdk : NSObject

- (void)initializeWithToken:(NSString *)token fromController:(UIViewController *)controller;

@end
