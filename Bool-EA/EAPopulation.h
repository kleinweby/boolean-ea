//
//  EAPopulation.h
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EAIndividual;
@protocol EAMutator;
@protocol EAFunction;
@protocol EACrossover;

@interface EAPopulation : NSObject

- (instancetype) initWithNumberOfIndividuals:(NSUInteger)n andFunction:(id<EAFunction>)function;

@property (nonatomic, strong, readonly) id<EAFunction> function;
@property (nonatomic, copy, readonly) NSSet* individuals;
@property (nonatomic, strong, readonly) EAIndividual* bestIndividual;

- (void) generateChildren:(NSUInteger)numberOfChrildren usingMutator:(id<EAMutator>)mutator;

// Does one crossover
- (void) manipulateUsingCrossover:(id<EACrossover>)crossover;

- (void) recalculateValues;

- (void) selectBest:(NSUInteger)numberOfBest;

@end
