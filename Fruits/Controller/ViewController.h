//
//  ViewController.h
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FruitLoader.h"
@interface ViewController : UIViewController
    @property (nonatomic, strong) NSArray *fruitArray;
    @property (nonatomic, strong) NSMutableDictionary *countFruits;

    @property (nonatomic, assign) float totalSum;
    @property (nonatomic, strong) FruitLoader *fruitLoader;
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (weak, nonatomic) IBOutlet UILabel *totalSumLabel;
    
@end

