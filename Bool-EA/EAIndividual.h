//
//  EAIndividual.h
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EAIndividual : NSObject<NSCopying>

+ (NSUInteger) numberOfGenes;
+ (void) setNumberOfGenes:(NSUInteger)n;

- (id) init;

@property (copy, nonatomic) NSArray* genes;
@property (copy, nonatomic) NSNumber* value;

@end
