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
	Operation* operationValue;
}

@property(readwrite) NSDecimalNumber* currentTotal;
@property(readwrite) NSDecimalNumber* modifierValue;
@property(readwrite) Operation* operationValue;
		
- (NSDecimalNumber*)applyOperation;
- (id) init;

@end
