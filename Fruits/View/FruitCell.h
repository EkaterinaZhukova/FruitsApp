//
//  FruitCell.h
//  Fruits
//
//  Created by Екатерина on 10/13/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FruitCell : UITableViewCell
    @property (weak, nonatomic) IBOutlet UIImageView *fruitImageView;
    @property (weak, nonatomic) IBOutlet UILabel *fruitName;
    @property (weak, nonatomic) IBOutlet UILabel *fruitPrice;
    @property (weak, nonatomic) IBOutlet UILabel *currentCount;
    @property (weak, nonatomic) IBOutlet UIStepper *stepper;
    
    @property (nonatomic, copy) void (^fruitCountBlock)(NSInteger);
    

@end

NS_ASSUME_NONNULL_END
