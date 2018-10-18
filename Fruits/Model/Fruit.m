//
//  Fruit.m
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit
+ (instancetype) fruitWithName : (NSString*)name price:(float)price{
    Fruit * fruit = [Fruit new];
    fruit.name = name;
    fruit.price = price;
    fruit.image = [UIImage imageNamed:name];
    return fruit;
}
- (NSString*) description{
    return [NSString stringWithFormat:@"<Fruit: name %@ price: %.2f ",self.name,self.price];
}
- (BOOL)isEqual:(id)object{
    if(self == object){
        return true;
    }
    if(![object isKindOfClass:[Fruit class]]){
        return false;
    }
    Fruit * fruit = (Fruit *)object;
    return (fruit.name == self.name) && (fruit.price == self.price) && (fruit.image == self.image);
}
- (NSUInteger)hash{
    return [self.name hash] ^ [self.image hash];
}
- (nonnull id)copyWithZone:(nullable NSZone *)zone {

    Fruit *newFruit = [[[self class] allocWithZone:zone]init];
    newFruit.name = self.name;
    newFruit.price = self.price;
    newFruit.image = self.image;
    
    return newFruit;
    
}


- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeObject:[NSNumber numberWithFloat:self.price] forKey:@"price"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if(self){
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.image = [aDecoder decodeObjectForKey:@"image"];
        self.price = [[aDecoder decodeObjectForKey:@"price"] floatValue];
    }
    return self;
}

@end
