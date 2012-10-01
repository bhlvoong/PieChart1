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
    //Declare array to hold all our slices
    NSMutableArray *pieSlices;
}

@synthesize effect;

- (id)initWithEffect:(GLKBaseEffect*)baseEffect{
    if (self = [super init]) {
        
        effect = baseEffect;
        
        //initialize our pieSlices array
        pieSlices = [[NSMutableArray alloc] init];
        
        //red slice
        PieSlice *redSlice = [[PieSlice alloc] initWithPercentage:0.25];
        redSlice.degreesToRotate = 0;
        redSlice.color = GLKVector4Make(1, 0, 0, 1);
        [pieSlices addObject:redSlice];
        
        //green slice
        PieSlice *greenSlice = [[PieSlice alloc] initWithPercentage:0.25];
        greenSlice.degreesToRotate = 90;
        greenSlice.color = GLKVector4Make(0, 1, 0, 1);
        [pieSlices addObject:greenSlice];
        
        //blue slice
        PieSlice *blueSlice = [[PieSlice alloc] initWithPercentage:0.5];
        blueSlice.degreesToRotate = 180;
        blueSlice.color = GLKVector4Make(0, 0, 1, 1);
        [pieSlices addObject:blueSlice];
        
    }
    return self;
}

- (void)render{
    for (PieSlice *pieSlice in pieSlices) {
        [pieSlice renderInScene:self];
    }
}

@end
