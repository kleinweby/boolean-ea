//
//  EAUniformCrossover.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAUniformCrossover.h"

@implementation EAUniformCrossover

- (void)crossover:(EAIndividual *)individualA with:(EAIndividual *)individualB
{
    NSMutableArray* genesA = [individualA.genes mutableCopy];
    NSMutableArray* genesB = [individualB.genes mutableCopy];

    for (NSUInteger i = 0; i < genesA.count; i++) {
        if ((float)rand()/(float)RAND_MAX > self.probability) {
            NSNumber* temp = genesA[i];
            genesA[i] = genesB[i];
            genesB[i] = temp;
        }
    }

    individualA.genes = genesA;
    individualB.genes = genesB;
}

@end
