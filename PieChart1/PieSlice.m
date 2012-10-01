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
    NSMutableData *normalData;
}

@synthesize degreesToRotate, color;

- (id)initWithPercentage:(float)_percentage{
    if (self = [super init]) {
        numVertices = _percentage * 360 + 2;
        [self setup];
    }
    return self;
}

- (GLKVector3*)vertices{
    if (!vertexData) {
        //we allocate the appropriate amount of bytes to hold all vertices
        vertexData = [NSMutableData dataWithLength:sizeof(GLKVector3) * numVertices];
    }
    return [vertexData mutableBytes];
}

- (GLKVector3*)normals{
    if (!normalData) {
        //same as vertices but for normals
        normalData = [NSMutableData dataWithLength:sizeof(GLKVector3) * numVertices];
    }
    return [normalData mutableBytes];
}

//setup the triangles and normals for our slice
- (void)setup{
    radius = 1;
    
    GLKVector3 center = GLKVector3Make(0, 0, 0);
    self.vertices[0] = center;
    
    //set the normal for the center here
    self.normals[0] = GLKVector3Make(0, 0, 1);
    
    for (int i = 0; i < numVertices; i++) {
        float x = radius * cosf(DEGREES_TO_RADIANS(i));
        float y = radius * sinf(DEGREES_TO_RADIANS(i));
        GLKVector3 vector = GLKVector3Make(x, y, 0);
        
        //we use i + 1 since index 0 holds the center
        self.vertices[i + 1] = vector;
        
        //the normal for all vertices for this flat face will be (0, 0, 1)
        self.normals[i + 1] = GLKVector3Make(0, 0, 1);
    }
}

- (void)renderInScene:(PieScene*)scene{
    
    //enable position attribute, needed for shader
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, self.vertices);
    
    //enable normal attribute, needed for shader
    glEnableVertexAttribArray(GLKVertexAttribNormal);
    glVertexAttribPointer(GLKVertexAttribNormal, 3, GL_FLOAT, GL_FALSE, 0, self.normals);
    
    //set the light's diffuseColor to this slice's color
    scene.effect.light0.diffuseColor = self.color;
    
    //keep a copy of the current modelViewMatrix so we can push it back on the stack later
    GLKMatrix4 currentModelViewMatrix = scene.effect.transform.modelviewMatrix;
    
    //lets rotate our slice here
    scene.effect.transform.modelviewMatrix = GLKMatrix4Rotate(currentModelViewMatrix, DEGREES_TO_RADIANS(self.degreesToRotate), 0, 0, 1);
    
    //need to call prepareToDraw every time something changes in OpenGL land
    [scene.effect prepareToDraw];
    
    glDrawArrays(GL_TRIANGLE_FAN, 0, numVertices);
    
    //"push" the previous modelViewMatrix back on top
    scene.effect.transform.modelviewMatrix = currentModelViewMatrix;
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisableVertexAttribArray(GLKVertexAttribNormal);
}

@end
