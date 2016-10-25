//
//  SearchViewController.m
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 13/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//

#import "SearchViewController.h"
#import "AppDelegate.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
   // _searchlistTable=[[UITableView alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 */-(void)viewWillAppear:(BOOL)animated{
      [self.searchlistTable reloadData];
  }

- (IBAction)sortBtnClicked:(id)sender {
    
    NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    UIApplication * app= [UIApplication sharedApplication];
    
    AppDelegate * appDel=app.delegate;
   
    //fr.predicate = [NSPredicate predicateWithFormat:@"empname == %@ ",_searchfield.text];
    //fr.predicate1 = [NSPredicate predicateWithFormat:@"empid == %@ ",_searchfield.text];
    
   fr.predicate=[NSPredicate predicateWithFormat:@"empname contains[cd] %@ AND empid contains[cd] %@", _searchfield.text, _searchfield.text];
    fr.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"empid" ascending:NO]];
    
    _results = [appDel.managedObjectContext executeFetchRequest:fr error:nil];
    
     NSLog(@"%@",_results);
    [self.searchlistTable reloadData];
    
    
    
    
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_searchlistTable dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        _e= self.results [indexPath.row];
        cell.textLabel.text = _e.empname;
        cell.detailTextLabel.text = _e.empid;
    
    
    
    return cell;
}
- (IBAction)SortByIdClicked:(id)sender {
    NSFetchRequest *fr=[NSFetchRequest fetchRequestWithEntityName:@"Employee"];
    
    UIApplication * app= [UIApplication sharedApplication];
    
    AppDelegate * appDel=app.delegate;
    
    
    
    
    fr.predicate = [NSPredicate predicateWithFormat:@"empid contains[cd] %@ OR empname contains[cd] %@ ",_empidTf.text,_searchfield.text];
    
    fr.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"empid" ascending:NO]];
    
    _results = [appDel.managedObjectContext executeFetchRequest:fr error:nil];
    NSLog(@"%@",_results);
    [self.searchlistTable reloadData];
    
    
}
@end
