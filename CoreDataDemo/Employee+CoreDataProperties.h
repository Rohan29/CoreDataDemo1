//
//  Employee+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by AbbasGEeshana on 20/04/16.
//  Copyright © 2016 eeshana. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Employee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *dob;
@property (nullable, nonatomic, retain) NSString *empid;
@property (nullable, nonatomic, retain) NSString *empname;
@property (nullable, nonatomic, retain) NSString *sal;

@end

NS_ASSUME_NONNULL_END
