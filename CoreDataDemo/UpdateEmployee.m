//
//  UpdateEmployee.m
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 13/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//

#import "UpdateEmployee.h"
#import "AppDelegate.h"
#import "EmployeeTable.h"
@interface UpdateEmployee ()

@end

@implementation UpdateEmployee

- (void)viewDidLoad {
    [super viewDidLoad];
    //_empdict2=[[NSDictionary alloc]init];
    //_empdict2=_empdict;
  
  

    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@" %@ ",_emp.empid);
    
    _nameTf.text=_emp.empname;
    _empidTf.text=_emp.empid;
    
    
    _salTf.text=_emp.sal;
    _dobTf.text=_emp.dob;


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)updateBtnClicked:(id)sender {
    
    UIApplication * app= [UIApplication sharedApplication];
    
    AppDelegate * appDel=app.delegate;
//
//    NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empid == %@", _empidTf.text];
//    
//    
//    NSArray *results=[[NSArray alloc]init];
//     [fr setPredicate:predicate];
//   
//    results=[appDel.managedObjectContext executeFetchRequest:fr error:nil ];
//    
//    if(!results.count){
//           // _emp.empname=_nameTf.text;
//       
//               _emp.empid=_empidTf.text;
//            NSLog(@"%@\n%@\n%@\n%@",_emp.empname,_emp.empid,_emp.sal,_emp.dob);
//            [appDel.managedObjectContext save:nil];
//            [self.navigationController popToRootViewControllerAnimated:YES];
//
//        
//      
//           // _emp.sal=_salTf.text;
//           // _emp.dob= _dobTf.text;
//        
//        
//    }
// else{
//
//     
////     if(!results.count){
////         
////         _emp.empname=_nameTf.text;
////         //  _emp.empid=_empidTf.text;
////         _emp.sal=_salTf.text;
////         _emp.dob= _dobTf.text;
////         
////         NSLog(@"%@\n%@\n%@\n%@",_emp.empname,_emp.empid,_emp.sal,_emp.dob);
////         [appDel.managedObjectContext save:nil];
////         
////         [self.navigationController popToRootViewControllerAnimated:YES];
////     }
////     else{
//      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning...!!!"
//        message:@"Employee ID should be Unique" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//     
//         [alert show];
//     
//     
//     
// }

        

    
    if (![_empidTf.text isEqualToString:_emp.empid]) {
        NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empid == %@", _empidTf.text];
        [fr setPredicate:predicate];
        NSArray *results=[[NSArray alloc]init];
        
        results=[appDel.managedObjectContext executeFetchRequest:fr error:nil ];
        
        if(!results.count) {
            
            // EmpTableViewController *et=[[EmpTableViewController alloc]init];
            //et.arrResult=[appDel.managedObjectContext executeFetchRequest:fr error:nil];
            
            _emp.empname=_nameTf.text;
            _emp.empid=_empidTf.text;
            _emp.sal=_salTf.text;
            _emp.dob= _dobTf.text;
            
            NSLog(@"%@\n%@\n%@\n%@",_emp.empname,_emp.empid,_emp.sal,_emp.dob);
            [appDel.managedObjectContext save:nil];
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

        
    }else{
    
        // EmpTableViewController *et=[[EmpTableViewController alloc]init];
        //et.arrResult=[appDel.managedObjectContext executeFetchRequest:fr error:nil];
    
        _emp.empname=_nameTf.text;
        _emp.empid=_empidTf.text;
        _emp.sal=_salTf.text;
       _emp.dob= _dobTf.text;
    
        NSLog(@"%@\n%@\n%@\n%@",_emp.empname,_emp.empid,_emp.sal,_emp.dob);
        [appDel.managedObjectContext save:nil];
    
    
            [self.navigationController popToRootViewControllerAnimated:YES];
    
        }
}

- (IBAction)deleteBtnClicked:(id)sender {
    UIApplication * app= [UIApplication sharedApplication];
    
    AppDelegate * appDel=app.delegate;
    
    NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    [appDel.managedObjectContext executeFetchRequest:fr error:nil];
    
    
    
    [appDel.managedObjectContext deleteObject:_emp];
    [appDel.managedObjectContext save:nil];
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
 
    
    
}
@end
