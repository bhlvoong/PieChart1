//
//  PieScene.m
//  PieChart1
//
//  Created by Brian Voong on 9/28/12.
//  Copyright (c) 2012 Brian Voong. All rights reserved.
//

#import "PieScene.h"
#import "PieSlice.h"

@implementation PieScene {
    PieSlice *slice;
}

@synthesize effect;

- (id)initWithEffect:(GLKBaseEffect*)baseEffect{
    if (self = [super init]) {
        effect = baseEffect;
        slice = [[PieSlice alloc] initWithPercentage:0.75];
    }
    return self;
}

- (void)render{    
    [slice renderInScene:self];
}

@end
