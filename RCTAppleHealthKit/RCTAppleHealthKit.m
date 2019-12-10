//
//  RCTAppleHealthKit.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-06-26.
//  Copyright © 2016 Greg Wilson. All rights reserved.
//

#import "RCTAppleHealthKit.h"
#import "RCTAppleHealthKit+TypesAndPermissions.h"
#import "RCTAppleHealthKit+Methods_Activity.h"
#import "RCTAppleHealthKit+Methods_Body.h"
#import "RCTAppleHealthKit+Methods_Fitness.h"
#import "RCTAppleHealthKit+Methods_Dietary.h"
#import "RCTAppleHealthKit+Methods_Characteristic.h"
#import "RCTAppleHealthKit+Methods_Vitals.h"
#import "RCTAppleHealthKit+Methods_Results.h"
#import "RCTAppleHealthKit+Methods_Sleep.h"
#import "RCTAppleHealthKit+Methods_Mindfulness.h"
#import "RCTAppleHealthkit+Oberver_Queries.h"
#import "RCTAppleHealthKit+Utils.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>
#import "AESCrypt.h"

@implementation RCTAppleHealthKit
@synthesize bridge = _bridge;

const int MAX_RECORDS = 500;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAvailable:(RCTResponseSenderBlock)callback)
{
    [self isHealthKitAvailable:callback];
}

// Persists the anchors from the previous call to HealthKit
RCT_EXPORT_METHOD(dropAnchors:(NSDictionary *)input
    callback:(RCTResponseSenderBlock)callback)
{
    [self dropHealthKitAnchors:input callback:callback];
}

// Clears all anchors for HealthKit
RCT_EXPORT_METHOD(clearAnchors:(NSDictionary *)input
    callback:(RCTResponseSenderBlock)callback)
{
    [self clearHealthKitAnchors:input callback:callback];
}

RCT_EXPORT_METHOD(readHealthDataByAnchor:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self readHealthKitData:input predicate:nil callback:callback];
}

RCT_EXPORT_METHOD(readHealthDataByDate:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self readHealthKitDataByDate:input callback:callback];
}

RCT_EXPORT_METHOD(clearHealthData:(RCTResponseSenderBlock)callback)
{
    [self clearHealthDataFromFile:callback];
}
//Over

RCT_EXPORT_METHOD(initHealthKit:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self initializeHealthKit:input callback:callback];
}

RCT_EXPORT_METHOD(initStepCountObserver:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_initializeStepEventObserver:input callback:callback];
}

RCT_EXPORT_METHOD(getBiologicalSex:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self characteristic_getBiologicalSex:input callback:callback];
}

RCT_EXPORT_METHOD(getDateOfBirth:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self characteristic_getDateOfBirth:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestWeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestWeight:input callback:callback];
}

RCT_EXPORT_METHOD(getWeightSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getWeightSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveWeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveWeight:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestHeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestHeight:input callback:callback];
}

RCT_EXPORT_METHOD(getHeightSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getHeightSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveHeight:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveHeight:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestBmi:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestBodyMassIndex:input callback:callback];
}

RCT_EXPORT_METHOD(saveBmi:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_saveBodyMassIndex:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestBodyFatPercentage:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestBodyFatPercentage:input callback:callback];
}

RCT_EXPORT_METHOD(getLatestLeanBodyMass:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self body_getLatestLeanBodyMass:input callback:callback];
}

RCT_EXPORT_METHOD(getStepCount:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getStepCountOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyStepCountSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyStepSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveSteps:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_saveSteps:input callback:callback];
}

RCT_EXPORT_METHOD(getDistanceWalkingRunning:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDistanceWalkingRunningOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyDistanceWalkingRunningSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyDistanceWalkingRunningSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getDistanceCycling:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDistanceCyclingOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyDistanceCyclingSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyDistanceCyclingSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getFlightsClimbed:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getFlightsClimbedOnDay:input callback:callback];
}

RCT_EXPORT_METHOD(getDailyFlightsClimbedSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self fitness_getDailyFlightsClimbedSamples:input callback:callback];
}

RCT_EXPORT_METHOD(saveFood:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self saveFood:input callback:callback];
}

RCT_EXPORT_METHOD(saveWater:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self saveWater:input callback:callback];
}

RCT_EXPORT_METHOD(getHeartRateSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getHeartRateSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getActiveEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self activity_getActiveEnergyBurned:input callback:callback];
}

RCT_EXPORT_METHOD(getBasalEnergyBurned:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self activity_getBasalEnergyBurned:input callback:callback];
}

RCT_EXPORT_METHOD(getBodyTemperatureSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getBodyTemperatureSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBloodPressureSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getBloodPressureSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getRespiratoryRateSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self vitals_getRespiratoryRateSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getBloodGlucoseSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self results_getBloodGlucoseSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getSleepSamples:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self sleep_getSleepSamples:input callback:callback];
}

RCT_EXPORT_METHOD(getInfo:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self getModuleInfo:input callback:callback];
}

RCT_EXPORT_METHOD(saveMindfulSession:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback)
{
    [self mindfulness_saveMindfulSession:input callback:callback];
}

// Saves all anchors from the previous request
-(void)dropHealthKitAnchors:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    
    // See if an anchor was specified
    NSString *anchorKey = [input objectForKey:@"anchorKey"];
    if (anchorKey == nil) {
        // Drop all anchors
        for (NSString* key in self.anchorsToDrop) {
            HKQueryAnchor *anchor = self.anchorsToDrop[key];
            [self saveCustomObject:anchor withKey:[NSString stringWithFormat:@"newAnchor%@",key]];
        }
        self.anchorsToDrop = [[NSMutableDictionary alloc] init];
        callback(@[[NSNull null], @true]);
    }
    else
    {
        // Drop a specific anchor
        HKQueryAnchor *anchor = self.anchorsToDrop[anchorKey];
        if (anchor != nil) {
            [self saveCustomObject:anchor withKey:[NSString stringWithFormat:@"newAnchor%@",anchorKey]];
            [self.anchorsToDrop removeObjectForKey:anchorKey];
            callback(@[[NSNull null], @true]);
        }
        else {
            callback(@[[NSNull null], @false]);
        }
    }
}

// Clears all anchors
-(void)clearHealthKitAnchors:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback
{
    // See if an anchor was specified
    NSString *anchorKey = [input objectForKey:@"anchorKey"];
    if (anchorKey == nil) {
        // Clear all anchors
        for (id key in self.readPermsDict) {
            HKQuantityType *value = [self.readPermsDict objectForKey:key];
            
            [self deleteCustomObjectWithKey:[NSString stringWithFormat:@"newAnchor%@",value.identifier]];
        }
    }
    else
    {
        // Clear a specific anchor
        [self deleteCustomObjectWithKey:[NSString stringWithFormat:@"newAnchor%@", anchorKey]];
    }

    callback(@[[NSNull null], @true]);
}

-(void)isHealthKitAvailable:(RCTResponseSenderBlock)callback {
    BOOL isAvailable = NO;
    if ([HKHealthStore isHealthDataAvailable]) {
        isAvailable = YES;
    }
    callback(@[[NSNull null], @(isAvailable)]);
}

-(void)initializeHealthKit:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    
    // Create the HealthStore object
    self.healthStore = [[HKHealthStore alloc] init];
    
    if ([HKHealthStore isHealthDataAvailable]) {
        NSSet *writeDataTypes;
        NSSet *readDataTypes;
        NSSet *readPermams;
        // get permissions from input object provided by JS options argument
        NSDictionary* permissions =[input objectForKey:@"permissions"];
        if(permissions != nil){
            NSArray* readPermsArray = [permissions objectForKey:@"read"];
            NSArray* writePermsArray = [permissions objectForKey:@"write"];
            NSSet* readPerms = [self getReadPermsFromOptions:readPermsArray];
            readPermams = [self getReadPermsFromOptions:readPermsArray];
            NSSet* writePerms = [self getWritePermsFromOptions:writePermsArray];
            
            if(readPerms != nil) {
                readDataTypes = readPerms;
            }
            if(writePerms != nil) {
                writeDataTypes = writePerms;
            }
        } else {
            callback(@[RCTMakeError(@"permissions must be provided in the initialization options", nil, nil)]);
            return;
        }
        
        // make sure at least 1 read or write permission is provided
        if(!writeDataTypes && !readDataTypes){
            callback(@[RCTMakeError(@"at least 1 read or write permission must be set in options.permissions", nil, nil)]);
            return;
        }
        
        [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
            if (!success) {
                NSString *errMsg = [NSString stringWithFormat:@"Error with HealthKit authorization: %@", error];
                NSLog(@"00xxxc1 errMsg:%@",errMsg);
                callback(@[RCTMakeError(errMsg, nil, nil)]);
                return;
            } else {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    
                    //Akshay
                    
                    NSLog(@"00xxxc1 initializeHealthKit:callback setUpBackgroundDeliveryForDataTypes()");
                    
                    [self setUpBackgroundDeliveryForDataTypes:readDataTypes];
                    //Over
                    callback(@[[NSNull null], @true]);
                });
            }
        }];
        
    } else {
        callback(@[RCTMakeError(@"HealthKit data is not available", nil, nil)]);
    }
}

-(NSDate *) dateWithTime:(NSDate*)date
                    hour:(NSInteger)hour
                  minute:(NSInteger)minute
                  second:(NSInteger)second
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components: NSCalendarUnitYear|
                                    NSCalendarUnitMonth|
                                    NSCalendarUnitDay
                                               fromDate:date];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    NSDate *newDate = [calendar dateFromComponents:components];
    return newDate;
}

-(void)readHealthKitDataByDate:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    // Check if a start and end date was passed
    NSString *startDateString = [input objectForKey:@"fromDate"];
    NSString *endDateString = [input objectForKey:@"toDate"];
    NSDate *startDate;
    NSDate *endDate;
    NSPredicate *predicate;
    
    if (startDateString && endDateString) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        startDate = [dateFormatter dateFromString:startDateString];
        endDate = [dateFormatter dateFromString:endDateString];
        predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone];
    }
    [self readHealthKitData:input predicate:predicate callback:callback];
}

-(void)readHealthKitData:(NSDictionary *    )input predicate:(NSPredicate *)predicate callback:(RCTResponseSenderBlock)callback {
    
    NSLog(@"11xxx01 readHealthKitData isBackgroundUploadInProgress: %s", self.isBackgroundUploadInProgress ? "true" : "false");
    
    // Don't get new data until all previous data is processed
    if (self.isBackgroundUploadInProgress) {
        self.jsonDeletedObject = [[NSMutableDictionary alloc] init]; // Clear since processed all at once
        [self callBackHealthKitResults:callback];
        return;
    }
    else if(self.wasBackgroundUploadInProgress) {
        self.wasBackgroundUploadInProgress = false;
        self.jsonDeletedObject = [[NSMutableDictionary alloc] init];    // Clear since processed all at once
        // return a null to indicate background download complete
        callback(@[[NSNull null], [NSNull null]]);
        return;
    }
    
    NSString *userid = [input objectForKey:@"userid"];
    NSArray *readPermsArray = [input objectForKey:@"permissions"];
    
    
    NSSet* types = [self getReadPermsFromOptions:readPermsArray];
    self.jsonObject = [[NSMutableDictionary alloc] init];
    self.jsonDeletedObject = [[NSMutableDictionary alloc] init];
    self.anchorsToDrop = [[NSMutableDictionary alloc] init];
    
    HKQuantityType *key;
    self.typeCount = 0;
    bool bloodPressureRetrieved = false;
    
    for (key in types)
    {
        NSLog(@"01xxxa. readHealthKitData() key: %@", ((HKQuantityType *)key).identifier);
        
        bool isFirstQueryForType = true;
        
        // If there is no anchor object for this key, it's the first time through
        if (predicate != nil ||
            [[NSUserDefaults standardUserDefaults]valueForKey:[NSString stringWithFormat:@"newAnchor%@",key.identifier]] != nil) {
            isFirstQueryForType = false;
        }
        
        if ([key isKindOfClass:HKSampleType.class]) {
            
            // Note if either of the blood pressure components has already been processed
            if ([key.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic] ||
                [key.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic]) {
                
                if (bloodPressureRetrieved) {
                    self.typeCount++;
                    continue;
                }
                bloodPressureRetrieved = true;
            }
            
            [self queryForUpdates:key predicate:predicate completion:^(NSArray * allObjects, NSArray * deletedObjects, NSError * error, HKQueryAnchor *anchor) {
                
                NSDateComponents *interval = [[NSDateComponents alloc] init];
                
                if(([key.identifier isEqualToString:HKQuantityTypeIdentifierHeartRate] ||
                   [key.identifier isEqualToString:HKQuantityTypeIdentifierStepCount]) &&
                   allObjects.count > 0) {
                    
                    HKStatisticsOptions options;
                    
                    if ([key.identifier isEqualToString:HKQuantityTypeIdentifierStepCount]) {
                        options = HKStatisticsOptionCumulativeSum;
                        interval.day = 1;  // steps
                    }
                    else {
                        options = HKStatisticsOptionDiscreteAverage | HKStatisticsOptionDiscreteMin | HKStatisticsOptionDiscreteMax;
                        interval.hour = 1;   // heart rate
                    }
                    
                    NSDate *startDate;
                    NSDate *endDate;
                    
                    // If this is not the first time through, look at the initial queryForUpdates
                    // results and set a start and end date accordingly
                    if (!isFirstQueryForType && (allObjects.count > 0 || deletedObjects.count > 0)) {
                        // Make sure all records are sorted by startDate
                        NSSortDescriptor * descriptor = [[NSSortDescriptor alloc] initWithKey:@"startDate" ascending:YES];
                        allObjects = [allObjects sortedArrayUsingDescriptors:@[descriptor]];
                        // Get start date from first item in array
                        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm"];
                        NSString *startDateString = [((NSDictionary *)allObjects[0]) valueForKey:@"startDate"];
                        NSString *endDateString = [((NSDictionary *)allObjects[allObjects.count-1])valueForKey:@"endDate"];
                        startDate = [dateFormatter dateFromString: startDateString];
                        endDate = [dateFormatter dateFromString: endDateString];
                    }
                    
                    // Get a summary instead
                    [self queryForQuantitySummary:key
                                             unit:[HKUnit countUnit]
                                        startDate:startDate
                                          endDate:endDate
                                         interval:interval
                                          options:options
                                           userid:userid
                                       completion:^(NSArray * allObjects, NSError *error) {
                                           
                                            // TODO: Check out alternative ways of tracking deleted records for summary
                                            NSArray *emptyDeletedObjects = [[NSArray alloc] init];

                                           [self processHealthKitResult:allObjects
                                                         deletedObjects:emptyDeletedObjects
                                                               callback:callback key:key typesCount:types.count anchor:anchor];
                                       }];
                }
                else
                {
                    [self processHealthKitResult:allObjects
                                  deletedObjects:deletedObjects
                                        callback:callback key:key typesCount:types.count anchor:anchor];
                }
            }];
        }
    }
}

// Add the results returned from HealthKit for a specific reading type to the jsonObject
// If finished, call back to JS
-(void)processHealthKitResult:(NSArray *)allObjects
               deletedObjects:(NSArray *)deletedObjects callback:(RCTResponseSenderBlock)callback key:(HKQuantityType *)key typesCount:(NSUInteger)typesCount anchor:(HKQueryAnchor *)anchor
{
    if (allObjects.count > 0) {
        // Sort newest to oldest
        NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"startTimestamp" ascending:NO];
        allObjects = [allObjects sortedArrayUsingDescriptors:@[descriptor]];
        
        NSMutableArray *jsonArray = [self buildJSONArrayFromHealthKitArray:allObjects type:key];
        [self.jsonObject setObject:jsonArray forKey:key.identifier];
    }
    
    if (deletedObjects.count > 0) {
        [self.jsonDeletedObject setObject:deletedObjects forKey:key.identifier];
    }
    
    // Add the anchor object to the list of anchors to be dropped (saved)
    // for use in the next query so only records newer than the anchor are returned
    // Anchors are dropped when JS calls back to the DropAnchor() function after
    // all readings have been successfully uploaded.
    if (anchor != nil) {
        //
        [self.anchorsToDrop setObject:anchor forKey:key.identifier];
    }
    
    self.typeCount++;
    if (self.typeCount == typesCount) {
        [self callBackHealthKitResults:callback];
    }
}

-(void)callBackHealthKitResults:(RCTResponseSenderBlock)callback
{
    // We've processed all the requested types
    // Check if any results have more than 500 records
    self.wasBackgroundUploadInProgress = self.isBackgroundUploadInProgress;
    self.isBackgroundUploadInProgress = false;
    self.jsonCallbackObject = [[NSMutableDictionary alloc] init];
    self.jsonDeletedCallbackObject = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *jsonOverflowObject = [[NSMutableDictionary alloc] init];
    
    // Copy the results from jsonObject to jsonCallbackObject
    // add any overflow items to a temporary object
    // (since you can't change the object you're iterating over)
    for (NSString *key in self.jsonObject) {
        NSMutableArray *typeArray = [self.jsonObject objectForKey:key];
        NSLog(@"11xxx02. callBackHealthKitResults() key:%@ count:%i", key, (int)typeArray.count);
        if (typeArray.count > MAX_RECORDS) {
            NSRange range;
            range.location = MAX_RECORDS;
            range.length = typeArray.count - MAX_RECORDS;
            
            // Create an array with the overflow items
            NSMutableArray *overflowArray = [NSMutableArray arrayWithArray:[typeArray subarrayWithRange:range]];
            NSLog(@"11xxx03. callBackHealthKitResults() overflowArray.count:%i",(int)overflowArray.count);
            // Remove those items from the array
            [typeArray removeObjectsInRange:range];
            NSLog(@"11xxx04 callBackHealthKitResults() jsonCallbackObject.typeArray.count:%i", (int)typeArray.count);
            // Temporarily add the overflow items to an object
            [jsonOverflowObject setObject:overflowArray forKey:key];
            self.isBackgroundUploadInProgress = true;
        }
        
        NSString *headsUpType = [self getHeadsUpTypeFromHealthKitType:key];
        [self.jsonCallbackObject setObject:typeArray forKey:headsUpType];
    }
    
    // Copy the results from jsonDeletedObject to jsonDeletedCallbackObject
    // add any overflow items to a temporary object
    // (since you can't change the object you're iterating over)
    for (NSString *key in self.jsonDeletedObject) {
        NSMutableArray *typeArray = [self.jsonDeletedObject objectForKey:key];
        NSLog(@"11xxx02. callBackHealthKitResults() key:%@ count:%i", key, (int)typeArray.count);
        
        NSString *headsUpType = [self getHeadsUpTypeFromHealthKitType:key];
        [self.jsonDeletedCallbackObject setObject:typeArray forKey:headsUpType];
    }
    
    if (self.isBackgroundUploadInProgress) {
        // Recreate the jsonObject and copy all overflow items to it for the next call
        self.jsonObject = [[NSMutableDictionary alloc] init];
        for (NSString *key in jsonOverflowObject) {
            NSMutableArray *array = [(NSArray *)[jsonOverflowObject objectForKey:key] mutableCopy];
            NSLog(@"11xxx05. callBackHealthKitResults() jsonObject overflow array count: %i", (int)array.count);
            [self.jsonObject setValue:array forKey:key];
        }
        
        for (HKQuantityType *key in jsonOverflowObject) {
            NSLog(@"11xxx06. callBackHealthKitResults() key: %@",key);
        }
    }
    
    // Send the results to JS
    NSLog(@"11xxx07. callBackHealthKitResults() callback to JS");
    
    // Make sure there are readings
    if ([self.jsonCallbackObject count] == 0 && [self.jsonDeletedCallbackObject count] == 0 )
    {
        // return a null to indicate background download complete
        NSLog(@"11xxx07a. callBackHealthKitResults() return null");
        callback(@[[NSNull null], [NSNull null]]);
    }
    else
    {
        NSLog(@"11xxx07b. callBackHealthKitResults() return count: %i", (int)[self.jsonCallbackObject count]);
        NSMutableDictionary *jsonFinalObject = [[NSMutableDictionary alloc] init];
        [jsonFinalObject setObject: self.jsonCallbackObject forKey:@"added"];
        [jsonFinalObject setObject: self.jsonDeletedCallbackObject forKey:@"deleted"];
        if (!self.isBackgroundUploadInProgress) {
            // Need to set this flag when there were no overflow objects,
            // so the next call to readHealthKitData() returns NULL
            
            self.wasBackgroundUploadInProgress = true;
        }
        callback(@[@[jsonFinalObject], [NSNull null]]);
    }
}

-(NSMutableArray *)buildJSONArrayFromHealthKitArray:(NSArray *)healthKitArray type:(HKQuantityType *)type
{
    NSMutableArray *jsonArray = [[NSMutableArray alloc] init];
    NSString *dateString;
    NSString *uuid;
    NSRange rangeOfString;
    NSString *unit;
    
    // Create a new array of dictionary objects that only contains the data we need
    for (NSDictionary *hkDict in healthKitArray) {
        
        uuid = [hkDict valueForKey:@"UUID"];
        rangeOfString = [uuid rangeOfString:@"-healthkit2-"];
        if (rangeOfString.location != NSNotFound) {
            dateString = [uuid substringFromIndex:rangeOfString.location + rangeOfString.length];
        }
        
        NSDictionary *hkReading;
        
        if ([type.identifier isEqualToString:HKQuantityTypeIdentifierStepCount] )
        {
            hkReading = @{ @"h_id" : uuid,
                           @"value" : [hkDict valueForKey:@"value"],
                           @"date" : dateString};
        }
        else if ([type.identifier isEqualToString:HKQuantityTypeIdentifierHeartRate])
        {
            hkReading = @{ @"h_id" : uuid,
                           @"value" : [hkDict valueForKey:@"value"],
                           @"timestamp" : dateString,
                           @"min_value" : [hkDict valueForKey:@"min_value"],
                           @"max_value" : [hkDict valueForKey:@"max_value"]
                           };
        }
        else if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBodyMass])
        {
            unit = [hkDict valueForKey:@"unit"];
            unit = [unit isEqualToString:@"lb"] ? @"pounds" : unit;
            
            hkReading = @{ @"h_id" : uuid,
                           @"value" : [hkDict valueForKey:@"value"],
                           @"timestamp" : [hkDict valueForKey:@"startDate"],
                           @"unit" : unit,
                           @"device_name" : [hkDict valueForKey:@"source"]
                           };
        }
        else if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBodyMassIndex]) {
            hkReading = @{ @"h_id" : uuid,
                           @"value" : [hkDict valueForKey:@"value"],
                           @"timestamp" : [hkDict valueForKey:@"startDate"],
                           @"device_name" : [hkDict valueForKey:@"source"]
                           };
        }
        else if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic] ||
                 [type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic] ) {
            hkReading = @{ @"h_id" : uuid,
                           @"diastolic" : [hkDict valueForKey:@"value"],
                           @"systolic" : [hkDict valueForKey:@"value2"],
                           @"timestamp" : [hkDict valueForKey:@"startDate"],
                           @"device_name" : [hkDict valueForKey:@"source"]
                           };
        }
        else if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBloodGlucose] )
        {
            if ([((NSString *)[hkDict valueForKey:@"meal_tag"]) length] == 0) {
                hkReading = @{ @"h_id" : uuid,
                               @"value" : [hkDict valueForKey:@"value"],
                               @"timestamp" : [hkDict valueForKey:@"startDate"],
                               @"unit" : [hkDict valueForKey:@"unit"],
                               @"device_name" : [hkDict valueForKey:@"source"]
                               };
            }
            else {
                hkReading = @{ @"h_id" : uuid,
                               @"value" : [hkDict valueForKey:@"value"],
                               @"timestamp" : [hkDict valueForKey:@"startDate"],
                               @"unit" : [hkDict valueForKey:@"unit"],
                               @"device_name" : [hkDict valueForKey:@"source"],
                               @"meal_tag" : [hkDict valueForKey:@"meal_tag"]
                               };
            }

        }
        else if ([type.identifier isEqualToString:HKCategoryTypeIdentifierSleepAnalysis])
        {
            hkReading = @{ @"h_id" : uuid,
            @"value" : [hkDict valueForKey:@"value"],
            @"startDate" : [hkDict valueForKey:@"startDate"],
            @"endDate" : [hkDict valueForKey:@"endDate"],
            @"device_name" : [hkDict valueForKey:@"source"],
            };
        }
        [jsonArray addObject:hkReading];
    }
    
    return jsonArray;
}

-(void)queryForQuantitySummary:(HKQuantityType *)type
                          unit:(HKUnit *)unit
                     startDate:(NSDate *)startDate
                       endDate:(NSDate *)endDate
                      interval:(NSDateComponents *)interval
                       options:(HKStatisticsOptions)options
                        userid:(NSString *)userid
                    completion:(void (^)(NSArray *,NSError *))completion
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    __block NSDate *fromDate = startDate;
    __block NSDate *toDate = endDate;
    
    NSDateComponents *anchorComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                                     fromDate:[NSDate date]];
    anchorComponents.hour = 0;
    NSDate *anchorDate = [calendar dateFromComponents:anchorComponents];
    
    // NOTE: Collection queries can also be long running queries, receiving updates
    // when matching samples are added to or removed from HealthKit
    // See: statisticsUpdateHandler and initialResultsHandler
    // https://developer.apple.com/documentation/healthkit/hkstatisticscollectionquery?language=objc
    
    // Create the query
    HKStatisticsCollectionQuery *query = [[HKStatisticsCollectionQuery alloc] initWithQuantityType:type
                                                                           quantitySamplePredicate:nil
                                                                                           options:options
                                                                                        anchorDate:anchorDate
                                                                                intervalComponents:interval];
    
    // Set the results handler
    query.initialResultsHandler = ^(HKStatisticsCollectionQuery *query, HKStatisticsCollection *results, NSError *error) {
        
        if (error) {
            // Perform proper error handling here
            NSLog(@"*** An error occurred while calculating the statistics: %@ ***",error.localizedDescription);
        }
        
        // Get oldest and newest dates from the collection
        if (fromDate == nil) {
            fromDate = results.statistics[0].startDate;
            toDate = results.statistics[results.statistics.count - 1].startDate;
        }
        
        // Create an array of dictionary objects from the query results
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (interval.day == 1) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        }
        else {
            // TODO Consider all interval types such as week, month
            [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm"];
        }
        
        __block NSString *dateString;

        NSLog(@"00xxxc10b queryForQuantitySummary() fromDate: %@, toDate: %@", fromDate, toDate);
        
//        NSDate *enumFromDate = [dateFormatter dateFromString:fromDate];
//        NSDate *enumToDate = [dateFormatter dateFromString:toDate];
        
        [results enumerateStatisticsFromDate:fromDate
                                      toDate:toDate
                                   withBlock:^(HKStatistics *result, BOOL *stop) {
                                       
                                       NSTimeInterval startTimeStamp  = [result.startDate timeIntervalSince1970];
                                       NSTimeInterval endTimeStamp  = [result.endDate timeIntervalSince1970];
                                       NSString *startTime = [NSString stringWithFormat:@"%f",startTimeStamp];
                                       NSString *endTime = [NSString stringWithFormat:@"%f",endTimeStamp];
                                       
                                       NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                                       [dict setValue:@"summary" forKey:@"source"];
                                       [dict setValue:startTime forKey:@"startTimestamp"];
                                       [dict setValue:endTime forKey:@"endTimestamp"];
                                       
                                       NSString *strUnit = @"";
                                       NSString *qtyTypeIdentifier = [NSString stringWithFormat:@"%@",result.quantityType];
                                       strUnit = [self getDictKeyAndUnit:qtyTypeIdentifier keyUnit:2];
                                       [dict setValue:strUnit forKey:@"unit"];
                                       
                                       HKQuantity *qtyVal;
                                       double valueDouble = 0.0;
                                       double minDouble = 0.0;
                                       double maxDouble = 0.0;
                                       int valueFloor = 0;
                                       int valueInt = 0;
                                       
                                       // Derive the Quantity, minimumQuantity and maximumQuantity
                                       if ((options & HKStatisticsOptionCumulativeSum) == HKStatisticsOptionCumulativeSum) {
                                           qtyVal = result.sumQuantity;
                                       }
                                       else {
                                           qtyVal = result.averageQuantity;
                                       }
                                       
                                       if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierHeartRate"] || [type.identifier isEqualToString:@"HKQuantityTypeIdentifierRespiratoryRate"]) {
                                           valueDouble = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count/min"]];
                                           if ((options & HKStatisticsOptionDiscreteMin) == HKStatisticsOptionDiscreteMin) {
                                               minDouble = [result.minimumQuantity doubleValueForUnit:[HKUnit unitFromString:@"count/min"]];
                                               [dict setValue:[NSNumber numberWithInteger:(int)floor(minDouble)] forKey:@"min_value"];
                                           }
                                           
                                           if ((options & HKStatisticsOptionDiscreteMax) == HKStatisticsOptionDiscreteMax) {
                                               maxDouble = [result.maximumQuantity doubleValueForUnit:[HKUnit unitFromString:@"count/min"]];
                                               [dict setValue:[NSNumber numberWithInteger:(int)floor(maxDouble)] forKey:@"max_value"];
                                           }
                                       }
                                       else if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierBodyMassIndex"]) {
                                           valueDouble = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count"]];
                                       }
                                       else if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierFlightsClimbed"]) {
                                           valueDouble = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count"]];
                                       }
                                       else {
                                           valueDouble = [qtyVal doubleValueForUnit:unit];
                                       }
                                       
                                       valueInt = (int)lroundf(valueDouble);
                                       
                                       // Added this code to try and match Apple's statistical rounding
                                       // It's better, but not 100% yet
                                       valueFloor = floorf(valueDouble);
                                       if (valueDouble != valueFloor) {
                                           NSNumber *doubleNumber = [NSNumber numberWithDouble:(valueDouble)];
                                           NSString *doubleString = [doubleNumber stringValue];
                                           if ([doubleString containsString:@".5"]) {
                                               if (valueInt % 2) {
                                                   valueInt--;
                                               }
                                           }
                                       }
                                       
                                       // Ignore zero value heart rate records
                                       bool addToArray = true;
                                       if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierHeartRate"]) {
                                           if (valueInt == 0) {
                                               addToArray = false;
                                           }
                                       }
                                       
                                       if (addToArray) {
                                           
                                           [dict setValue:[NSNumber numberWithInteger:valueInt] forKey:@"value"];
                                           
                                           dateString = [dateFormatter stringFromDate:result.startDate];
                                           
                                           NSString *strUUID = [NSString stringWithFormat:@"%@-healthkit2-%@", userid, dateString];
                                           [dict setValue:strUUID forKey:@"UUID"];

                                           
                                           NSString *strQTYType = [NSString stringWithFormat:@"%@",type.identifier];
                                           [dict setValue:strQTYType forKey:@"quantityType"];
                                           
                                           [dict setValue:nil forKey:@"device"];
                                           
                                           NSString *strSampleType = [NSString stringWithFormat:@"%@",type.identifier];
                                           [dict setValue:strSampleType forKey:@"sampleType"];
                                           
                                           [arr addObject:dict];
                                           
                                           NSLog(@"00xxxc11 %@: %f", result.startDate, valueDouble);
                                       }
                                   }];
        
        completion(arr, nil);
    };
    
    [self.healthStore executeQuery:query];
}

-(NSString *)getHeadsUpTypeFromHealthKitType:(NSString *)type
{
    if ([type isEqualToString:HKQuantityTypeIdentifierDietaryFatMonounsaturated]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryFatPolyunsaturated]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryFatSaturated]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryFatTotal]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryFiber]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryFolate]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryIodine]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryIron]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryMagnesium]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryManganese]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryMolybdenum]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryNiacin]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryPantothenicAcid]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryPhosphorus]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryPotassium]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryProtein]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryRiboflavin]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietarySelenium]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietarySodium]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietarySugar]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryThiamin]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryVitaminA]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB12]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB6]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryVitaminC]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryVitaminD]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryVitaminE]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryVitaminK]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryZinc]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDietaryWater]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierHeartRate]) {//Earlier
        return @"heart_rate";
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierLeanBodyMass]) {
        return @"lbs";
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic] ||
             [type isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic]) {
        return @"blood_pressure";
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierBodyMassIndex]) {
        return @"bmi";
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierBodyFatPercentage]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierBodyTemperature]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierRespiratoryRate]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDistanceCycling]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierStepCount]) {
        return @"steps";
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierActiveEnergyBurned]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierBasalEnergyBurned]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierDistanceWalkingRunning]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierFlightsClimbed]) {
        return type;
    }
    else if ([type isEqualToString:HKCategoryTypeIdentifierSleepAnalysis]) {
        return type;
    }
    else if ([type isEqualToString:HKCharacteristicTypeIdentifierDateOfBirth]) {
        return type;
    }
    else if ([type isEqualToString:HKCharacteristicTypeIdentifierBiologicalSex]) {
        return type;
    }
    else if ([type isEqualToString:HKCharacteristicTypeIdentifierBloodType]) {
        return type;
    }
    else if ([type isEqualToString:HKCharacteristicTypeIdentifierWheelchairUse]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierHeight]) {
        return type;
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierBodyMass]) {
        return @"weight";
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierBloodGlucose]) {
        return @"blood_glucoses";
    }
    else if ([type isEqualToString:HKQuantityTypeIdentifierNikeFuel]) {//NOT GETTING DATA
        return type;
    }
    else if ([type isEqualToString:HKCategoryTypeIdentifierMindfulSession]) {//NOT GETTING DATA
        return type;
    }
    else {
        return type;
    }
    return nil;
}

//Akshay
-(void)setUpBackgroundDeliveryForDataTypes :(NSSet*) types {
    
    for (id key in types) {
        
        if ([key isKindOfClass:HKSampleType.class]) {
            
            // Create the query object
            NSLog(@"00xxxc2. setUpBackgroundDeliveryForDataTypes() create the query for type: %@", ((HKQuantityType *)key).identifier);
            
            // This is not a query for actual data. It's a query to observer a
            // specific type of data. The handler is executed when that type of data changes
            HKObserverQuery *query = [[HKObserverQuery alloc] initWithSampleType:key
                                                                       predicate:nil
                                                                   updateHandler:^(HKObserverQuery * _Nonnull query,
                                                                                   HKObserverQueryCompletionHandler  _Nonnull
                                                                                   completionHandler,
                                                                                   NSError * _Nullable error) {
                                                                       
                                                                       NSLog(@"00xxxc5. HKObserverQuery updateHandler() key: %@", ((HKQuantityType *)key).identifier);
                                                                       
                                                                       // TODO: Decide what to do here. Possibly send notification of updates
                                                                       //[self queryForUpdates:key];
                                                                       
                                                                       // [_bridge.eventDispatcher sendAppEventWithName:@"change:observed" body:key];
                                                                       
                                                                       completionHandler();
                                                                   }];
            
            // Execute the observer query object
            NSLog(@"00xxxc3 setUpBackgroundDeliveryForDataTypes() execute query for type: %@", ((HKQuantityType *)key).identifier);
            [self.healthStore executeQuery:query];
            
            // Enable delivery of background updates
            // HKUpdateFrequencyImmediate launches the app every time it detects a change
            NSLog(@"00xxxc4 setUpBackgroundDeliveryForDataTypes() enableBackgroundDeliveryForType:%@", ((HKQuantityType *)key).identifier);
            
            [self.healthStore enableBackgroundDeliveryForType:key
                                                    frequency:HKUpdateFrequencyImmediate
                                               withCompletion:^(BOOL success, NSError * _Nullable error) {
                                                   
                                                   // This just tells you if the registration for background delivery worked
                                                   // NSLog(@"00xxxc5. enableBackgroundDeliveryForType handler called for %@ - success: %d error:%@", key, success, error.description);
                                               }];
        }
    }
}

-(void)queryForUpdates:(HKQuantityType *)type
             predicate:(NSPredicate *)predicate
            completion:(void (^)(NSArray *,NSArray *, NSError *, HKQueryAnchor *anchor))completion
{
    NSString *str = type.identifier;
    
    NSLog(@"00xxxc7. queryForUpdates() type.identifier = %@", str);
    
    if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatMonounsaturated]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatPolyunsaturated]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
            
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatSaturated]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatTotal]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFiber]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFolate]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryIodine]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryIron]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryMagnesium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryManganese]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryMolybdenum]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryNiacin]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPantothenicAcid]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPhosphorus]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPotassium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryProtein]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryRiboflavin]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySelenium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySodium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySugar]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryThiamin]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminA]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB12]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB6]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminC]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminD]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminE]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminK]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryZinc]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryWater]) {
        [self getIndividualRecords:type unit:[HKUnit literUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierHeartRate]) {//DONE EARLIER
        [self getIndividualRecords:type unit:[HKUnit countUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierLeanBodyMass]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit poundUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic] ||
             [str isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit millimeterOfMercuryUnit]
                         predicate:predicate
                        completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
                            completion(results, arrDeleted, error, anchor);
                        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyMassIndex]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit mileUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyFatPercentage]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit percentUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyTemperature]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit degreeCelsiusUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierRespiratoryRate]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit countUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDistanceCycling]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit mileUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierStepCount]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit countUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierActiveEnergyBurned]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit kilocalorieUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBasalEnergyBurned]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit kilocalorieUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDistanceWalkingRunning]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit mileUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierFlightsClimbed]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit kilocalorieUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKCategoryTypeIdentifierSleepAnalysis]) {//Done
       // [self getCategoryQueriesResult:type unit:[HKUnit kilocalorieUnit]];
        [self getIndividualRecords:type unit:[HKUnit kilocalorieUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierDateOfBirth]) {//DONE
        NSError *error;
        NSDate *dateOfBirth = [self.healthStore dateOfBirthWithError:&error];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat = @"dd-MM-yyyy";
        NSString *strDate = [df stringFromDate:dateOfBirth];
        [self convertCharacteristicsData:type.identifier values:strDate];
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierBiologicalSex]) {//DONE
        NSError *error;
        HKBiologicalSexObject *gen=[self.healthStore biologicalSexWithError:&error];
        NSString *strGender=@"";
        if (gen.biologicalSex==HKBiologicalSexMale) {
            strGender=@"Male";
        }
        else if (gen.biologicalSex==HKBiologicalSexFemale) {
            strGender=@"Female";
        }
        else if (gen.biologicalSex==HKBiologicalSexOther) {
            strGender=@"Other";
        }
        else {
            strGender=@"Not Set";
        }
        [self convertCharacteristicsData:type.identifier values:strGender];
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierBloodType]) {//DONE
        NSError *error;
        NSString *bloodGroup =@"";
        HKBloodTypeObject *bloodType = [self.healthStore bloodTypeWithError:&error];
        switch (bloodType.bloodType) {
            case HKBloodTypeNotSet:
                bloodGroup = @"Not Set";
                break;
            case HKBloodTypeAPositive:
                bloodGroup = @"A+";
                break;
            case HKBloodTypeANegative:
                bloodGroup = @"A-";
                break;
            case HKBloodTypeBPositive:
                bloodGroup = @"B+";
                break;
            case HKBloodTypeBNegative:
                bloodGroup = @"B-";
                break;
            case HKBloodTypeABPositive:
                bloodGroup = @"AB+";
                break;
            case HKBloodTypeABNegative:
                bloodGroup = @"AB-";
                break;
            case HKBloodTypeOPositive:
                bloodGroup = @"O+";
                break;
            case HKBloodTypeONegative:
                bloodGroup = @"O-";
                break;
        }
        [self convertCharacteristicsData:type.identifier values:bloodGroup];
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierWheelchairUse]) {//DONE
        NSError *error;
        HKWheelchairUseObject *wheelChair = [self.healthStore wheelchairUseWithError:&error];
        NSString *wheelChairUse = @"";
        switch (wheelChair.wheelchairUse) {
            case HKWheelchairUseNotSet:
                wheelChairUse = @"Not Set";
                break;
            case HKWheelchairUseNo:
                wheelChairUse = @"No";
                break;
            case HKWheelchairUseYes:
                wheelChairUse = @"Yes";
                break;
            default:
                break;
        }
        [self convertCharacteristicsData:type.identifier values:wheelChairUse];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierHeight]) {//DONE
        [self getOtherQueriesResult:type unit:[HKUnit footUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyMass]) {//DONE
        //[self getOtherQueriesResult:type unit:[HKUnit poundUnit]];
        [self getIndividualRecords:type unit:[HKUnit poundUnit] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodGlucose]) {//DONE
        //[self getOtherQueriesResult:type unit:[HKUnit poundUnit]];
        [self getIndividualRecords:type unit:[HKUnit unitFromString: @"mg/dL"] predicate:predicate completion:^(NSArray *results,NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
            completion(results, arrDeleted, error, anchor);
        }];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierNikeFuel]) {//NOT GETTING DATA
        //        [self getOtherQueriesResult:type unit:[HKUnit countUnit]];
    }
    else if ([str isEqualToString:HKCategoryTypeIdentifierMindfulSession]) {//NOT GETTING DATA
        //        [self getCategoryQueriesResult:type unit:[HKUnit poundUnit]];
    }
    else {
        NSLog(@"%@",str);
    }
}

-(NSString *)getDictKeyAndUnit:(NSString *)str keyUnit:(int)keyUnit {
    if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatMonounsaturated]) {
        return keyUnit == 1 ? @"FatMonounsaturated" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatPolyunsaturated]) {
        return keyUnit == 1 ? @"FatPolyunsaturated" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatSaturated]) {
        return keyUnit == 1 ? @"FatSaturated" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatTotal]) {
        return keyUnit == 1 ? @"FatTotal" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFiber]) {
        return keyUnit == 1 ? @"Fiber" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFolate]) {
        return keyUnit == 1 ? @"Folate" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryIodine]) {
        return keyUnit == 1 ? @"Iodine" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryIron]) {
        return keyUnit == 1 ? @"Iron" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryMagnesium]) {
        return keyUnit == 1 ? @"Magnesium" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryManganese]) {
        return keyUnit == 1 ? @"Manganese" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryMolybdenum]) {
        return keyUnit == 1 ? @"Molybdenum" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryNiacin]) {
        return keyUnit == 1 ? @"Niacin" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPantothenicAcid]) {
        return keyUnit == 1 ? @"PantothenicAcid" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPhosphorus]) {
        return keyUnit == 1 ? @"Phosphorus" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPotassium]) {
        return keyUnit == 1 ? @"Potassium" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryProtein]) {
        return keyUnit == 1 ? @"Protein" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryRiboflavin]) {
        return keyUnit == 1 ? @"Riboflavin" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySelenium]) {
        return keyUnit == 1 ? @"Selenium" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySodium]) {
        return keyUnit == 1 ? @"Sodium" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySugar]) {
        return keyUnit == 1 ? @"Sugar" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryThiamin]) {
        return keyUnit == 1 ? @"Thiamin" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminA]) {
        return keyUnit == 1 ? @"VitaminA" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB12]) {
        return keyUnit == 1 ? @"VitaminB12" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB6]) {
        return keyUnit == 1 ? @"VitaminB6" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminC]) {
        return keyUnit == 1 ? @"VitaminC" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminD]) {
        return keyUnit == 1 ? @"VitaminD" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminE]) {
        return keyUnit == 1 ? @"VitaminE" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminK]) {
        return keyUnit == 1 ? @"VitaminK" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryZinc]) {
        return keyUnit == 1 ? @"Zinc" : @"mcg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryWater]) {
        return keyUnit == 1 ? @"Water" : @"mL";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierHeartRate]) {//Earlier
        return keyUnit == 1 ? @"HeartRate" : @"bpm";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierLeanBodyMass]) {
        return keyUnit == 1 ? @"LeanBodyMass" : @"lbs";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic]) {
        return keyUnit == 1 ? @"BloodPressureDiastolic" : @"mmHg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic]) {
        return keyUnit == 1 ? @"BloodPressureSystolic" : @"mmHg";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyMassIndex]) {
        return keyUnit == 1 ? @"BodyMassIndex" : @"bmi";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyFatPercentage]) {
        return keyUnit == 1 ? @"BodyFatPercentage" : @"percentage";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyTemperature]) {
        return keyUnit == 1 ? @"BodyTemperature" : @"degC";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierRespiratoryRate]) {
        return keyUnit == 1 ? @"RespiratoryRate" : @"bpm";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDistanceCycling]) {
        return keyUnit == 1 ? @"DistanceCycling" : @"mi";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierStepCount]) {
        return keyUnit == 1 ? @"StepCount" : @"Steps";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierActiveEnergyBurned]) {
        return keyUnit == 1 ? @"ActiveEnergyBurned" : @"kcal";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBasalEnergyBurned]) {
        return keyUnit == 1 ? @"BasalEnergyBurned" : @"kcal";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDistanceWalkingRunning]) {
        return keyUnit == 1 ? @"DistanceWalkingRunning" : @"mi";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierFlightsClimbed]) {
        return keyUnit == 1 ? @"FlightsClimbed" : @"Floors";
    }
    else if ([str isEqualToString:HKCategoryTypeIdentifierSleepAnalysis]) {
        return keyUnit == 1 ? @"SleepAnalysis" : @"SleepAnalysis";
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierDateOfBirth]) {
        return keyUnit == 1 ? @"DateOfBirth" : @"DateOfBirth";
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierBiologicalSex]) {
        return keyUnit == 1 ? @"BiologicalSex" : @"BiologicalSex";
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierBloodType]) {
        return keyUnit == 1 ? @"BloodType" : @"BloodType";
    }
    else if ([str isEqualToString:HKCharacteristicTypeIdentifierWheelchairUse]) {
        return keyUnit == 1 ? @"WheelchairUse" : @"WheelchairUse";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierHeight]) {
        return keyUnit == 1 ? @"Height" : @"Height";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyMass]) {
        return keyUnit == 1 ? @"BodyMass" : @"bm";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodGlucose]) {
        return keyUnit == 1 ? @"BloodGlucose" : @"mg/dl";
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierNikeFuel]) {//NOT GETTING DATA
        return keyUnit == 1 ? @"NikeFuel" : @"NikeFuel";
    }
    else if ([str isEqualToString:HKCategoryTypeIdentifierMindfulSession]) {//NOT GETTING DATA
        return keyUnit == 1 ? @"MindfulSession" : @"MindfulSession";
    }
    else {
        return keyUnit == 1 ? @"0" : str;
    }
}

#pragma mark Save and get new Anhcor
-(void)saveCustomObject:(HKQueryAnchor *)object withKey:(NSString *)strKey
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    [prefs setObject:myEncodedObject forKey:strKey];
}

-(void)deleteCustomObjectWithKey:(NSString *)strKey
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs removeObjectForKey:strKey];
}

-(HKQueryAnchor *)loadCustomObjectWithKey:(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [prefs objectForKey:key ];
    HKQueryAnchor *obj = (HKQueryAnchor *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    return obj;
}

#pragma mark GET READ WRITE AND CLEAR HEALTH DATA
-(NSString *)getLocalStoragePath {
    BOOL isExist = false;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *st=[NSString stringWithFormat:@"/HeadsUpHealth"];
    NSString *dataPath=[documentsDirectory stringByAppendingPathComponent:st];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSString  *filePath = [NSString stringWithFormat:@"%@/HeadsUpHealthData.json", dataPath];
    isExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    return filePath;
}

-(void)convertCharacteristicsData : (NSString *)typeIdentifier values : (NSString *)value {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:value forKey:@"value"];
    [dict setValue:typeIdentifier forKey:@"quantityType"];
    NSString *strUnit =[self getDictKeyAndUnit:typeIdentifier keyUnit:2];
    [dict setValue:strUnit forKey:@"unit"];
    [arr addObject:dict];
    
    NSLog(@"9xxx. convertCharacteristicsData()");
    
    //[self writeDictNewDataToFile:typeIdentifier values:nil arrayAddedObject:arr values:nil];
}

-(void)convertDataToArray : (NSString *)typeIdentifier values : (NSString *)value qty:(HKQuantitySample *)qty unit:(HKUnit *)unit {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSDate *startDate = qty.startDate;
    NSDate *endDate = qty.endDate;
    
    NSTimeInterval startTimeStamp  = [startDate timeIntervalSince1970];
    NSTimeInterval endTimeStamp  = [endDate timeIntervalSince1970];
    NSString *startTime = [NSString stringWithFormat:@"%f",startTimeStamp];
    NSString *endTime = [NSString stringWithFormat:@"%f",endTimeStamp];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:startTime forKey:@"startTimestamp"];
    [dict setValue:endTime forKey:@"endTimestamp"];
    
    HKQuantity *qtyVal = qty.quantity;
    double doubleValue = 0.0;
    if ([typeIdentifier isEqualToString:@"HKQuantityTypeIdentifierBloodGlucose"]) {
        doubleValue =[qtyVal doubleValueForUnit:[HKUnit unitFromString:@"mg/dL"]];
    }
    else {
        doubleValue =[qtyVal doubleValueForUnit:unit];
    }
    
    NSString *strSourceName = qty.sourceRevision.source.name;
    [dict setValue:strSourceName forKey:@"source"];
    
    NSString *strQTY = [NSString stringWithFormat:@"%f",doubleValue];
    [dict setValue:strQTY forKey:@"value"];
    
    NSString *strQtyValue = [NSString stringWithFormat:@"%@", qty.quantity];
    NSArray *arrSplitValueUnit = [strQtyValue componentsSeparatedByString:@" "];
    NSString *strUnit = @"";
    if (arrSplitValueUnit.count >= 2) {
        strUnit = [arrSplitValueUnit objectAtIndex:1];
    }
    else {
        NSString *qtyTypeIdentifier = [NSString stringWithFormat:@"%@",qty.quantityType];
        strUnit = [self getDictKeyAndUnit:qtyTypeIdentifier keyUnit:2];
    }
    [dict setValue:strUnit forKey:@"unit"];
    
    NSString *strUUID = [NSString stringWithFormat:@"%@",qty.UUID];
    [dict setValue:strUUID forKey:@"UUID"];
    
    NSString *strQTYType = [NSString stringWithFormat:@"%@",qty.quantityType];
    [dict setValue:strQTYType forKey:@"quantityType"];
    
    NSString *strDevice = [NSString stringWithFormat:@"%@",qty.device];
    [dict setValue:strDevice forKey:@"device"];
    
    NSString *strSampleType = [NSString stringWithFormat:@"%@",qty.quantityType];
    [dict setValue:strSampleType forKey:@"sampleType"];
    
    [arr addObject:dict];
    
    NSLog(@"9xxx. convertDataToArray()");
    
    //[self writeDictNewDataToFile:typeIdentifier values:nil arrayAddedObject:arr values:nil];
}

-(void)convertDataToArrayForCategory : (NSString *)typeIdentifier values : (NSString *)value qty:(HKCategorySample *)qty {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSDate *startDate = qty.startDate;
    NSDate *endDate = qty.endDate;
    
    NSTimeInterval startTimeStamp  = [startDate timeIntervalSince1970];
    NSTimeInterval endTimeStamp  = [endDate timeIntervalSince1970];
    NSString *startTime = [NSString stringWithFormat:@"%f",startTimeStamp];
    NSString *endTime = [NSString stringWithFormat:@"%f",endTimeStamp];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:startTime forKey:@"startTimestamp"];
    [dict setValue:endTime forKey:@"endTimestamp"];
    
    NSString *strSourceName = qty.sourceRevision.source.name;
    [dict setValue:strSourceName forKey:@"source"];
    
    NSString *strQTY = [NSString stringWithFormat:@"%@",value];
    [dict setValue:strQTY forKey:@"value"];
    
    NSString *strUnit =[self getDictKeyAndUnit:typeIdentifier keyUnit:2];
    [dict setValue:strUnit forKey:@"unit"];
    
    NSString *strUUID = [NSString stringWithFormat:@"%@",qty.UUID];
    [dict setValue:strUUID forKey:@"UUID"];
    
    //    [dict setValue:qty.quantityType forKey:@"quantityType"];
    
    NSString *strDevice = [NSString stringWithFormat:@"%@",qty.device];
    [dict setValue:strDevice forKey:@"device"];
    
    //    [dict setValue:qty.quantityType forKey:@"sampleType"];
    
    [arr addObject:dict];
    
    NSLog(@"9xxx. convertDataToArrayForCategory()");
    
    //[self writeDictNewDataToFile:typeIdentifier values:nil arrayAddedObject:arr values:nil];
}

-(BOOL)isCharacterSticsOrNot : (NSString *)typeIdentier {
    if ([typeIdentier isEqualToString:HKCharacteristicTypeIdentifierDateOfBirth]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKCharacteristicTypeIdentifierBiologicalSex]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKCharacteristicTypeIdentifierBloodType]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKCharacteristicTypeIdentifierWheelchairUse]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKCategoryTypeIdentifierSleepAnalysis]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKQuantityTypeIdentifierHeight]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKQuantityTypeIdentifierBodyMass]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKQuantityTypeIdentifierBloodGlucose]) {
        return true;
    } else if ([typeIdentier isEqualToString:HKQuantityTypeIdentifierNikeFuel]) {
        return true;
    }
    return false;
}

// NOTE: Currently not used - Reading/Writing to an interim JSON file was unnecessary
// We are reading directly from HealthKit instead
//-(void)writeDictNewDataToFile : (NSString *)typeIdentifier values : (NSString *)value arrayAddedObject : (NSMutableArray *)arr  values: (NSMutableArray *)arrDeleted {
//    NSString *strLocalPath = [self getLocalStoragePath];
//    NSError *err;
//    NSString *password = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
////
//    //Read - OLD DATA
//    NSData *dataRead = [NSData dataWithContentsOfFile:strLocalPath];
//    NSString *strDecrypt = [[NSString alloc] initWithData:dataRead encoding:NSUTF8StringEncoding];
//    NSString *decryptString = [AESCrypt decrypt:strDecrypt password:password];
//
//    NSData *dataPrint =[decryptString dataUsingEncoding:NSUTF8StringEncoding];
//    NSMutableDictionary *jsonObject = (NSMutableDictionary *)[NSJSONSerialization JSONObjectWithData:dataPrint options:NSJSONReadingMutableContainers error:&err];
//    //    NSMutableDictionary *jsonObject = [NSKeyedUnarchiver unarchiveObjectWithData:dataRead];
//    if (jsonObject == nil) {
//        jsonObject = [[NSMutableDictionary alloc] init];
//    }
//
//    //Add in dict
//    NSString *getKey = [self getDictKeyAndUnit:typeIdentifier keyUnit:1];
//    if ([self isCharacterSticsOrNot:typeIdentifier]) {
//        [jsonObject setObject:arr forKey:getKey];
//    } else {
//        if ([[jsonObject valueForKey:getKey] isKindOfClass:[NSMutableDictionary class]]) {
//            NSMutableDictionary *dictData = [jsonObject valueForKey:getKey];
//            if ([[dictData valueForKey:@"allData"] isKindOfClass:[NSMutableArray class]]) {
//                NSMutableArray *arrAllData = [dictData valueForKey:@"allData"];
//                [arrAllData addObjectsFromArray:arr];
//                [dictData setValue:arrAllData forKey:@"allData"];
//            }else {
//                [dictData setValue:arr forKey:@"allData"];
//            }
//            NSMutableArray *arrDeletedData = [[NSMutableArray alloc]init];
//            if ([[dictData valueForKey:@"deletedData"] isKindOfClass:[NSMutableArray class]]) {
//                arrDeletedData = [dictData valueForKey:@"deletedData"];
//                [arrDeletedData addObjectsFromArray:arrDeleted];
//                [dictData setValue:arrDeletedData forKey:@"deletedData"];
//            }else{
//                arrDeletedData = [arr mutableCopy];
//                [dictData setValue:arrDeleted forKey:@"deletedData"];
//            }
//
//            if ([[dictData valueForKey:@"newData"] isKindOfClass:[NSMutableArray class]]) {
//                NSMutableArray *arrNewData = [dictData valueForKey:@"newData"];
//                if (arrNewData.count <= 0) {
//                    arrNewData = arr;
//                }else{
//                    [arrNewData addObjectsFromArray:arr];
//                }
//                for (NSString *strDeletedUUID in arrDeletedData) {
//                    if (arrNewData.count) {
//                        for (int i=0; i<arrNewData.count-1; i++) {
//                            NSMutableDictionary *dict = arrNewData[i];
//                            NSString *strUUID = [dict objectForKey:@"UUID"];
//                            if ([strDeletedUUID isEqualToString:strUUID]) {
//                                [arrNewData removeObjectAtIndex:i];
//                                break;
//                            }
//                        }
//                    }
//                }
//                [dictData setValue:arrNewData forKey:@"newData"];
//            }else{
//                [dictData setValue:arr forKey:@"newData"];
//            }
//            [jsonObject setObject:dictData forKey:getKey];
//
//        }else{
//            NSMutableDictionary *dictData = [[NSMutableDictionary alloc]init];
//            [dictData setValue:arr forKey:@"allData"];
//            [dictData setValue:arrDeleted forKey:@"deletedData"];
//            NSMutableArray *arrNewData = [arr mutableCopy];
//
//            // Determine which data is new by copying the allData dictionary
//            // and then removing deleted items from it
//            for (NSString *strDeletedUUID in arrDeleted) {
//                if (arrNewData.count) {
//                    for (int i=0; i<arrNewData.count-1; i++) {
//                        NSMutableDictionary *dict = arrNewData[i];
//                        NSString *strUUID = [dict objectForKey:@"UUID"];
//                        if ([strDeletedUUID isEqualToString:strUUID]) {
//                            [arrNewData removeObjectAtIndex:i];
//                            break;
//                        }
//                    }
//                }
//            }
//            [dictData setValue:arrNewData forKey:@"newData"];
//            //[jsonObject setObject:dictData forKey:getKey];
//
//            NSMutableArray *jsonArray = [[NSMutableArray alloc] init];
//            NSString *timeStampString;
//            double timeStampValue;
//            NSTimeInterval timeStampInterval;
//            NSDate *timeStampDate;
//            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//            NSString *dateString;
//
//
//            // Create a new array of dictionary objects that only contains the data we need
//            for (NSDictionary *hkDict in arr) {
//
//                // Convert string to a date
//                timeStampString = [hkDict valueForKey:@"startTimestamp"];
//                timeStampValue = [timeStampString doubleValue] ;
//                timeStampInterval = (NSTimeInterval)timeStampValue;
//                timeStampDate = [NSDate dateWithTimeIntervalSince1970:timeStampInterval];
//                dateString = [dateFormatter stringFromDate:timeStampDate];
//
//                NSDictionary *hkReading = @{ @"value" : [hkDict valueForKey:@"value"],
//                                          @"date" : dateString,
//                               @"h_id" : [hkDict valueForKey:@"UUID"]};
//
//                [jsonArray addObject:hkReading];
//
//            }
//
//            [jsonObject setObject:jsonArray forKey:@"steps"];
//        }
//    }
//
//    //Data Encrypt in File
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:0 error:&err];
//    //NSData *dataWrite = [NSKeyedArchiver archivedDataWithRootObject:jsonObject];
//
//    //Save formate
//    //NSMutableDictionary -> NSData -> NSString -> ENCRPTED String -> NSData
//    NSString *myString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//
//    NSString *encryptedData = [AESCrypt encrypt:myString password:password];
//    //Write in File
//    NSData *dataAfterEncode = [encryptedData dataUsingEncoding:NSUTF8StringEncoding];
//    [dataAfterEncode writeToFile:strLocalPath atomically:YES];
//
//    //Print
//    NSData *dataDecrypt= [NSData dataWithContentsOfFile:strLocalPath];
//    strDecrypt = [[NSString alloc] initWithData:dataDecrypt encoding:NSUTF8StringEncoding];
//    decryptString = [AESCrypt decrypt:strDecrypt password:password];
//
//    dataPrint =[decryptString dataUsingEncoding:NSUTF8StringEncoding];
//    NSMutableDictionary *jsonPrint = (NSMutableDictionary *)[NSJSONSerialization JSONObjectWithData:dataPrint options:NSJSONReadingMutableContainers error:&err];
//    NSString *str = [self bv_jsonStringWithPrettyPrint:true withobject:jsonPrint];
//    NSLog(@"jsonPrint:%@",str);
//
//        jsonPrint = [NSKeyedUnarchiver unarchiveObjectWithData:dataPrint];
//        NSLog(@"jsonPrint:%@",jsonPrint);
//}

-(NSString*) bv_jsonStringWithPrettyPrint:(BOOL) prettyPrint withobject:(NSMutableDictionary *)jsonObject{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0) error:&error];
    if (! jsonData) {
        NSLog(@"%s: error: %@", __func__, error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

-(void)writeDictToFile : (NSString *)typeIdentifier values : (NSString *)value array : (NSMutableArray *)arr {
    NSString *strLocalPath = [self getLocalStoragePath];
    NSError *err;
    NSString *password = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    //Read - OLD DATA
    NSData *dataRead = [NSData dataWithContentsOfFile:strLocalPath];
    NSString *strDecrypt = [[NSString alloc] initWithData:dataRead encoding:NSUTF8StringEncoding];
    NSString *decryptString = [AESCrypt decrypt:strDecrypt password:password];
    
    NSData *dataPrint =[decryptString dataUsingEncoding:NSUTF8StringEncoding];
    NSMutableDictionary *jsonObject = (NSMutableDictionary *)[NSJSONSerialization JSONObjectWithData:dataPrint options:NSJSONReadingMutableContainers error:&err];
    //    NSMutableDictionary *jsonObject = [NSKeyedUnarchiver unarchiveObjectWithData:dataRead];
    if (jsonObject == nil) {
        jsonObject = [[NSMutableDictionary alloc] init];
    }
    
    //Add in dict
    NSString *getKey = [self getDictKeyAndUnit:typeIdentifier keyUnit:1];
    [jsonObject setObject:arr forKey:getKey];
    
    //Data Encrypt in File
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:0 error:&err];
    //NSData *dataWrite = [NSKeyedArchiver archivedDataWithRootObject:jsonObject];
    
    //Save formate
    //NSMutableDictionary -> NSData -> NSString -> ENCRPTED String -> NSData
    NSString *myString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *encryptedData = [AESCrypt encrypt:myString password:password];
    
    //Write in File
    NSData *dataAfterEncode = [encryptedData dataUsingEncoding:NSUTF8StringEncoding];
    [dataAfterEncode writeToFile:strLocalPath atomically:YES];
    
    //Print
    //    NSData *dataDecrypt= [NSData dataWithContentsOfFile:strLocalPath];
    //    strDecrypt = [[NSString alloc] initWithData:dataDecrypt encoding:NSUTF8StringEncoding];
    //    decryptString = [AESCrypt decrypt:strDecrypt password:password];
    //
    //    dataPrint =[decryptString dataUsingEncoding:NSUTF8StringEncoding];
    //    NSMutableDictionary *jsonPrint = (NSMutableDictionary *)[NSJSONSerialization JSONObjectWithData:dataPrint options:NSJSONReadingMutableContainers error:&err];
    //    NSLog(@"jsonPrint:%@",jsonPrint);
    
    //    jsonPrint = [NSKeyedUnarchiver unarchiveObjectWithData:dataPrint];
    //    NSLog(@"jsonPrint:%@",jsonPrint);
}

-(void)readHealthDataFromFile : (RCTResponseSenderBlock)callback {
    //GET Format
    //NSData -> NSString -> DECRYPTEDSTRING -> NSData -> NSMutableDictionary
    
    NSString *strLocalPath = [self getLocalStoragePath];
    
    NSLog(@"0xxxc12. readHealthDataFromFile() strLocalPath:%@", strLocalPath);
    
    //Print
    NSData *dataDecrypt= [NSData dataWithContentsOfFile:strLocalPath];
    NSString *strDecrypt = [[NSString alloc] initWithData:dataDecrypt encoding:NSUTF8StringEncoding];
    NSString *password = [[[UIDevice currentDevice] identifierForVendor] UUIDString]; // IOS 6+
    NSString *decryptString = [AESCrypt decrypt:strDecrypt password:password];
    
    NSData *dataPrint =[decryptString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    NSMutableDictionary *jsonPrint = (NSMutableDictionary *)[NSJSONSerialization JSONObjectWithData:dataPrint options:NSJSONReadingMutableContainers error:&err];
    //NSMutableDictionary *jsonPrint = [NSKeyedUnarchiver unarchiveObjectWithData:dataPrint];
    
    //Print
    //NSData *dataPrint = [NSData dataWithContentsOfFile:strLocalPath];
    //NSMutableDictionary *jsonPrint = [NSKeyedUnarchiver unarchiveObjectWithData:dataPrint];
    if (jsonPrint == nil) {
        jsonPrint = [[NSMutableDictionary alloc] init];
    }
    NSLog(@"jsonPrint:%@",jsonPrint);
    callback(@[@[jsonPrint], [NSNull null]]);
}



-(NSString *)getFolderPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *st=[NSString stringWithFormat:@"/HeadsUpHealth"];
    NSString *dataPath=[documentsDirectory stringByAppendingPathComponent:st];
    return dataPath;
}

-(void)clearHealthDataFromFile :(RCTResponseSenderBlock)callback {
    
    NSLog(@"0xxxc13. clearHealthDataFromFile()");
    
    NSString *strLocalPath = [self getFolderPath];
    NSError *error;
    if ([[NSFileManager defaultManager] isDeletableFileAtPath:strLocalPath]) {
        BOOL success = [[NSFileManager defaultManager] removeItemAtPath:strLocalPath error:&error];
        if (!success) {
            callback(@[@"Failed",error.description]);
        }
        else {
            callback(@[@"Success",[NSNull null]]);
        }
    }
    else {
        callback(@[@"Failed",error.description]);
    }
}

//values : (NSString *)value arrayAddedObject : (NSMutableArray *)arr  values: (NSMutableArray *)arrDeleted

#pragma mark GET Individual Records
-(void)getIndividualRecords : (HKQuantityType *)type
                        unit:(HKUnit *)unit
                   predicate:(NSPredicate *)predicate
                  completion:(void (^)(NSMutableArray *,NSMutableArray *, NSError *, HKQueryAnchor *))completion
{
    NSUInteger limit = HKObjectQueryNoLimit;
    BOOL ascending = false;
    
    [self fetchIndividualRecords:type
                            unit:unit
                       predicate:predicate
                       ascending:ascending
                           limit:limit
                      completion:^(NSArray *results, NSArray *arrDeleted, NSError *error, HKQueryAnchor *anchor) {
                          
                          // Completion handler called from HKAnchoredObjectQuery
                          if(results) {
                              
                              NSMutableArray *arrayAdded = [self createReadingsDictionaryFromArray:results type:type unit:unit];
                              NSMutableArray *arrayDeleted = [arrDeleted mutableCopy];

                              // Call the completion handler
                              completion(arrayAdded, arrayDeleted, nil, anchor);
                          }
                          else {
                              NSLog(@"Error fetching samples from HealthKit: %@", error);
                              completion(nil, nil, error, anchor);
                          }
                      }];
}

-(NSMutableArray *)createReadingsDictionaryFromArray:(NSArray *)results type:(HKQuantityType *)type unit:(HKUnit *)unit
{
    // Create an array of dictionary objects from the query results
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm"];
    HKQuantityType *systolicType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic];
    HKQuantityType *diastolicType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic];
    
    for (int i=0; i<results.count; i++) {
        HKQuantitySample *qty = [results objectAtIndex:i];
        
        NSDate *startDate = qty.startDate;
        NSDate *endDate = qty.endDate;
        
        NSTimeInterval startTimeStamp  = [startDate timeIntervalSince1970];
        NSTimeInterval endTimeStamp  = [endDate timeIntervalSince1970];
        NSString *startTime = [NSString stringWithFormat:@"%f",startTimeStamp];
        NSString *endTime = [NSString stringWithFormat:@"%f",endTimeStamp];
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setValue:startTime forKey:@"startTimestamp"];
        [dict setValue:endTime forKey:@"endTimestamp"];
        [dict setValue:[dateFormatter stringFromDate:startDate] forKey:@"startDate"];
        [dict setValue:[dateFormatter stringFromDate:endDate] forKey:@"endDate"];
        HKQuantity *qtyVal;
        HKQuantity *qtyVal2;
        double doubleValue = 0.0;
        double doubleValue2 = 0.0;
        
        // Check if it's an HKCorrelation
        if ([qty isKindOfClass:[HKCorrelation class]]) {
            HKCorrelation *correlation = (HKCorrelation *)qty;
            
            if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierBloodPressureSystolic"] ||
                [type.identifier isEqualToString:@"HKQuantityTypeIdentifierBloodPressureDiastolic"]) {
                HKQuantitySample *bloodPressureSystolicValue = [correlation objectsForType:systolicType].anyObject;
                HKQuantitySample *bloodPressureDiastolicValue = [correlation objectsForType:diastolicType].anyObject;
                qtyVal = bloodPressureDiastolicValue.quantity;
                qtyVal2 = bloodPressureSystolicValue.quantity;
            }
            NSString *strQTYType = [NSString stringWithFormat:@"%@", correlation.correlationType];
            [dict setValue:strQTYType forKey:@"quantityType"];
            NSString *strSampleType = [NSString stringWithFormat:@"%@",correlation.correlationType];
            [dict setValue:strSampleType forKey:@"sampleType"];
        }
        else if ([qty isKindOfClass:[HKCategorySample class]]) {
            if ([type.identifier isEqualToString:HKCategoryTypeIdentifierSleepAnalysis]) {
                HKCategorySample * categorySample = (HKCategorySample *)qty;
                NSString *strSleepValue;
                switch (categorySample.value) {
                    case HKCategoryValueSleepAnalysisInBed:
                        strSleepValue = @"In Bed";
                        break;
                    case HKCategoryValueSleepAnalysisAsleep:
                        strSleepValue = @"Asleep";
                        break;
                    case HKCategoryValueSleepAnalysisAwake:
                        strSleepValue = @"Awake";
                        break;
                    default:
                        break;
                }
                [dict setValue:strSleepValue forKey:@"value"];
            }
        }
        else {
            qtyVal = qty.quantity;
            NSString *strQTYType = [NSString stringWithFormat:@"%@",qty.quantityType];
            [dict setValue:strQTYType forKey:@"quantityType"];
            NSString *strSampleType = [NSString stringWithFormat:@"%@",qty.quantityType];
            [dict setValue:strSampleType forKey:@"sampleType"];
        }
        
        // TODO: Test this
        // Derive the unit - mmHg for blood pressure
        if (qtyVal != nil) {
                    NSString *strQtyValue = [NSString stringWithFormat:@"%@", qtyVal];
            NSArray *arrSplitValueUnit = [strQtyValue componentsSeparatedByString:@" "];
            NSString *strUnit = @"";
            if (arrSplitValueUnit.count >= 2) {
                strUnit = [arrSplitValueUnit objectAtIndex:1];
            }
            else {
                NSString *qtyTypeIdentifier = [NSString stringWithFormat:@"%@",qty.quantityType];
                strUnit = [self getDictKeyAndUnit:qtyTypeIdentifier keyUnit:2];
            }
            
            if ([type.identifier isEqualToString:HKQuantityTypeIdentifierHeartRate] || [type.identifier isEqualToString:HKQuantityTypeIdentifierRespiratoryRate]) {
                doubleValue = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count/min"]];
            }
            else if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBodyMassIndex]) {
                doubleValue = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count"]];
            }
            else if ([type.identifier isEqualToString:HKQuantityTypeIdentifierFlightsClimbed]) {
                doubleValue = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count"]];
            }
            else {
                // TODO: See if this should be derived from HK or specified by HU
                unit = [HKUnit unitFromString:strUnit];
                doubleValue = [qtyVal doubleValueForUnit:unit];
                if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBloodGlucose] && [strUnit hasPrefix:@"mmol"]) {
                    strUnit = @"mmol/L";
                }
            }
            [dict setValue:strUnit forKey:@"unit"];
            
            if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic] ||
                [type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic]) {
                int intValue = (int)floor(doubleValue);
                [dict setValue:[NSString stringWithFormat:@"%i",intValue] forKey:@"value"];
            }
            else {
                NSString *strQTY = [NSString stringWithFormat:@"%f",doubleValue];
                [dict setValue:strQTY forKey:@"value"];
            }
        }
        
        // Need to get second value if it's a correlation
        if ([qty isKindOfClass:[HKCorrelation class]]) {
            doubleValue2 = [qtyVal2 doubleValueForUnit:unit];
            if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic] ||
                [type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic]) {
                int intValue = (int)floor(doubleValue2);
                [dict setValue:[NSString stringWithFormat:@"%i",intValue] forKey:@"value2"];
            }
            else {
                NSString *strQTY2 = [NSString stringWithFormat:@"%f",doubleValue2];
                [dict setValue:strQTY2 forKey:@"value2"];
            }
        }
        
        NSString *strSourceName = qty.sourceRevision.source.name;
        [dict setValue:strSourceName forKey:@"source"];
        
        NSString *strUUID = [NSString stringWithFormat:@"%@",qty.UUID];
        [dict setValue:strUUID forKey:@"UUID"];
        
        NSString *strDevice = [NSString stringWithFormat:@"%@",qty.device];
        [dict setValue:strDevice forKey:@"device"];
        
        if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBloodGlucose]) {
            NSObject * mealTag = [qty.metadata objectForKey:@"HKBloodGlucoseMealTime"];
            if (mealTag) {
                NSNumber *mealTagNumber = (NSNumber *)mealTag;
                if ([mealTagNumber intValue] == 1) {
                     [dict setValue:@"before" forKey:@"meal_tag"];
                }
                else if ([mealTagNumber intValue] == 2) {
                [dict setValue:@"2hr" forKey:@"meal_tag"];
                }
                else {
                    [dict setValue:@"" forKey:@"meal_tag"];
                }
            }
            else {
                [dict setValue:@"" forKey:@"meal_tag"];
            }
        }
        
        //NSLog(@"dict:%@",dict);
        [arr addObject:dict];
    }
    return arr;
}

-(void)fetchIndividualRecords :(HKQuantityType *)type unit:(HKUnit *)unit predicate:(NSPredicate *)predicate ascending:(BOOL)asc limit:(NSUInteger)lim completion:(void (^)(NSArray *,NSArray *, NSError *, HKQueryAnchor *))completion {
    
    HKQueryAnchor *newAnchor = nil;
    
    // Check for an existing anchor object for this type IF no predicate w/ start/end dates has been passed
    // If no anchor exists, newAnchor == nil, which retrieves all records for the type
    if (predicate == nil && [[NSUserDefaults standardUserDefaults]valueForKey:[NSString stringWithFormat:@"newAnchor%@",type.identifier]] != nil) {

        // Anchor exists, use it
        newAnchor = [self loadCustomObjectWithKey:[NSString stringWithFormat:@"newAnchor%@",type.identifier]];
    }
    
    if (newAnchor) {
        NSLog(@"00xxxc8 fetchIndividualRecords() newAnchor is NOT nil");
    }
    else {
        NSLog(@"00xxxc8 fetchIndividualRecords() newAnchor is nil");
    }
    
    HKSampleType *sampleType = type;
    // If Diastolic or Systolic blood pressure, convert to Blood Pressure correlation type
    if ([type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic] ||
        [type.identifier isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic]) {
        sampleType = [HKCorrelationType correlationTypeForIdentifier:HKCorrelationTypeIdentifierBloodPressure];
    }
    
    // Create the anchored object query
    HKAnchoredObjectQuery *query =
        [[HKAnchoredObjectQuery alloc]initWithType:sampleType
                                         predicate:predicate
                                            anchor:newAnchor
                                             limit:HKObjectQueryNoLimit
                                    resultsHandler:^(HKAnchoredObjectQuery * _Nonnull query,
                                                     NSArray<__kindof HKSample *> * _Nullable sampleObjects,
                                                     NSArray<HKDeletedObject *> * _Nullable deletedObjects,
                                                     HKQueryAnchor * _Nullable newAnchor,
                                                     NSError * _Nullable error) {
                                                                   
            NSLog(@"00xxxc10 HKAnchoredObjectQuery resultsHandler() Type:%@ sampleObjects.count:%lu deletedObjects.count:%lu",
                  type.identifier,
                  (unsigned long)sampleObjects.count,
                  (unsigned long)deletedObjects.count);
        
            NSMutableArray *arrUUID = [[NSMutableArray alloc]init];
        
            for (HKDeletedObject *objdelete in deletedObjects) {
                NSString *strUUID = [NSString stringWithFormat:@"%@",objdelete.UUID];
                [arrUUID addObject:strUUID];
            }

            // If start/end dates have been passed, don't return an anchor
            if (predicate != nil) {
                newAnchor = nil;
            }
            completion(sampleObjects, arrUUID, error, newAnchor);
        }];
    
    NSLog(@"00xxxc9 fetchIndividualRecords() execute query");
    
    [self.healthStore executeQuery:query];
    
}

#pragma mark GET Category Queries Result
-(void)getCategoryQueriesResult : (HKQuantityType *)type unit:(HKUnit *)unit {
    NSUInteger limit = HKObjectQueryNoLimit;
    BOOL ascending = false;
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [NSDate date];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone];
    [self fetchCategoryOfType:type unit:unit predicate:predicate ascending:ascending limit:limit completion:^(NSString *results, NSError *error, HKCategorySample *sample) {
        if(results){
            [self convertDataToArrayForCategory:type.identifier values:results qty:sample];
        } else {
            NSLog(@"error getting samples: %@", error);
        }
    }];
}

-(void)fetchCategoryOfType:(HKQuantityType *)type unit:(HKUnit *)unit predicate:(NSPredicate *)predicate ascending:(BOOL)asc limit:(NSUInteger)lim completion:(void (^)(NSString *, NSError *, HKCategorySample *sample))completion {
    
    HKSampleQuery *qry = [[HKSampleQuery alloc] initWithSampleType:type predicate:nil limit:HKObjectQueryNoLimit sortDescriptors:nil resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        NSString *strSleepValue = @"";
        for (HKCategorySample *sample in results) {
            switch (sample.value) {
                case HKCategoryValueSleepAnalysisInBed:
                    strSleepValue = @"In Bed";
                    break;
                case HKCategoryValueSleepAnalysisAsleep:
                    strSleepValue = @"Asleep";
                    break;
                case HKCategoryValueSleepAnalysisAwake:
                    strSleepValue = @"Awake";
                    break;
                default:
                    break;
            }
            completion(strSleepValue,error,sample);
        }
    }];
    [self.healthStore executeQuery:qry];
}

#pragma mark GET Other Queries Result
-(void)getOtherQueriesResult : (HKQuantityType *)type unit:(HKUnit *)unit {
    NSUInteger limit = HKObjectQueryNoLimit;
    BOOL ascending = false;
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [NSDate date];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone];
    
    [self fetchSamplesOfType:type unit:unit predicate:predicate ascending:ascending limit:limit completion:^(NSArray *results, NSError *error) {
        if(results){
            
            for (HKQuantitySample *sample in results) {
                NSString *qtyType = [NSString stringWithFormat:@"%@",sample.quantity];
                [self convertDataToArray:type.identifier values:qtyType qty:sample unit:unit];
            }
        } else {
            NSLog(@"error getting samples: %@", error);
        }
    }];
}

-(void)fetchSamplesOfType:(HKQuantityType *)type unit:(HKUnit *)unit predicate:(NSPredicate *)predicate ascending:(BOOL)asc limit:(NSUInteger)lim completion:(void (^)(NSArray *, NSError *))completion {
    HKSampleQuery *qry = [[HKSampleQuery alloc] initWithSampleType:type predicate:nil limit:HKObjectQueryNoLimit sortDescriptors:nil resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        completion(results,error);
    }];
    [self.healthStore executeQuery:qry];
}
//Over

-(void)getModuleInfo:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
    NSDictionary *info = @{
                           @"name" : @"react-native-apple-healthkit",
                           @"description" : @"A React Native bridge module for interacting with Apple HealthKit data",
                           @"className" : @"RCTAppleHealthKit",
                           @"author": @"Greg Wilson",
                           };
    callback(@[[NSNull null], info]);
}

@end
