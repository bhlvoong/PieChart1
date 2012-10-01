//
//  PieSlice.h
//  PieChart1
//
//  Created by Brian Voong on 9/28/12.
//  Copyright (c) 2012 Brian Voong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PieScene.h"

@interface PieSlice : NSObject {
    //we'll rotate using a transformation matrix and then draw our slice
    int degreesToRotate;
    
    //color we will use for light's diffuse color
    GLKVector4 color;
}

@property int degreesToRotate;
@property GLKVector4 color;

- (id)initWithPercentage:(float)_percentage;

- (void)renderInScene:(PieScene*)scene;

@end
