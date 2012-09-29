//
//  PieSlice.h
//  PieChart1
//
//  Created by Brian Voong on 9/28/12.
//  Copyright (c) 2012 Brian Voong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PieScene.h"

@interface PieSlice : NSObject

- (id)initWithPercentage:(float)_percentage;

- (void)renderInScene:(PieScene*)scene;

@end
