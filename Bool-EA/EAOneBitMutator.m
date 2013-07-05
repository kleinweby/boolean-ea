//
//  EAOneBitMutator.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAOneBitMutator.h"

@implementation EAOneBitMutator

- (void)mutate:(EAIndividual *)indiv
{
    NSMutableArray* genes = [indiv.genes mutableCopy];
    NSUInteger idx = rand() % genes.count;

    genes[idx] = @(![genes[idx] boolValue]);

    indiv.genes = genes;
}

@end
