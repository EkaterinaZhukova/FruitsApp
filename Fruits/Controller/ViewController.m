//
//  ViewController.m
//  Fruits
//
//  Created by Екатерина on 10/12/18.
//  Copyright © 2018 Екатерина. All rights reserved.
//

#import "ViewController.h"
#import "FruitLoader.h"
#import "FruitCell.h"
#import "Fruit.h"
#import "BagTableViewController.h"

#define kURL @"https://appsettings.apalon.com/uploads/130/530/da7f9b28b4dea513116ebf1123825c39.json"
#define cellFruitID @"fruitCell"
#define bagSegueID @"showBagStore"
#define dictUserDefaults @"countFruits"
#define totalUserDeafults @"totalSumSave"
@interface ViewController()
    @property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipe;
@end

@implementation ViewController

- (void)viewDidLoad {
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:dictUserDefaults];
//    [[NSUserDefaults standardUserDefaults]removeObjectForKey:totalUserDeafults];
    [nc addObserver:self selector:@selector(appMoveTerminate) name:UIApplicationWillTerminateNotification object:nil];
    [nc addObserver:self selector:@selector(appMoveTerminate) name:UIApplicationWillResignActiveNotification object:nil];
    [super viewDidLoad];
   
    self.fruitLoader = [[FruitLoader alloc] initWithStringURL:kURL];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:dictUserDefaults];
    self.countFruits = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%@",self.countFruits);
    self.totalSum = [[NSUserDefaults standardUserDefaults]floatForKey:totalUserDeafults];
    NSLog(@"%1.2f",self.totalSum);
    self.totalSumLabel.text = [[NSString stringWithFormat:@"%1.2f",self.totalSum] stringByAppendingString:@"$"];
    __weak ViewController* weakSelf = self;
    
    [self.fruitLoader loadWithCompletion:^(NSArray *fruitArray) {
        NSLog(@"%@",fruitArray);
        weakSelf.fruitArray = fruitArray;
        NSMutableDictionary * dict = [NSMutableDictionary new];
        if(weakSelf.countFruits == nil){
            for(int i = 0;i<fruitArray.count;i++){
                [dict setObject:[NSNumber numberWithInteger:0] forKey:[weakSelf.fruitArray objectAtIndex:i]];
            }
            weakSelf.countFruits = dict;
        }
        [weakSelf.tableView reloadData];
    }];
}

- (void) appMoveTerminate {
    NSLog(@"App move to terminate! %@",self.countFruits);
    NSError *error;
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:self.countFruits requiringSecureCoding:FALSE error:&error];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:dictUserDefaults];
    [[NSUserDefaults standardUserDefaults] setFloat:self.totalSum forKey:totalUserDeafults];
    NSLog(@"%1.2f",self.totalSum);


}
- (void)appMoveBackGround{
    NSLog(@"Move background");
}
- (IBAction)swipeToNewSegue:(id)sender {
    [self performSegueWithIdentifier:bagSegueID sender:self];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
   
    FruitCell *cell = (FruitCell*)[tableView dequeueReusableCellWithIdentifier:cellFruitID];
    Fruit * fruit = [self.fruitArray objectAtIndex:indexPath.row];
    cell.imageView.image = fruit.image;
    cell.fruitName.text = fruit.name;
    cell.fruitPrice.text = [[NSString stringWithFormat:@"%1.2f",fruit.price] stringByAppendingString:@"$"];
    cell.currentCount.text = [NSString stringWithFormat:@"%d",[self.countFruits[fruit] intValue]];
    cell.stepper.value = [self.countFruits[fruit] intValue];
    //NSLog(@"%d",[self.countFruits[fruit] intValue]);
    //NSLog(@"%@",self.countFruits);
    __weak ViewController* weakSelf = self;

    cell.fruitCountBlock = ^(NSInteger num){
        if(num > [weakSelf.countFruits[fruit]integerValue]){
            weakSelf.totalSum += fruit.price;
            weakSelf.countFruits[fruit] = [NSNumber numberWithInteger:num];
        }
        else{
            weakSelf.totalSum -= fruit.price;
            weakSelf.countFruits[fruit] = [NSNumber numberWithInteger:num];
        }
            weakSelf.totalSumLabel.text = [[NSString stringWithFormat:@"%1.2f",self.totalSum] stringByAppendingString:@"$"];
    };
    return cell;
    
}
    
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.fruitArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
    -(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
        if([[segue identifier] isEqualToString:bagSegueID]){
            NSLog(@"Dict %@",self.countFruits);
            
            BagTableViewController * vc = [segue destinationViewController];
            NSMutableDictionary *answer = [NSMutableDictionary new];
            for(Fruit* fruit in [self.countFruits allKeys]){
                NSNumber* num = self.countFruits[fruit];
                if([num intValue]>0){
                    answer[fruit] = num;
                }
            }
            vc.fruitDictionary = [answer copy];
        }
    }
- (void)dealloc
{
    NSNotificationCenter * nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    [nc removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];

}

    @end
