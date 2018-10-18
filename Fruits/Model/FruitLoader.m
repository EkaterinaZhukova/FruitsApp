//
//  FruitLoader.m
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import "FruitLoader.h"
#import "Loader.h"
#import "Fruit.h"

@interface FruitLoader ()

@property (nonatomic,strong) Loader *jsonLoader;
@property (nonatomic,strong) NSURL *url;


@end

@implementation FruitLoader

- (instancetype) initWithStringURL :(NSString*)stringURL{
    self = [super init];
    if(self){
        self.jsonLoader = [Loader new];
    }
    self.url = [NSURL URLWithString: stringURL];
    return self;
}
-(void) loadWithCompletion : (FruitLoaderBlock) completion{
    [self.jsonLoader startWithURL:self.url completion:^(NSDictionary * _Nonnull dictionary, NSError * _Nonnull error) {
        
        NSDictionary* itemsDictionary = dictionary[@"items"];
        NSMutableArray * mutableArray = [NSMutableArray array];
        for(NSString * name in itemsDictionary.allKeys){
            float price = [itemsDictionary[name] floatValue];
            Fruit *fruit = [Fruit fruitWithName:name price:price];
            [mutableArray addObject:fruit];
        }
        completion([mutableArray copy]);
        NSLog(@"%@",itemsDictionary);
        
        
    }];
}

@end
