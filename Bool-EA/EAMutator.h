//
//  EAMutator.h
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAIndividual.h"

@protocol EAMutator <NSObject>

- (void) mutate:(EAIndividual*)indiv;

@end
