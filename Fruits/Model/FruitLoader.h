//
//  FruitLoader.h
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^FruitLoaderBlock)(NSArray *fruitArray);

NS_ASSUME_NONNULL_BEGIN

@interface FruitLoader : NSObject
- (instancetype) initWithStringURL :(NSString*)stringURL;
- (void) loadWithCompletion : (FruitLoaderBlock) completion;

@end

NS_ASSUME_NONNULL_END
