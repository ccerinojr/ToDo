//
//  TaskViewController.h
//  ToDo
//
//  Created by Cerino, Carmen on 2/21/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;

@protocol TaskViewControllerDelegate <NSObject>

- (void)taskSaved:(Task*)task wasEditting:(BOOL)editing;

@end

@interface TaskViewController : UIViewController

@property (strong, nonatomic, readwrite) Task* task;
@property (weak, nonatomic) NSObject<TaskViewControllerDelegate>* taskDelgate;

@end
