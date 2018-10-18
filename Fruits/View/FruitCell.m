//
//  FruitCell.m
//  Fruits
//
//  Created by Екатерина on 10/13/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import "FruitCell.h"
#import "ViewController.h"
#import "Fruit.h"
@implementation FruitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)pressStepper:(id)sender {
    
    NSInteger newValue = (NSInteger) self.stepper.value;
    self.currentCount.text = [NSString stringWithFormat:@"%ld",(long)newValue];
    
    _fruitCountBlock(newValue);

}
    
    @end
