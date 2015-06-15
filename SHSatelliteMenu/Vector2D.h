//
//  Vector2D.h
//  SHSatelliteMenu
//
//  Created by 7heaven on 15/6/15.
//  Copyright (c) 2015年 sevenheaven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Vector2D : NSObject

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;

@property (nonatomic) CGFloat length;
@property (nonatomic) CGFloat angle;

- (instancetype) initWithX:(CGFloat) x y:(CGFloat) y;

- (CGFloat) getLengthSQ;
- (CGFloat) dot:(Vector2D *) v;
- (CGFloat) dist:(Vector2D *) v;
- (CGFloat) distSQ:(Vector2D *) v;

- (instancetype) zero;
- (instancetype) copy:(Vector2D *) v;
- (instancetype) normal;

- (instancetype) limit:(CGFloat) max;

- (instancetype) add:(Vector2D *) v;
- (instancetype) subtract:(Vector2D *) v;
- (instancetype) multiply:(CGFloat) value;
- (instancetype) divide:(CGFloat) value;

- (instancetype) getPerpLeft;
- (instancetype) getPerpRight;

+ (CGFloat) angleBetweenV1:(Vector2D *) v1 v2:(Vector2D *) v2;
+ (instancetype) addWithV1:(Vector2D *) v1 v2:(Vector2D *) v2;
+ (instancetype) subtractWithV1:(Vector2D *) v1 v2:(Vector2D *) v2;

@end
