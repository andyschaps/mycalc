//
//  MathProcessor.h
//  MyCalc
//
//  Created by Andy Schaps on 11/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef enum tagOperation	
	{
		NONE = 0,
		Addition = 1,
		Subtraction = 2,
		Multiplication = 3,
		Division = 4
	} Operation;


@interface MathProcessor : NSObject {
	NSDecimalNumber* currentTotal;
	NSDecimalNumber* modifierValue;
	bool decimalPressed;
	bool lastDigitWasZero;
	Operation operationValue;
}

@property(readwrite, retain) NSDecimalNumber* currentTotal;
@property(readwrite, retain) NSDecimalNumber* modifierValue;
@property(readwrite) Operation operationValue;
@property(readwrite) bool decimalPressed;
@property(readwrite) bool lastDigitWasZero;
		
- (NSDecimalNumber*)applyOperation;
- (id) init;

@end
