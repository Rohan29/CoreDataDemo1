//
//  SearchViewController.h
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 13/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
@interface SearchViewController : UIViewController<UIAlertViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *searchfield;
- (IBAction)sortBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *Searchlistview;
@property (weak, nonatomic) IBOutlet UITableView *searchlistTable;
@property(nonatomic,retain)NSArray *results;
@property(nonatomic,retain)Employee *e;
@property (weak, nonatomic) IBOutlet UITextField *empidTf;
- (IBAction)SortByIdClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addcellBtnCLick;

@end
