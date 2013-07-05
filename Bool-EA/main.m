//
//  main.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAOptimizer.h"
#import "EAFunctionF1.h"
#import "EAFunctionF2.h"
#import "EAIndividual.h"
#import "EAUniformCrossover.h"
#import "EANPointCrossover.h"
#import "EAStandardMutator.h"
#import "EAOneBitMutator.h"

const NSUInteger kNumberOfTrails = 100;

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        EAOptimizer* optimizer = [EAOptimizer new];


        optimizer.function = [EAFunctionF1 new];
        {
            EANPointCrossover* c = [EANPointCrossover new];
            c.numberOfCrossovers = 2;
            optimizer.crossover = c;
        }

        {
            EAStandardMutator* m = [EAStandardMutator new];
            m.probability = 0.5;
            optimizer.mutator = m;
        }

        optimizer.numberOfParents = 32;
        optimizer.numberOfChildren = 16;

        for (NSNumber* numberOfGenes in @[@5, @10, @20, @40, @80]) {
            [EAIndividual setNumberOfGenes:[numberOfGenes unsignedIntegerValue]];

            NSMutableArray* evals = [NSMutableArray arrayWithCapacity:kNumberOfTrails];

            for (NSUInteger i = 0; i < kNumberOfTrails; i++) {
                srand(10+(int)i);
                [optimizer run];

                [evals addObject:@(optimizer.function.numberOfEvals)];
            }
            
            [evals sortUsingSelector:@selector(compare:)];

            printf("%i\t%i\t%i\t%i\t%i\t%i\n", [numberOfGenes intValue], [evals[0] intValue], [evals[evals.count/4]
                   intValue], [evals[evals.count/2]  intValue], [evals[3*evals.count/4] intValue], [[evals lastObject] intValue]);
        }
    }
    return 0;
}

