//
//  EAStandardMutation.h
//  Bool-EA
//
//  Created by Christian Speich on 02.07.13.
//  Copyright (c) 2013 Christian Speich. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAMutator.h"

@interface EAStandardMutator : NSObject<EAMutator>

@property (nonatomic, assign) CGFloat probability;

@end
