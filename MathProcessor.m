//
//  MathProcessor.m
//  MyCalc
//
//  Created by Andy Schaps on 11/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "MathProcessor.h"

@implementation MathProcessor
@synthesize currentTotal, modifierValue;
@synthesize operationValue;

- (float)applyOperation {
	self.currentTotal = self.currentTotal + self.modifierValue;
	return self.currentTotal;
}

@end
