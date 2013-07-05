//
//  EAOptimizer.h
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAFunction.h"
#import "EACrossover.h"
#import "EAMutator.h"

@interface EAOptimizer : NSObject

@property (nonatomic, strong) id<EAFunction> function;
@property (nonatomic, strong) id<EAMutator> mutator;
@property (nonatomic, strong) id<EACrossover> crossover;
@property (nonatomic, assign) NSUInteger numberOfParents;
@property (nonatomic, assign) NSUInteger numberOfChildren;

- (void) run;

// Result variables
@property (nonatomic, strong, readonly) EAIndividual* bestIndividual;

@end
