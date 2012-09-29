//
//  PieSlice.m
//  PieChart1
//
//  Created by Brian Voong on 9/28/12.
//  Copyright (c) 2012 Brian Voong. All rights reserved.
//

#import "PieSlice.h"

#define PI 3.141592
#define DEGREES_TO_RADIANS(degrees) degrees * PI / 180

@implementation PieSlice {
    float radius;
    int numVertices;
    NSMutableData *vertexData;
}

- (id)initWithPercentage:(float)_percentage{
    if (self = [super init]) {
        numVertices = _percentage * 360 + 2;
        [self setup];
    }
    return self;
}

- (GLKVector3*)vertices{
    if (!vertexData) {
        //the amount of vertices we need will be percentage + 1 for the center of our fan
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector3) * numVertices];
    }
    return [vertexData mutableBytes];
}

//setup the triangles for our slice
- (void)setup{
    radius = 1;
    
    GLKVector3 center = GLKVector3Make(0, 0, 0);
    self.vertices[0] = center;
    for (int i = 0; i < numVertices; i++) {
        float x = radius * cosf(DEGREES_TO_RADIANS(i));
        float y = radius * sinf(DEGREES_TO_RADIANS(i));
        GLKVector3 vector = GLKVector3Make(x, y, 0);
        self.vertices[i + 1] = vector;
    }
}

- (void)renderInScene:(PieScene*)scene{
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, self.vertices);
    
    [scene.effect prepareToDraw];
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, numVertices);
}

@end
