//
//  MathProcessor.m
//  MyCalc
//
//  Created by Andy Schaps on 11/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "MathProcessor.h"

@implementation MathProcessor
@synthesize currentTotal, modifierValue, operationValue;

- (id) init {
    if (self = [super init]) {
        currentTotal = [[NSDecimalNumber alloc] initWithInt:0];
        modifierValue = [[NSDecimalNumber alloc] initWithInt:0];
    }
    return self;
	
}

- (NSDecimalNumber*)applyOperation {
	[currentTotal decimalNumberByAdding:modifierValue];
	return currentTotal;
}

@end
