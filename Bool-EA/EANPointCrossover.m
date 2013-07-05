//
//  EANPointCrossover.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EANPointCrossover.h"

@implementation EANPointCrossover

-(void)crossover:(EAIndividual *)individualA with:(EAIndividual *)individualB
{
    for (NSUInteger i = 0; i < self.numberOfCrossovers; i++) {
        [self crossover:individualA
                   with:individualB
                atIndex:rand() % individualA.genes.count];
    }
}

- (void) crossover:(EAIndividual *)individualA with:(EAIndividual *)individualB atIndex:(NSUInteger)idx
{
    NSArray* genesA;
    NSArray* genesB;

    genesA = [[individualA.genes subarrayWithRange:NSMakeRange(0, idx)] arrayByAddingObjectsFromArray:[individualB.genes subarrayWithRange:NSMakeRange(idx, individualB.genes.count - idx)]];
    genesB = [[individualB.genes subarrayWithRange:NSMakeRange(0, idx)] arrayByAddingObjectsFromArray:[individualA.genes subarrayWithRange:NSMakeRange(idx, individualA.genes.count - idx)]];

    individualA.genes = genesA;
    individualB.genes = genesB;
}

@end
