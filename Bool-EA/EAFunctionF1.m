//
//  EAFunctionF1.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAFunctionF1.h"
#import "EAIndividual.h"

@interface EAFunctionF1 ()

@property (nonatomic, assign) NSUInteger numberOfEvals;

@end

@implementation EAFunctionF1

- (void) resetNumberOfEvals
{
    self.numberOfEvals = 0;
}

- (NSNumber*)eval:(EAIndividual*)individual
{
    self.numberOfEvals++;
    
    double value = 0;

    for (NSNumber* gen in individual.genes) {
        value += [gen doubleValue];
    }

    return @(value);
}

+ (NSNumber*)optimalValue
{
    return @([EAIndividual numberOfGenes]);
}

@end
