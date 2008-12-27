//
//  MyCalcController.m
//  MyCalc
//
//  Created by Andy Schaps on 11/23/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "MyCalcController.h"

@implementation MyCalcController

-(void)awakeFromNib {
	processor = [[MathProcessor alloc]init];
}

-(IBAction)PerformOperation:(id)sender {
	
}

- (IBAction) RegisterCurrentOperation: (id) sender {
	NSButton* b = (NSButton*)sender;
	NSString* operatorText = [b title]; 
	
	[processor setOperationValue:operatorText];
	
	[operatorField setStringValue:(NSString*)operatorText];	
}

- (IBAction) ModifyCurrentWorkingValue: (id) sender {
	NSButton* b = (NSButton*)sender;
	NSString* newChar = [b title]; 
	float workingValue = [processor modifierValue];
	
	if([newChar isEqualToString:@"C"])
	{
		workingValue = 0;
	}
	else if([newChar isEqualToString:@"."])
	{
	}
	else
	{
		NSNumber* *nm = [NSNumber numberWithFloat:[newChar floatValue]];
		workingValue = (workingValue * 10) + [nm floatValue];
	}
			
	[processor setModifierValue:workingValue];
	
	[displayField setFloatValue:workingValue];
}
	
@end
