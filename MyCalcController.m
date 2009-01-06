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
	//Operation* operation;
	if ([operatorText isEqualToString:@"×"])
	{
		operatorText = @"*";
	}
	
//	[processor setOperationValue:operatorText];
	
	[operatorField setStringValue:(NSString*)operatorText];	
}

- (IBAction) ModifyCurrentWorkingValue: (id) sender {
	NSButton* b = (NSButton*)sender;
	NSString* newChar = [b title]; 
	NSDecimalNumber* workingValue = [processor modifierValue];
	
	if([newChar isEqualToString:@"C"])
	{
		workingValue = [NSDecimalNumber decimalNumberWithString:@"0"];
	}
	else if([newChar isEqualToString:@"."])
	{
	}
	else
	{
		NSDecimalNumber* newNumber = [NSDecimalNumber decimalNumberWithString:newChar];
		workingValue = [workingValue decimalNumberByMultiplyingByPowerOf10:(short)1];
		workingValue = [workingValue decimalNumberByAdding:newNumber];
	}
			
	[processor setModifierValue:workingValue];
	
	[displayField setStringValue:[workingValue stringValue]];
}


	
@end
