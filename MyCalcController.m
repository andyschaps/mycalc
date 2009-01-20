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
	lastOperation = None;
	usedDecimalPoint = NO;
	[displayField setStringValue:[displayedValue stringValue]];
}

-(void)operation:(id)sender
{
	NSButton* b = (NSButton*)sender;
	NSString* operatorText = [b title];
	if ([operatorText isEqualToString:@"×"])
	{
		operatorText = @"*";
	}
	[operatorField setStringValue:(NSString*)operatorText];	
	
	lastOperation = [sender tag];
}

-(void)equals:(id)sender
{
	
}

-(void)insertDigit:(id)sender
{
	NSString* oldValue;
	oldValue = [displayField stringValue];
	if ([oldValue isEqualToString:@"0"])
	{
		[displayField setStringValue:[sender title]];
	}
	else
	{
		[displayField setStringValue: [oldValue stringByAppendingString: [sender title]]];
	}
}

-(void)decimalPoint:(id)sender
{
	NSString* oldValue;
	
    if (!usedDecimalPoint)
	{
        usedDecimalPoint = YES;
        if ([displayField stringValue] == @"0")
		{
            [displayField setStringValue: @"0."];
		}
        else
		{
            oldValue = [displayField stringValue];
			NSString* newValue = [oldValue stringByAppendingString:@"."];
            [displayField setStringValue:newValue];
		}
	}
}

-(void)toggleSign:(id)sender
{
	NSString* oldValue;
	oldValue = [displayField stringValue];
	if ([oldValue rangeOfString:@"-"].location == NSNotFound)
	{
		[displayField setStringValue: [@"-" stringByAppendingString:oldValue]];
	}
	else
	{
		[displayField setStringValue: [oldValue substringFromIndex:1]];
	}
}

-(void)calculate
{
	
}

@end
