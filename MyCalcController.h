//
//  MyCalcController.h
//  MyCalc
//
//  Created by Andy Schaps on 11/23/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MathProcessor.h"

@interface MyCalcController : NSObject {
	IBOutlet NSTextField *displayField;
	
	MathProcessor *processor;
}

- (IBAction)ModifyCurrentWorkingValue:(id)sender;
- (IBAction)RegisterCurrentOperation:(id)sender;
- (IBAction)PerformOperation:(id)sender;
//- (IBAction)WriteMemory:(id)sender;
//- (IBAction)ReadMemory:(id)sender;
//- (IBAction)ClearMemory:(id)sender;

@end