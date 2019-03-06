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
#import "RCTAppleHealthKit+TypesAndPermissions.h"
#import "RCTAppleHealthkit+Oberver_Queries.h"
#import "RCTAppleHealthKit+Queries.h"

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTLog.h>
#import <React/RCTAsyncLocalStorage.h>

@implementation RCTAppleHealthKit (Observer_Queries)

- (void)observers_initializeEventObserverForType:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    NSString *observerKey = [input objectForKey:@"type"];
    NSDictionary *readPermDict = [self readPermsDict];
    HKObjectType *observerType = [readPermDict objectForKey:observerKey];
    
    RCTLogInfo(@"initiated observer for %@", observerKey);
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
             NSLog(@"*** An error occured while setting up the %@ observer. %@ ***", observerKey, error.localizedDescription);
             callback(@[RCTMakeError(@"An error occured while setting up the observer query", error, nil)]);
             return;
         }
         
         [self fetchMostRecentQuantitySampleOfType:observerType predicate:nil completion:^(HKQuantity *mostRecentQuantity, NSDate *startDate, NSDate *endDate, NSError *error) {
             RCTLogInfo(@"Quantity: %@, start: %@, end: %@, error: %@", mostRecentQuantity, startDate, endDate, error);
             [self.bridge.eventDispatcher sendAppEventWithName:@"change:observed"
                                                          body:@{
                                                                 @"name": @"change:observed",
                                                                 @"type": observerKey,
                                                                 @"quantity": mostRecentQuantity,
//                                                                 @"start": startDate,
//                                                                 @"end": endDate,
//                                                                 @"error": error
                                                                 }];
         }];
         
         
         // If you have subscribed for background updates you must call the completion handler here.
         completionHandler();
         
     }];
    
    [self.healthStore executeQuery:query];
    [self.healthStore enableBackgroundDeliveryForType:observerType frequency:HKUpdateFrequencyImmediate withCompletion:^void (BOOL success, NSError* error) {
        if (success){
            RCTLogInfo(@"HKObserverQueries initialized");
        } else {
            RCTLogInfo(@"HKObserverQuery init failed");
            RCTLogInfo(success ? @"true" : @"false $@", error);
        }
    }];
}

@end
