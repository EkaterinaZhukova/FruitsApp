//
//  Loader.h
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef void (^LoaderBlock)(NSDictionary *dictionary, NSError * error);

@interface Loader : NSObject


- (void)startWithURL : (NSURL *)url completion:(LoaderBlock) completion;

@end

NS_ASSUME_NONNULL_END
