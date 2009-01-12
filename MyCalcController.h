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
	IBOutlet NSTextField *operatorField;
	
	MathProcessor *processor;
}


- (void)HandleDecimalPressed;
- (IBAction)Clear:(id)sender;
- (IBAction)ToggleSign:(id)sender;
- (IBAction)ModifyCurrentWorkingValue:(id)sender;
- (IBAction)RegisterCurrentOperation:(id)sender;
- (IBAction)PerformOperation:(id)sender;

@end
