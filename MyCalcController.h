//
//  MyCalcController.h
//  MyCalc
//
//  Created by Andy Schaps on 11/23/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum Operation {
	None,
	Add,
	Subtract,
	Multiply,
	Divide
};

@interface MyCalcController : NSObject {
	IBOutlet NSTextField *displayField;
	IBOutlet NSTextField *operatorField;
	//MathProcessor *processor;

	BOOL usedDecimalPoint;
	NSDecimalNumber* displayedValue;
	NSDecimalNumber* enteredValue;
	SEL nextOperation;
	int lastOperation;
}

-(void)clear:(id)sender;
-(void)operation:(id)sender;
-(void)equals:(id)sender;
-(void)insertDigit:(id)sender;
-(void)decimalPoint:(id)sender;
-(void)toggleSign:(id)sender;
-(void)calculate;
		
-(void)awakeFromNib;
-(void)dealloc;

@end
