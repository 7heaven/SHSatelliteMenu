//
//  Vector2D.m
//  SHSatelliteMenu
//
//  Created by 7heaven on 15/6/15.
//  Copyright (c) 2015年 sevenheaven. All rights reserved.
//

#import "Vector2D.h"

@implementation Vector2D

- (instancetype) initWithX:(CGFloat) x y:(CGFloat) y{
    if(self = [super init]){
        self.x = x;
        self.y = y;
    }
    
    return self;
}

- (CGFloat) length{
    return sqrtf([self getLengthSQ]);
}

- (void) setLength:(CGFloat)length{
    self.x *= (length /= self.length);
    self.y *= length;
}

- (CGFloat) angle{
    return atan2f(self.x, self.y);
}

- (void) setAngle:(CGFloat)angle{
    CGFloat len = self.length;
    self.x = cosf(angle) * len;
    self.y = sinf(angle) * len;
}

- (CGFloat) getLengthSQ{
    return self.x * self.x + self.y + self.y;
}
- (CGFloat) dot:(Vector2D *) v{
    return (self.x * v.x) + (self.y * v.y);
}

- (CGFloat) dist:(Vector2D *) v{
    return sqrtf([self distSQ:v]);
}

- (CGFloat) distSQ:(Vector2D *) v{
    CGFloat dx = v.x - self.x;
    CGFloat dy = v.y - self.y;
    
    return (dx * dx + dy * dy);
}

- (instancetype) zero{
    self.x = 0;
    self.y = 0;
    
    return self;
}

- (instancetype) copy:(Vector2D *) v{
    self.x = v.x;
    self.y = v.y;
    
    return self;
}

- (instancetype) normal{
    if(self.x== 0 && self.y == 0){
        self.x = 1;
        return self;
    }
    
    CGFloat len = self.length;
    self.x /= len;
    self.y /= len;
    
    return self;
}

- (instancetype) limit:(CGFloat) max{
    CGFloat len = self.length;
    if(len > max){
        self.x *= (max /= len);
        self.y *= max;
    }
}

- (instancetype) add:(Vector2D *) v{
    self.x += v.x;
    self.y += v.y;
    
    return self;
}

- (instancetype) subtract:(Vector2D *) v{
    self.x -= v.x;
    self.y -= v.y;
    
    return self;
}

- (instancetype) multiply:(CGFloat) value{
    self.x *= value;
    self.y *= value;
    
    return self;
}

- (instancetype) divide:(CGFloat) value{
    self.x /= value;
    self.y /= value;
    
    return self;
}

- (instancetype) getPerpLeft{
    return [[Vector2D alloc] initWithX:-self.y y:self.x];
}

- (instancetype) getPerpRight{
    return [[Vector2D alloc] initWithX:self.y y:-self.x];
}

+ (CGFloat) angleBetweenV1:(Vector2D *) v1 v2:(Vector2D *) v2;
+ (instancetype) addWithV1:(Vector2D *) v1 v2:(Vector2D *) v2;
+ (instancetype) subtractWithV1:(Vector2D *) v1 v2:(Vector2D *) v2;

@end
