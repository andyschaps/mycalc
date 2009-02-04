//
//  MyCalcController.m
//  MyCalc
//
//  Created by Andy Schaps on 11/23/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "MyCalcController.h"

@implementation MyCalcController

-(void)awakeFromNib
{
	[self clear:self];
}

-(void)dealloc
{
	[displayedValue release];
	[enteredValue release];
	[super dealloc];
}

-(void)clear:(id)sender
{
	[displayedValue autorelease];
	displayedValue = [[NSDecimalNumber zero] retain];
	[enteredValue autorelease];
	enteredValue = [[NSDecimalNumber zero] retain];
	[displayField setStringValue:[displayedValue stringValue]];
	[self endEditingNumber];
	lastOperation = None;
	usedDecimalPoint = NO;
	enteringNumber = NO;
}

- (void) setLastOperation: (id) sender  {
	lastOperation = [sender tag];
	NSButton* b = (NSButton*)sender;
	NSString* operatorText = [b title];
	if ([operatorText isEqualToString:@"×"])
	{
		operatorText = @"*";
	}
	[operatorField setStringValue:(NSString*)operatorText];
}

-(void)operation:(id)sender
{
	// if editing a number then end editing it and perform the last operation (which should default to addition).
	if (enteringNumber)
	{
		[self endEditingNumber];
		[self performLastOperation];
		[displayField setStringValue: [displayedValue stringValue]];
	}

	[self setLastOperation: sender];
}

-(void)equals:(id)sender
{
    if (enteringNumber)
	{
        [self endEditingNumber];
        [self performLastOperation];
        lastOperation = None;
        [displayField setStringValue: [displayedValue stringValue]];
		[operatorField setStringValue: @""];
	}
}

-(void)insertDigit:(id)sender
{
	NSString* oldValue;
	
	if (!enteringNumber)
	{
		[self beginEditingNumber];
		[displayField setStringValue:[sender title]];
	}
	else
	{
		oldValue = [displayField stringValue];
		[displayField setStringValue:[oldValue stringByAppendingString:[sender title]]];
	}
}

-(void)decimalPoint:(id)sender
{
	NSString* oldValue;
	
    if (!usedDecimalPoint)
	{
        usedDecimalPoint = YES;
		if (!enteringNumber)
		{
			[self beginEditingNumber];
			[displayField setStringValue:@"0."];
		}
		else
		{
			oldValue = [displayField stringValue];
			[displayField setStringValue:[oldValue stringByAppendingString:@"."]];
		}
	}
}

-(void)toggleSign:(id)sender
{
	NSString* oldValue;
	if (!enteringNumber)
	{
		[self beginEditingNumber];
		[displayField setStringValue:@"-0"];
	}
	else
	{
		oldValue = [displayField stringValue];
		[displayField setStringValue:[@"-" stringByAppendingString: oldValue]];
	}
}

-(void)beginEditingNumber
{
    enteringNumber = YES;
    usedDecimalPoint = NO;
    [displayField setStringValue: @""];
    [enteredValue autorelease];
    enteredValue = [displayedValue copy]; 
}

-(void)endEditingNumber
{
	enteringNumber = NO;
    usedDecimalPoint = NO;
	
    [displayedValue autorelease];
    displayedValue = [NSDecimalNumber decimalNumberWithString: [displayField stringValue]];
    [displayedValue retain];
}

-(void)performLastOperation
{
    if (lastOperation == None)
	{
        return;
	}
	
    [displayedValue autorelease];
	
	if (lastOperation == Add)
	{
    	displayedValue = [enteredValue decimalNumberByAdding: displayedValue];
	}
    else if (lastOperation == Subtract)
	{
        displayedValue = [enteredValue decimalNumberBySubtracting: displayedValue];
	}
    else if (lastOperation == Multiply)
	{
        displayedValue = [enteredValue decimalNumberByMultiplyingBy: displayedValue];
	}
    else if (lastOperation == Divide)
	{
        if ([displayedValue compare: [NSDecimalNumber zero]] != NSOrderedSame)
		{
            displayedValue = [enteredValue decimalNumberByDividingBy: displayedValue];
		}
        else
		{
            displayedValue = [[NSDecimalNumber notANumber] retain];
		}
	}
	
	[displayedValue retain];
}

@end
