//
//  VideoIdentController.h
//  VideoIdentController
//
//  Created by phu nguyen on 2/22/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VideoIdentController : NSObject

- (void)initialize: (NSString *)token controller:(UIViewController *)controller;

@end

@interface VideoIdentViewController : UIViewController

@property (strong, nonatomic) NSString* token;

@end
