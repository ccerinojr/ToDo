//
//  Task.m
//  ToDo
//
//  Created by Cerino, Carmen on 2/21/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import "Task.h"

@implementation Task

+ (NSDate*)dateWithRelativeUnitsForComparison:(NSDate*)date
{
   NSCalendar *cal = [NSCalendar currentCalendar];
   NSDateComponents *components = [cal components:(NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
   return [cal dateFromComponents:components];
}

- (TaskState)isTaskDue
{
  
   NSDate* today = [[self class] dateWithRelativeUnitsForComparison:[NSDate date]];
   NSDate* dueDate = [[self class] dateWithRelativeUnitsForComparison:self.dueDate];
   
   NSComparisonResult c = [today compare:dueDate];
   if (c == NSOrderedSame)
   {
      return TaskDue;
   }
   else if (c == NSOrderedDescending)
   {
      return TaskPastDue;
   }
   
   return TaskNotDue;
}
@end
