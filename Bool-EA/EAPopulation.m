//
//  EAPopulation.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAPopulation.h"
#import "EAFunction.h"
#import "EAIndividual.h"
#import "EAMutator.h"
#import "EACrossover.h"

@interface EAPopulation ()

@property (nonatomic, strong) id<EAFunction> function;
@property (nonatomic, copy) NSSet* individuals;
@property (nonatomic, strong) EAIndividual* bestIndividual;

@end

@implementation EAPopulation

- (instancetype) initWithNumberOfIndividuals:(NSUInteger)n andFunction:(id<EAFunction>)function
{
    self = [super init];

    if (self) {
        NSMutableSet* set = [NSMutableSet setWithCapacity:n];

        for (NSUInteger i = 0; i < n; i++) {
            [set addObject:[EAIndividual new]];
        }

        self.individuals = set;
        self.function = function;
    }

    return self;
}

- (void) generateChildren:(NSUInteger)numberOfChrildren usingMutator:(id<EAMutator>)mutator
{
    NSArray* indivs = [self.individuals allObjects];

    for (NSUInteger i = 0; i < numberOfChrildren; i++) {
        EAIndividual* indiv = [indivs[rand() % indivs.count] copy];

        [mutator mutate:indiv];
        self.individuals = [self.individuals setByAddingObject:indiv];
    }
}

// Does one crossover
- (void) manipulateUsingCrossover:(id<EACrossover>)crossover
{
    NSArray* indivs = [self.individuals allObjects];

    [crossover crossover:indivs[rand() % self.individuals.count]
                    with:indivs[rand() % self.individuals.count]];
}

- (void) recalculateValues
{
    for (EAIndividual* indv in self.individuals) {
        if (!indv.value)
            indv.value = [self.function eval:indv];
    }
}

- (void) selectBest:(NSUInteger)numberOfBest
{
    NSArray* indivs = [self.individuals allObjects];

    indivs = [indivs sortedArrayUsingComparator:^NSComparisonResult(EAIndividual* obj1, EAIndividual* obj2) {
        NSComparisonResult result = [obj1.value compare:obj2.value];
        if (result == NSOrderedAscending)
            return NSOrderedDescending;
        else if (result == NSOrderedDescending)
            return NSOrderedAscending;
        return NSOrderedSame;
    }];

    indivs = [indivs subarrayWithRange:NSMakeRange(0, numberOfBest)];

    self.bestIndividual = indivs[0];
    self.individuals = [NSSet setWithArray:indivs];
}

@end
