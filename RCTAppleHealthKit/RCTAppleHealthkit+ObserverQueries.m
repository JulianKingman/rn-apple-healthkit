//
//  RCTAppleHealthKit+ObserverQueries.m
//  RCTAppleHealthKit
//
//  Created by Julian Kingman on 2018-11-27.
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RCTAppleHealthKit+Methods_Fitness.h"
#import "RCTAppleHealthKit+Queries.h"
#import "RCTAppleHealthKit+Utils.h"

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>

@implementation RCTAppleHealthKit (Observer_Queries)

- (void)observers_initializeEventObserverForType:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSString *observerKey = [input objectForKey:type];
    NSDictionary *readPermDict = [self readPermsDict];
    HKObjectType *observerType = [readPermDict objectForKey:optionKey];

    // HKSampleType *sampleType =
    // [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    // left off here

    HKObserverQuery *query =
    [[HKObserverQuery alloc]
     initWithSampleType:observerType
     predicate:nil
     updateHandler:^(HKObserverQuery *query,
                     HKObserverQueryCompletionHandler completionHandler,
                     NSError *error) {

         if (error) {
             // Perform Proper Error Handling Here...
             NSLog(@"*** An error occured while setting up the stepCount observer. %@ ***", error.localizedDescription);
             callback(@[RCTMakeError(@"An error occured while setting up the stepCount observer", error, nil)]);
             return;
         }

          [self.bridge.eventDispatcher sendAppEventWithName:@"change:steps"
                                                       body:@{@"name": @"change:steps"}];

         // If you have subscribed for background updates you must call the completion handler here.
         completionHandler();

     }];

    [self.healthStore executeQuery:query];
    [self.healthStore enableBackgroundDeliveryForType:observerType frequency:HKUpdateFrequencyImmediate withCompletion:^(BOOL success, NSError *error) {callback(success, error)}];
}

@end
