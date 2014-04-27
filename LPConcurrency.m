//
//  LPConcurrency.m
//  Lunarpad
//
//  Created by Paul Shapiro.
//  Copyright (c) 2014 Lunarpad. All rights reserved.
//

#import "LPConcurrency.h"

@implementation LPConcurrency

+ (void)performBlockOnMainQueue:(void(^)(void))block
{
    dispatch_async(dispatch_get_main_queue(), block);
}

+ (void)performBlockOnMainQueueSynchronously:(void(^)(void))block
{
    dispatch_sync(dispatch_get_main_queue(), block);
}

+ (void)performBlockOnMainQueue:(void(^)(void))block afterDelay:(NSTimeInterval)delay
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

+ (void)performBlockInBackground:(void(^)(void))block
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, block);
}

+ (void)performBlockSynchronously:(void(^)(void))block
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, block);
}

+ (void)performBlockSynchronouslyOnMainQueue:(void(^)(void))block
{
    dispatch_sync(dispatch_get_main_queue(), block);
}

@end
