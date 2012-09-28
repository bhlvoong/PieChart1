//
//  Shader.fsh
//  PieChart1
//
//  Created by Brian Voong on 9/28/12.
//  Copyright (c) 2012 Brian Voong. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
