//
//  TaskViewController.m
//  ToDo
//
//  Created by Cerino, Carmen on 2/21/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import "TaskViewController.h"
#import "Task.h"

@interface TaskViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property BOOL isEditing;

@end

@implementation TaskViewController

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   self.isEditing = self.task != nil;
   if (self.task)
   {
      self.titleTextField.text = self.task.title;
      self.descriptionTextView.text = self.task.taskDescription;
      self.datePicker.date = self.task.dueDate;
   }
   else
   {
      self.task = [[Task alloc] init];
   }
   
   UIToolbar* toolbar = [[UIToolbar alloc] init];
   [toolbar setBarStyle:UIBarStyleBlackTranslucent];
   [toolbar sizeToFit];
   
   UIBarButtonItem* done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self.descriptionTextView action:@selector(resignFirstResponder)];
   UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
   [toolbar setItems:[NSArray arrayWithObjects:space, done, nil]];
   self.descriptionTextView.inputAccessoryView = toolbar;

}

- (IBAction)cancel:(id)sender
{
   [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)save:(id)sender
{
   self.task.title = self.titleTextField.text;
   self.task.taskDescription = self.descriptionTextView.text;
   self.task.dueDate = self.datePicker.date;
   
   [self.taskDelgate taskSaved:self.task wasEditting:self.editing];
   [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

-(BOOL) textFieldShouldReturn:(UITextField*) textField
{
   [textField resignFirstResponder];
   return YES;
}


@end
