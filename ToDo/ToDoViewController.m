//
//  ViewController.m
//  ToDo
//
//  Created by Cerino, Carmen on 2/21/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import "ToDoViewController.h"
#import "TaskViewController.h"
#import "Task.h"
#import "TaskCell.h"

@interface ToDoViewController () <TaskViewControllerDelegate>
{
   NSMutableArray* _tasks;
}

@end

@implementation ToDoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
   _tasks = [NSMutableArray array];
   
   self.title = @"To Do";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"AddTask"])
	{
      TaskViewController* taskViewController = segue.destinationViewController;
      taskViewController.taskDelgate = self;
   }
   else if ([segue.identifier isEqualToString:@"EditTask"])
   {
      TaskViewController* taskViewController = segue.destinationViewController;
      taskViewController.taskDelgate = self;
      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      taskViewController.task = [_tasks objectAtIndex:indexPath.row];
   }
}

- (void)taskSaved:(Task*)task wasEditting:(BOOL)editing
{
   if (!editing)
   {
      [_tasks addObject:task];
      [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:_tasks.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
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
   return [tableView dequeueReusableCellWithIdentifier:@"ToDoCell"];;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   Task* task = [_tasks objectAtIndex:indexPath.row];
   TaskCell* taskCell = (TaskCell*)cell;

   taskCell.titleLabel.text = task.title;
   taskCell.descriptionLabel.text = task.description;
   
   NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
   [dateFormater setDateFormat:@"M/d/YY '@' h:mm a"];
   taskCell.dateLabel.text = [dateFormater stringFromDate:task.dueDate];
   
}

@end
