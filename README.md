# Concurrency

## Description

Objective-C utility methods for performing Grand Central Dispatch (GCD) concurrency operations, like context switching.

## Installation

Simply plop this repo into your project, and you should be good to go.

## Available methods in `LPConcurrency`

    + (void)performBlockOnMainQueue:(void(^)(void))block; // async
    + (void)performBlockOnMainQueueSynchronously:(void(^)(void))block; // sync
    + (void)performBlockOnMainQueue:(void(^)(void))block afterDelay:(NSTimeInterval)delay;

    + (void)performBlockInBackground:(void(^)(void))block;

    + (void)performBlockSynchronously:(void(^)(void))block;
    + (void)performBlockSynchronouslyOnMainQueue:(void(^)(void))block;
    
### Example internal implementation

    + (void)performBlockOnMainQueue:(void(^)(void))block afterDelay:(NSTimeInterval)delay
    {
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), block);
    }
