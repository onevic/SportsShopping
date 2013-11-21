//
//  UIView+Position.m
//  36Kr
//
//  Created by scott on 13-11-16.
//  Copyright (c) 2013年 scott. All rights reserved.
//

#import "UIView+Position.h"

@implementation UIView (Position)
- (float)top
{
    return self.frame.origin.y;
}
- (float)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (float)left
{
    return self.frame.origin.x;
}
- (float)right
{
    return self.frame.origin.x + self.frame.size.width;
}
- (float)width
{
    return self.frame.size.width;
}
- (float)height
{
    return self.frame.size.height;
}
@end
