//
//  Task.h
//  ToDo
//
//  Created by Cerino, Carmen on 2/21/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import <Foundation/Foundation.h>

enum{
   TaskNotDue,
   TaskDue,
   TaskPastDue
} typedef TaskState;

@interface Task : NSObject <NSCoding>

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* taskDescription;
@property (strong, nonatomic) UIImage* image;
@property (strong, nonatomic) NSDate* dueDate;

- (TaskState)isTaskDue;

@end
