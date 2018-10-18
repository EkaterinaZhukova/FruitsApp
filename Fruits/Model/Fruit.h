//
//  Fruit.h
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Fruit : NSObject<NSCopying,NSCoding>


@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) float price;
@property (nonatomic, strong) UIImage *image;

+ (instancetype) fruitWithName : (NSString*)name price:(float)price;

@end

NS_ASSUME_NONNULL_END
