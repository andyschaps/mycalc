//
//  MathProcessor.h
//  MyCalc
//
//  Created by Andy Schaps on 11/12/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface MathProcessor : NSObject {
	float currentTotal;
	float modifierValue;
}

@property(readwrite) float currentTotal, modifierValue;
		
- (float)applyOperation;	

@end
