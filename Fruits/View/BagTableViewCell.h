//
//  BagTableViewCell.h
//  Fruits
//
//  Created by Екатерина on 10/16/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BagTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *fruitImage;
@property (weak, nonatomic) IBOutlet UILabel *fruitName;
@property (weak, nonatomic) IBOutlet UILabel *totalFruitSum;

@end

NS_ASSUME_NONNULL_END
