//
//  EAStandardMutation.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAStandardMutator.h"

@implementation EAStandardMutator

- (void)mutate:(EAIndividual *)indiv
{
    NSMutableArray* genes = [NSMutableArray arrayWithCapacity:indiv.genes.count];

    for (NSNumber* gen in indiv.genes) {
        if ((float)rand()/(float)RAND_MAX > self.probability) {
            [genes addObject:@(![gen boolValue])];
        }
        else {
            [genes addObject:gen];
        }
    }

    indiv.genes = genes;
}

@end
