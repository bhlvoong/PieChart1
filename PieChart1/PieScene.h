//
//  PieScene.h
//  PieChart1
//
//  Created by Brian Voong on 9/28/12.
//  Copyright (c) 2012 Brian Voong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface PieScene : NSObject {
    GLKBaseEffect *effect;
}

@property (nonatomic, retain) GLKBaseEffect *effect;

- (id)initWithEffect:(GLKBaseEffect*)baseEffect;

- (void)render;

@end
