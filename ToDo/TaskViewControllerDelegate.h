//
//  TaskViewControllerDelegate.h
//  ToDo
//
//  Created by Cerino, Carmen on 2/26/13.
//  Copyright (c) 2013 TechSmith. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TaskViewControllerDelegate <NSObject>

- (void)taskSaved:(Task*)task wasEditting:(BOOL)editing;

@end

