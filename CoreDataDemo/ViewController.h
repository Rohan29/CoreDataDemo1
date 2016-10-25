//
//  ViewController.h
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 13/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nametf;
@property (weak, nonatomic) IBOutlet UITextField *empidTf;
@property (weak, nonatomic) IBOutlet UITextField *salaryf;
@property (weak, nonatomic) IBOutlet UITextField *dobTd;

- (IBAction)saveBtnClicked:(id)sender;
@end

