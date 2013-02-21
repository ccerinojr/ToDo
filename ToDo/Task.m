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

- (id)initWithCoder:(NSCoder *)aDecoder
{
   self = [super init];
   if (self)
   {
      self.title = [aDecoder decodeObjectForKey:@"title"];
      self.taskDescription = [aDecoder decodeObjectForKey:@"description"];
      self.dueDate = [aDecoder decodeObjectForKey:@"dueDate"];
   }
   
   return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
   [aCoder encodeObject:self.title forKey:@"title"];
   [aCoder encodeObject:self.taskDescription forKey:@"description"];
   [aCoder encodeObject:self.dueDate forKey:@"dueDate"];
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
