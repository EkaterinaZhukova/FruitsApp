//
//  Loader.m
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import "Loader.h"

@implementation Loader

- (void)startWithURL : (NSURL *)url completion:(LoaderBlock) completion
{
    NSLog(@"Start with url %@",url);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString* fileContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        
        
        
        NSData * jsonData = [fileContent dataUsingEncoding:NSUTF8StringEncoding];
        NSError * error=nil;
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
        
        dispatch_async(dispatch_get_main_queue(),^{
            if(error != nil){
                completion([NSDictionary dictionary],error);
            }
            else{
                completion(json,nil);
            }
        });
       
    });
    
}

@end
