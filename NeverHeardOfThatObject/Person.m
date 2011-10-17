//
//  Person.m
//  NeverHeardOfThatObject
//
//  Created by Peter Hosey on 2011-10-17.
//  Copyright (c) 2011 Peter Hosey. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name;

- (NSUInteger) hash {
	NSLog(@"%s called", __func__);
	return [self.name hash];
}

- (BOOL) isEqual:(id)other {
	NSLog(@"Testing whether %@ is equal to %@", self, other);
	NSString *otherName = nil;
	if ([other respondsToSelector:@selector(name)])
		otherName = [other name];
	else
		otherName = other;

	if (self.name == otherName)
		return YES;
	if (![otherName isKindOfClass:[NSString class]])
		return NO;

	return [self.name isEqualToString:otherName];
}

- (NSString *) description {
	return [NSString stringWithFormat:@"<%@ %p '%@'>", [self class], self, self.name];
}

@end
