//
//  EAOptimizer.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAOptimizer.h"
#import "EAPopulation.h"

@interface EAOptimizer ()

@property (nonatomic, strong) EAIndividual* bestIndividual;

@end

@implementation EAOptimizer

- (void) run
{
    [self.function resetNumberOfEvals];
    
    EAPopulation* population = [[EAPopulation alloc] initWithNumberOfIndividuals:self.numberOfParents
                                                                     andFunction:self.function];

    while (![population.bestIndividual.value isEqual:[[self.function class] optimalValue]] &&
           self.function.numberOfEvals < 1000) {
        [population generateChildren:self.numberOfChildren
                        usingMutator:self.mutator];

        for (NSUInteger i = 0; i < self.numberOfChildren; i++)
            [population manipulateUsingCrossover:self.crossover];

        [population recalculateValues];

        [population selectBest:self.numberOfParents];
    }

    self.bestIndividual = population.bestIndividual;
}

@end
