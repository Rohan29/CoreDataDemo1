//
//  EmployeeTable.m
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 13/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//

#import "EmployeeTable.h"
#import "AppDelegate.h"
#import "UpdateEmployee.h"
@interface EmployeeTable ()
{
    NSString *name;
    int *i;
}
@end

@implementation EmployeeTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // _arr=[[NSMutableArray alloc]init];
    
   // [self.tableView reloadData];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
    
    NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    UIApplication * app= [UIApplication sharedApplication];
    
    
    AppDelegate * appDel=app.delegate;
    
    _arrResult=[appDel.managedObjectContext executeFetchRequest:fr error:nil];


    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _arrResult.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    
     _e= self.arrResult [indexPath.row];
    
    cell.textLabel.text = _e.empname;
    
    cell.detailTextLabel.text =_e.empid;

   
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    UIApplication * app= [UIApplication sharedApplication];
    
    AppDelegate * appDel=app.delegate;
     i=indexPath.row;
    _e1=(Employee *)[_arrResult objectAtIndex:i];
    name=_e1.empid;

    fr.predicate = [NSPredicate predicateWithFormat:@"empid == %@ ",name];
    fr.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"empname" ascending:YES]];
    
    NSArray *results = [appDel.managedObjectContext executeFetchRequest:fr error:nil];
    Employee *emp=(Employee *)[results objectAtIndex:0];
    UpdateEmployee *ue=[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"UpdateEmployee"];
    ue.emp=emp;



    NSLog(@"%@",ue.emp);
    [self.navigationController pushViewController:ue animated:YES];

    

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
