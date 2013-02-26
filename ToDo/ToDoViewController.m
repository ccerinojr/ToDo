//
//  ViewController.m
//  ToDo
//
//  Created by Cerino, Carmen on 2/21/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import "ToDoViewController.h"
#import "Task.h"
#import "TaskCell.h"
#import <QuartzCore/QuartzCore.h>


@interface ToDoViewController ()
{
   NSMutableArray* _tasks;
}

@end

@implementation ToDoViewController

+ (NSURL*)urlForSavedTasks
{
   static NSURL* localDocumentsDirectoryURL = nil;
   if (localDocumentsDirectoryURL == nil)
   {
      NSString* documentsDirectoryPath = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES ) objectAtIndex:0];
      localDocumentsDirectoryURL = [[NSURL fileURLWithPath:documentsDirectoryPath] URLByAppendingPathComponent:@"tasks"];

   }
   return localDocumentsDirectoryURL;
}

- (void)saveTasks
{
   [NSKeyedArchiver archiveRootObject:_tasks toFile:[[[self class] urlForSavedTasks] path]];
}

- (void)loadTasks
{
   _tasks = [NSKeyedUnarchiver unarchiveObjectWithFile:[[[self class] urlForSavedTasks] path]];
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   [self loadTasks];
   
   if (!_tasks)
   {
      _tasks = [NSMutableArray array];
   }
   
   self.title = @"To Do";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   //TaskViewController* taskViewController = segue.destinationViewController;

	if ([segue.identifier isEqualToString:@"AddTask"])
	{
      //Setup the TaskViewController for adding a task
   }
   else if ([segue.identifier isEqualToString:@"EditTask"])
   {
      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      
      //Setup the TaskViewController for editing the above task
   }
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return [_tasks count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return [tableView dequeueReusableCellWithIdentifier:@"ToDoCell"];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   Task* task =[_tasks objectAtIndex:indexPath.row];
   cell.textLabel.text =  task.title;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

}

@end
