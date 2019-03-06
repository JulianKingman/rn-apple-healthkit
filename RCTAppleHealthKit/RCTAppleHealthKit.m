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

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(isAvailable:(RCTResponseSenderBlock)callback)
{
    [self isHealthKitAvailable:callback];
}

//Akshay
RCT_EXPORT_METHOD(readHealthData:(RCTResponseSenderBlock)callback)
{
    [self readHealthDataFromFile:callback];
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

-(void)isHealthKitAvailable:(RCTResponseSenderBlock)callback {
    BOOL isAvailable = NO;
    if ([HKHealthStore isHealthDataAvailable]) {
        isAvailable = YES;
    }
    callback(@[[NSNull null], @(isAvailable)]);
}

-(void)initializeHealthKit:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback {
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
                NSLog(@"errMsg:%@",errMsg);
                callback(@[RCTMakeError(errMsg, nil, nil)]);
                return;
            } else {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    //Akshay
                    [self setUpBackgroundDeliveryForDataTypes:readDataTypes];
                    //Over
                    callback(@[[NSNull null], @true]);
                });
            }
        }];

        //Akshay
//        NSArray* observers = [input objectForKey:@"observers"];
//        // Start observers, if they're defined
//        if(observers != nil) {
//            RCTLogInfo(@"Starting Observers");
//          for(int i=0; i<[observers count]; i++) {
//            NSDictionary *observer = observers[i];//NSString to NSDictionary Akshay
//            if(observer != nil) {
//                NSString *str = [observer objectForKey:@"type"];
//                NSDictionary *dict = [self readPermsDict];
//                HKSampleType *objType = [dict valueForKey:str];
//                //Akshay
//                //[self setUpBackgroundDeliveryForSingleObjectType:objType];
//                //Over
//                
////                [self observers_initializeEventObserverForType:observer callback:^(NSArray* results) {
////                    NSLog(@"Observed");
////                }];
//            }
//          }
//        }
    } else {
        callback(@[RCTMakeError(@"HealthKit data is not available", nil, nil)]);
    }
}

//Akshay
-(void)setUpBackgroundDeliveryForDataTypes :(NSSet*) types {
    for (id key in types) {
        //NSSet *requestSampleUnit = [NSSet setWithObject:key];        
//        [self.healthStore preferredUnitsForQuantityTypes:requestSampleUnit completion:^(NSDictionary<HKQuantityType *,HKUnit *> * _Nonnull preferredUnits, NSError * _Nullable error) {
//            NSLog(@"preferredUnits:%@ preferredUnits:%@",key,preferredUnits[key]);
//        }];
        
        if ([key isKindOfClass:HKSampleType.class]) {
            HKObserverQuery *query = [[HKObserverQuery alloc] initWithSampleType:key predicate:nil updateHandler:^(HKObserverQuery * _Nonnull query, HKObserverQueryCompletionHandler  _Nonnull completionHandler, NSError * _Nullable error) {
                [self queryForUpdates:key];
//                [_bridge.eventDispatcher sendAppEventWithName:@"change:observed" body:key];
                completionHandler();
            }];
            
            [self.healthStore executeQuery:query];
            [self.healthStore enableBackgroundDeliveryForType:key frequency:HKUpdateFrequencyImmediate withCompletion:^(BOOL success, NSError * _Nullable error) {
                NSLog(@"enableBackgroundDeliveryForType handler called for %@ - success: %d error:%@",key, success,error.description);
            }];
        }
    }
}

-(void)queryForUpdates:(HKQuantityType *)type {
    NSString *str = type.identifier;
    if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatMonounsaturated]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatPolyunsaturated]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatSaturated]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFatTotal]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFiber]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryFolate]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryIodine]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryIron]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryMagnesium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryManganese]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryMolybdenum]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryNiacin]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPantothenicAcid]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPhosphorus]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryPotassium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryProtein]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryRiboflavin]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySelenium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySodium]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietarySugar]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryThiamin]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminA]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB12]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminB6]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminC]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminD]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminE]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryVitaminK]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryZinc]) {
        [self getIndividualRecords:type unit:[HKUnit gramUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDietaryWater]) {
        [self getIndividualRecords:type unit:[HKUnit literUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierHeartRate]) {//DONE EARLIER
        [self getIndividualRecords:type unit:[HKUnit countUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit countUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierLeanBodyMass]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit poundUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit poundUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodPressureDiastolic]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit pascalUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit pascalUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodPressureSystolic]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit pascalUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit pascalUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyMassIndex]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit mileUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit mileUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyFatPercentage]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit percentUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit percentUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBodyTemperature]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit degreeCelsiusUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit degreeCelsiusUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierRespiratoryRate]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit countUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit countUnit] sumAvg:@"AVG"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDistanceCycling]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit mileUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit mileUnit] sumAvg:@"SUM"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierStepCount]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit countUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit countUnit] sumAvg:@"SUM"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierActiveEnergyBurned]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit kilocalorieUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit kilocalorieUnit] sumAvg:@"SUM"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBasalEnergyBurned]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit kilocalorieUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit kilocalorieUnit] sumAvg:@"SUM"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierDistanceWalkingRunning]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit mileUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit mileUnit] sumAvg:@"SUM"];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierFlightsClimbed]) {//DONE
        [self getIndividualRecords:type unit:[HKUnit kilocalorieUnit]];
//        [self getQueriesResultSumAvg:type unit:[HKUnit kilocalorieUnit] sumAvg:@"SUM"];
    }
    else if ([str isEqualToString:HKCategoryTypeIdentifierSleepAnalysis]) {//Done
        [self getCategoryQueriesResult:type unit:[HKUnit kilocalorieUnit]];
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
        [self getOtherQueriesResult:type unit:[HKUnit poundUnit]];
    }
    else if ([str isEqualToString:HKQuantityTypeIdentifierBloodGlucose]) {//DONE
        [self getOtherQueriesResult:type unit:[HKUnit poundUnit]];
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
    
    [self writeDictNewDataToFile:typeIdentifier values:nil arrayAddedObject:arr values:nil];
    //[self writeDictToFile:typeIdentifier values:nil array:arr];
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
    
    [self writeDictNewDataToFile:typeIdentifier values:nil arrayAddedObject:arr values:nil];
    //[self writeDictToFile:typeIdentifier values:nil array:arr];
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
    
    [self writeDictNewDataToFile:typeIdentifier values:nil arrayAddedObject:arr values:nil];
    //[self writeDictToFile:typeIdentifier values:nil array:arr];
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

-(void)writeDictNewDataToFile : (NSString *)typeIdentifier values : (NSString *)value arrayAddedObject : (NSMutableArray *)arr  values: (NSMutableArray *)arrDeleted {
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
    if ([self isCharacterSticsOrNot:typeIdentifier]) {
        [jsonObject setObject:arr forKey:getKey];
    } else {
        if ([[jsonObject valueForKey:getKey] isKindOfClass:[NSMutableDictionary class]]) {
            NSMutableDictionary *dictData = [jsonObject valueForKey:getKey];
            if ([[dictData valueForKey:@"allData"] isKindOfClass:[NSMutableArray class]]) {
                NSMutableArray *arrAllData = [dictData valueForKey:@"allData"];
                [arrAllData addObjectsFromArray:arr];
                [dictData setValue:arrAllData forKey:@"allData"];
            }else {
                [dictData setValue:arr forKey:@"allData"];
            }
            NSMutableArray *arrDeletedData = [[NSMutableArray alloc]init];
            if ([[dictData valueForKey:@"deletedData"] isKindOfClass:[NSMutableArray class]]) {
                arrDeletedData = [dictData valueForKey:@"deletedData"];
                [arrDeletedData addObjectsFromArray:arrDeleted];
                [dictData setValue:arrDeletedData forKey:@"deletedData"];
            }else{
                arrDeletedData = [arr mutableCopy];
                [dictData setValue:arrDeleted forKey:@"deletedData"];
            }
            
            if ([[dictData valueForKey:@"newData"] isKindOfClass:[NSMutableArray class]]) {
                NSMutableArray *arrNewData = [dictData valueForKey:@"newData"];
                if (arrNewData.count <= 0) {
                    arrNewData = arr;
                }else{
                    [arrNewData addObjectsFromArray:arr];
                }
                for (NSString *strDeletedUUID in arrDeletedData) {
                    if (arrNewData.count) {
                        for (int i=0; i<arrNewData.count-1; i++) {
                            NSMutableDictionary *dict = arrNewData[i];
                            NSString *strUUID = [dict objectForKey:@"UUID"];
                            if ([strDeletedUUID isEqualToString:strUUID]) {
                                [arrNewData removeObjectAtIndex:i];
                                break;
                            }
                        }
                    }
                }
                [dictData setValue:arrNewData forKey:@"newData"];
            }else{
                [dictData setValue:arr forKey:@"newData"];
            }
            [jsonObject setObject:dictData forKey:getKey];
            
        }else{
            NSMutableDictionary *dictData = [[NSMutableDictionary alloc]init];
            [dictData setValue:arr forKey:@"allData"];
            [dictData setValue:arrDeleted forKey:@"deletedData"];
            NSMutableArray *arrNewData = [arr mutableCopy];
            
            for (NSString *strDeletedUUID in arrDeleted) {
                if (arrNewData.count) {
                    for (int i=0; i<arrNewData.count-1; i++) {
                        NSMutableDictionary *dict = arrNewData[i];
                        NSString *strUUID = [dict objectForKey:@"UUID"];
                        if ([strDeletedUUID isEqualToString:strUUID]) {
                            [arrNewData removeObjectAtIndex:i];
                            break;
                        }
                    }
                }
            }
            [dictData setValue:arrNewData forKey:@"newData"];
            [jsonObject setObject:dictData forKey:getKey];
        }
    }
    
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
//    NSString *str = [self bv_jsonStringWithPrettyPrint:true withobject:jsonPrint];
//    NSLog(@"jsonPrint:%@",str);
    
    //    jsonPrint = [NSKeyedUnarchiver unarchiveObjectWithData:dataPrint];
    //    NSLog(@"jsonPrint:%@",jsonPrint);
}

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

#pragma mark GET Individual Records
-(void)getIndividualRecords : (HKQuantityType *)type unit:(HKUnit *)unit {
    NSUInteger limit = HKObjectQueryNoLimit;
    BOOL ascending = false;
   
    [self fecthIndividualRecords:type unit:unit predicate:nil ascending:ascending limit:limit completion:^(NSArray *results,NSArray *arrDeleted, NSError *error) {
        if(results){
            NSMutableArray *arr = [[NSMutableArray alloc] init];
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
                
                HKQuantity *qtyVal = qty.quantity;
                double doubleValue = 0.0;
                if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierHeartRate"] || [type.identifier isEqualToString:@"HKQuantityTypeIdentifierRespiratoryRate"]) {
                    doubleValue = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count/min"]];
                }
                else if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierBodyMassIndex"]) {
                    doubleValue = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count"]];
                }
                else if ([type.identifier isEqualToString:@"HKQuantityTypeIdentifierFlightsClimbed"]) {
                    doubleValue = [qtyVal doubleValueForUnit:[HKUnit unitFromString:@"count"]];
                }
                else {
                    doubleValue = [qtyVal doubleValueForUnit:unit];
                }
                
                NSString *strSourceName = qty.sourceRevision.source.name;
                [dict setValue:strSourceName forKey:@"source"];
                
                NSString *strQTY = [NSString stringWithFormat:@"%f",doubleValue];
                [dict setValue:strQTY forKey:@"value"];
                
                NSString *strUUID = [NSString stringWithFormat:@"%@",qty.UUID];
                [dict setValue:strUUID forKey:@"UUID"];
                
                NSString *strQTYType = [NSString stringWithFormat:@"%@",qty.quantityType];
                [dict setValue:strQTYType forKey:@"quantityType"];
                
                NSString *strDevice = [NSString stringWithFormat:@"%@",qty.device];
                [dict setValue:strDevice forKey:@"device"];
                
                NSString *strSampleType = [NSString stringWithFormat:@"%@",qty.quantityType];
                [dict setValue:strSampleType forKey:@"sampleType"];
                //NSLog(@"dict:%@",dict);
                [arr addObject:dict];
            }
            [self writeDictNewDataToFile:type.identifier values:nil arrayAddedObject:arr values:[arrDeleted mutableCopy]];
            //[self writeDictToFile:type.identifier values:nil array:arr];
        }
        else {
            NSLog(@"Error fetching samples from HealthKit: %@", error);
        }
    }];
}

-(void)fecthIndividualRecords :(HKQuantityType *)type unit:(HKUnit *)unit predicate:(NSPredicate *)predicate ascending:(BOOL)asc limit:(NSUInteger)lim completion:(void (^)(NSArray *,NSArray *, NSError *))completion {
    HKQueryAnchor *newAnchor = nil;
    if ([[NSUserDefaults standardUserDefaults]valueForKey:[NSString stringWithFormat:@"newAnchor%@",type.identifier]] != nil) {
        newAnchor = [self loadCustomObjectWithKey:[NSString stringWithFormat:@"newAnchor%@",type.identifier]];
    }
    
    HKAnchoredObjectQuery *query = [[HKAnchoredObjectQuery alloc]initWithType:type predicate:nil anchor:newAnchor limit:HKObjectQueryNoLimit resultsHandler:^(HKAnchoredObjectQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable sampleObjects, NSArray<HKDeletedObject *> * _Nullable deletedObjects, HKQueryAnchor * _Nullable newAnchor, NSError * _Nullable error) {
        NSMutableArray *arrUUID = [[NSMutableArray alloc]init];
        for (HKDeletedObject *objdelete in deletedObjects) {
            NSString *strUUID = [NSString stringWithFormat:@"%@",objdelete.UUID];
            [arrUUID addObject:strUUID];
        }
        
        [self saveCustomObject:newAnchor withKey:[NSString stringWithFormat:@"newAnchor%@",type.identifier]];
        
        completion(sampleObjects,arrUUID,error);
    }];
    /*
    HKSampleQuery *qry = [[HKSampleQuery alloc] initWithSampleType:type predicate:nil limit:HKObjectQueryNoLimit sortDescriptors:nil resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        completion(results,error);
    }];
    [self.healthStore executeQuery:qry];
     */
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

#pragma mark NOT IN USED - GET AVERAGE AND SUM For Queries
/*
-(void)writeDictToFile : (NSString *)typeIdentifier values : (NSString *)value {
    NSString *strLocalPath = [self getLocalStoragePath];
    
    if (value == nil || [value isEqualToString:@""] || [value isEqualToString:@"(null)"]) {
        NSData *dataPrint = [NSData dataWithContentsOfFile:strLocalPath];
        NSMutableDictionary *jsonPrint = [NSKeyedUnarchiver unarchiveObjectWithData:dataPrint];
        [jsonPrint removeObjectForKey:typeIdentifier];
        
        NSData *dataWrite = [NSKeyedArchiver archivedDataWithRootObject:jsonPrint];
        [dataWrite writeToFile:strLocalPath atomically:YES];
        return;
    }
    
    //Read
    NSData *dataRead = [NSData dataWithContentsOfFile:strLocalPath];
    NSMutableDictionary *jsonObject = [NSKeyedUnarchiver unarchiveObjectWithData:dataRead];
    if (jsonObject == nil) {
        jsonObject = [[NSMutableDictionary alloc] init];
    }
    [jsonObject setObject:value forKey:typeIdentifier];
    
    //Write
    NSData *dataWrite = [NSKeyedArchiver archivedDataWithRootObject:jsonObject];
    [dataWrite writeToFile:strLocalPath atomically:YES];
    
    //Print
    NSData *dataPrint = [NSData dataWithContentsOfFile:strLocalPath];
    NSMutableDictionary *jsonPrint = [NSKeyedUnarchiver unarchiveObjectWithData:dataPrint];
    NSLog(@"jsonPrint:%@",jsonPrint);
}

-(void)getQueriesResultSumAvg : (HKQuantityType *)type unit:(HKUnit *)unit sumAvg:(NSString *)sumAvg {
    NSUInteger limit = HKObjectQueryNoLimit;
    BOOL ascending = false;
    NSDate *startDate = [NSDate date];
    NSDate *endDate = [NSDate date];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone];
    [self fetchSamplesOfTypeSUM:type unit:unit predicate:predicate ascending:ascending limit:limit sumAvg:sumAvg completion:^(HKStatistics *result,HKQuantityType *type, NSError *error) {
        if(result){
            if ([sumAvg isEqualToString:@"SUM"]) {
                NSString *sumQty = [NSString stringWithFormat:@"%@",result.sumQuantity];
                [self writeDictToFile:type.identifier values:sumQty];
            }
            else {
                NSString *avgQty = [NSString stringWithFormat:@"%@",result.averageQuantity];
                [self writeDictToFile:type.identifier values:avgQty];
            }
        } else {
            NSLog(@"error getting samples: %@", error);
        }
    }];
}

-(void)fetchSamplesOfTypeSUM:(HKQuantityType *)type unit:(HKUnit *)unit predicate:(NSPredicate *)predicate ascending:(BOOL)asc limit:(NSUInteger)lim sumAvg:(NSString *)sumAvg completion:(void (^)(HKStatistics *, HKQuantityType *, NSError *))completion {
    HKStatisticsOptions stateOption;
    if ([sumAvg isEqualToString:@"SUM"]) {
        stateOption = HKStatisticsOptionCumulativeSum;
    }
    else {
        stateOption = HKStatisticsOptionDiscreteAverage;
    }
    
    HKStatisticsQuery *qryState = [[HKStatisticsQuery alloc] initWithQuantityType:type quantitySamplePredicate:nil options:stateOption completionHandler:^(HKStatisticsQuery * _Nonnull query, HKStatistics * _Nullable result, NSError * _Nullable error) {
        completion(result,type, error);
    }];
    [self.healthStore executeQuery:qryState];
}

-(void)setUpBackgroundDeliveryForSingleObjectType :(HKSampleType *) key {
    HKObserverQuery *query = [[HKObserverQuery alloc] initWithSampleType:key predicate:nil updateHandler:^(HKObserverQuery * _Nonnull query, HKObserverQueryCompletionHandler  _Nonnull completionHandler, NSError * _Nullable error) {
        
        UILocalNotification *notification =  [[UILocalNotification alloc] init];
        notification.fireDate = NSDate.date;
        notification.alertTitle = @"HealthKit";
        notification.alertBody = [NSString stringWithFormat:@"%@",key];
        notification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        [self queryForUpdates:key];
        
        [_bridge.eventDispatcher sendAppEventWithName:@"change:observed" body:key.identifier];
        completionHandler();
    }];
    
    [self.healthStore executeQuery:query];
    [self.healthStore enableBackgroundDeliveryForType:key frequency:HKUpdateFrequencyImmediate withCompletion:^(BOOL success, NSError * _Nullable error) {
        NSLog(@"enableBackgroundDeliveryForType handler called for %@ - success: %d error:%@",key, success,error.description);
    }];
}
*/
@end
