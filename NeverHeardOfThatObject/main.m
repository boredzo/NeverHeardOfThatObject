//
//  main.m
//  NeverHeardOfThatObject
//
//  Created by Peter Hosey on 2011-10-17.
//  Copyright (c) 2011 Peter Hosey. All rights reserved.
//

#import "Person.h"
int main (int argc, char **argv) {
	@autoreleasepool {
		NSMutableArray *family = [NSMutableArray new];

		void (^addPersonWithName)(NSString *) = ^void(NSString *name) {
			Person *person = [Person new];
			person.name = name;
			[family addObject:person];
		};
		addPersonWithName(@"Fred");
		addPersonWithName(@"Wilma");
		addPersonWithName(@"Barney");
		addPersonWithName(@"Betty");

		//Person objects respond to isEqual: by comparing name, so this should find the relevant Person.
		NSUInteger idx = [family indexOfObject:@"Wilma"];
		NSLog(@"Wilma is at index %@", (idx != NSNotFound) ? [NSNumber numberWithUnsignedInteger:idx] : @"(not found)");
	}
	return EXIT_SUCCESS;
}
