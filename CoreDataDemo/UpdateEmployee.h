//
//  UpdateEmployee.h
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 13/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
@interface UpdateEmployee : UIViewController<UIAlertViewDelegate>


@property(nonatomic,retain)NSMutableDictionary *empdict,*empdict2;
@property(nonatomic,retain)Employee *emp;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *empidTf;
@property (weak, nonatomic) IBOutlet UITextField *salTf;
@property (weak, nonatomic) IBOutlet UITextField *dobTf;
- (IBAction)updateBtnClicked:(id)sender;
- (IBAction)deleteBtnClicked:(id)sender;
@end
