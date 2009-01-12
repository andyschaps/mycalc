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
	//Operation operation;
	if ([operatorText isEqualToString:@"×"])
	{
		operatorText = @"*";
	}
	
	//[processor setOperationValue:operatorText];
	
	[operatorField setStringValue:(NSString*)operatorText];	
}

- (IBAction) Clear: (id) sender  {
	[processor setModifierValue:[NSDecimalNumber decimalNumberWithString:@"0"]];
	[processor setDecimalPressed:false];
	[processor setLastDigitWasZero:false];
	[displayField setStringValue:[[processor modifierValue] stringValue]];
	[operatorField setStringValue:@""];
}

- (IBAction) ToggleSign: (id) sender {
	[processor setModifierValue:[[processor modifierValue] decimalNumberByMultiplyingBy:[NSDecimalNumber decimalNumberWithString:@"-1"]]];
	[displayField setStringValue:[[processor modifierValue] stringValue]];
}

- (void) HandleDecimalPress {
	if (![processor decimalPressed])
	{
		[processor setDecimalPressed:true];
	}
}

- (IBAction) ModifyCurrentWorkingValue: (id) sender {
	NSButton* b = (NSButton*)sender;
	NSString* newChar = [b title]; 
	NSDecimalNumber* workingValue = [processor modifierValue];
	bool keyIsDecimal = false;

	if([newChar isEqualToString:@"."])
	{
		keyIsDecimal = true;
		[self HandleDecimalPress];
	}
	else
	{
		NSString* tempNumber = [workingValue stringValue];
		if ([processor decimalPressed] && [tempNumber rangeOfString:@"."].location == NSNotFound)
		{
			tempNumber = [tempNumber stringByAppendingString:@"."];
		}
		if ([newChar isEqualToString:@"0"])
		{
			[processor setLastDigitWasZero:true];
		}
		else
		{
			if ([processor lastDigitWasZero])
			{
				tempNumber = [tempNumber stringByAppendingString:@"0"];
				[processor setLastDigitWasZero:false];
			}
			tempNumber = [tempNumber stringByAppendingString:newChar];
			workingValue = [NSDecimalNumber decimalNumberWithString:tempNumber];
		}
	}
			
	[processor setModifierValue:workingValue];
	
	if (keyIsDecimal)
	{
		[displayField setStringValue:[@"." stringByAppendingString:[workingValue stringValue]]];
	}
	else if ([processor lastDigitWasZero])
	{
		if ([processor decimalPressed] && [[workingValue stringValue] rangeOfString:@"."].location == NSNotFound)
		{
			[displayField setStringValue:[[workingValue stringValue] stringByAppendingString:@".0"]];
		}
		else
		{
			[displayField setStringValue:[[workingValue stringValue] stringByAppendingString:@"0"]];
		}
	}
	else
	{
		[displayField setStringValue:[workingValue stringValue]];
	}
}


	
@end
