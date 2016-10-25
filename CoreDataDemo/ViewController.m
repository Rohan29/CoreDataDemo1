//
//  ViewController.m
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 13/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
      // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveBtnClicked:(id)sender {
    
    
    UIApplication * app= [UIApplication sharedApplication];
    AppDelegate * appDel=app.delegate;
    
    NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empid == %@", _empidTf.text];
    [fr setPredicate:predicate];
    NSArray *results=[[NSArray alloc]init];
    
    results=[appDel.managedObjectContext executeFetchRequest:fr error:nil ];

    if(!results.count) {
       
        
        
        
        //not there so create it and save
//        obj = [appDel.managedObjectContext insertNewManagedObjectForEntity:@"Employee"]; //typed inline, dont know actual method
//        obj.stationIdentifier = stID;
//        [ctx save];
   
    
    //use obj... e.g.
    //NSLog(@"%@", obj.stationIdentifier);
    
    
    
    
    

    Employee *emp=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:appDel.managedObjectContext];
    emp.empid=_empidTf.text;
    emp.empname=_nametf.text;
    emp.dob=_dobTd.text;
    emp.sal=_salaryf.text;
    [appDel.managedObjectContext save:nil];
    
    NSLog(@"%@\n%@\n%@\n%@",emp.empname,emp.empid,emp.dob,emp.sal);
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning...!!!"
                                                        message:@"Employee ID should be Unique"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    
    
    }
}
@end
