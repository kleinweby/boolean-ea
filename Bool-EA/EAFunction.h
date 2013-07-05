//
//  EAFunction.h
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EAIndividual;

@protocol EAFunction <NSObject>

@property (nonatomic, readonly) NSUInteger numberOfEvals;
- (void) resetNumberOfEvals;

- (NSNumber*) eval:(EAIndividual*)individual;
+ (NSNumber*) optimalValue;

@end
