//
//  EAIndividual.m
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import "EAIndividual.h"

static NSUInteger numberOfGenes = 5;

@implementation EAIndividual

+ (NSUInteger) numberOfGenes
{
    return numberOfGenes;
}

+ (void) setNumberOfGenes:(NSUInteger)n
{
    numberOfGenes = n;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSMutableArray* genes = [[NSMutableArray alloc] initWithCapacity:[[self class] numberOfGenes]];
        
        for (NSUInteger i = 0; i < [[self class] numberOfGenes]; i++) {
            [genes addObject:@(rand() % 2 == 1 ? YES : NO)];
        }

        self.genes = genes;

        [self addObserver:self
               forKeyPath:@"genes"
                  options:0
                  context:NULL];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self
              forKeyPath:@"genes"];
}

- (id)copyWithZone:(NSZone *)zone
{
    EAIndividual* indv = [[self class] new];

    indv.genes = [self genes];
    indv.value = [self value];

    return indv;
}

- (NSString *)description
{
    NSMutableString* description = [NSMutableString string];

    [description appendFormat:@"<%@: %p> ", NSStringFromClass([self class]), self];

    for (NSNumber* gen in self.genes) {
        [description appendString:[gen boolValue] ? @"1" : @"0"];
    }

    return description;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"genes"]) {
        self.value = nil;
    }
}

@end
