//
//  LPConcurrency.h
//  Lunarpad
//
//  Created by Paul Shapiro.
//  Copyright (c) 2014 Lunarpad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LPConcurrency : NSObject

+ (void)performBlockOnMainQueue:(void(^)(void))block; // async
+ (void)performBlockOnMainQueueSynchronously:(void(^)(void))block; // sync
+ (void)performBlockOnMainQueue:(void(^)(void))block afterDelay:(NSTimeInterval)delay;

+ (void)performBlockInBackground:(void(^)(void))block;

+ (void)performBlockSynchronously:(void(^)(void))block;
+ (void)performBlockSynchronouslyOnMainQueue:(void(^)(void))block;

@end
