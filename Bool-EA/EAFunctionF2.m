//
//  EAFunctionF2.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAFunctionF2.h"
#import "EAFunctionF1.h"
#import "EAIndividual.h"

@interface EAFunctionF2 ()

@property (nonatomic, assign) NSUInteger numberOfEvals;

@end

@implementation EAFunctionF2

- (void) resetNumberOfEvals
{
    self.numberOfEvals = 0;
}

- (NSNumber*)eval:(EAIndividual *)individual
{
    self.numberOfEvals++;
    
    double value = [[[EAFunctionF1 new] eval:individual] doubleValue];

    if (value > 0.0) {
        return @(value * 2.0);
    }
    else {
        return @(2*[EAIndividual numberOfGenes] - 1);
    }
}

+ (NSNumber*)optimalValue
{
    NSNumber* value = [EAFunctionF1 optimalValue];

    if ([value doubleValue] > 0.0) {
        return @([value doubleValue] * 2.0);
    }
    else {
        return @(2*[EAIndividual numberOfGenes] - 1);
    }
}

@end
