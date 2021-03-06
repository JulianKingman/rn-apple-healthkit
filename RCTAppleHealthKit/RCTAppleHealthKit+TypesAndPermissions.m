//
//  RCTAppleHealthKit+TypesAndPermissions.m
//  RCTAppleHealthKit
//
//  Created by Greg Wilson on 2016-06-26.
//  Copyright © 2016 Greg Wilson. All rights reserved.
//

#import "RCTAppleHealthKit+TypesAndPermissions.h"

@implementation RCTAppleHealthKit (TypesAndPermissions)


#pragma mark - HealthKit Permissions

- (NSDictionary *)readPermsDict {
    NSDictionary *readPerms;
    if (@available(iOS 11.0, *)) {
        readPerms = @{
          @"Weight" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
          @"BodyMassIndex" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
          @"Steps" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
          @"HeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate],
          @"HeartRateVariability" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRateVariabilitySDNN],
          @"BloodPressureSystolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic],
          @"BloodPressureDiastolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic],
          @"BloodPressure" : [HKCorrelationType correlationTypeForIdentifier:HKCorrelationTypeIdentifierBloodPressure],
          @"BloodGlucose" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose],
          @"SleepAnalysis" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis],
          @"MindfulSession" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession],
          @"Protein" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
          @"Carbohydrates" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
          @"FatMonounsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated],
          @"FatPolyunsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated],
          @"FatSaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated],
          @"FatTotal" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
          @"EnergyConsumed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
          @"BodyFatPercentage" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage],
          @"WaistCircumference" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierWaistCircumference],
          @"RestingHeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRestingHeartRate],
          @"OxygenSaturation" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierOxygenSaturation],
          @"RespiratoryRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRespiratoryRate],
          @"VO2Max" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierVO2Max],
          @"ActiveEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
          @"BasalBodyTemperature" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalBodyTemperature],
          @"BodyTemperature" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature],
             
//          @"DateOfBirth" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
//          @"Height" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
//          @"BiologicalSex" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
            //        @"LeanBodyMass" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierLeanBodyMass],
            // Fitness Identifiers
            //        @"DistanceWalkingRunning" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
            //        @"DistanceCycling" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling],
            //        @"BasalEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned],
            //        @"FlightsClimbed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed],
            //        @"NikeFuel" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierNikeFuel],
            ////        @"AppleExerciseTime" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleExerciseTime],
            //        // Nutrition Identifiers
            //        // Vital Signs Identifiers
            //        // Results Identifiers

            //
            //        @"Fiber" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber],
            //        @"Folate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate],
            //        @"Iodine" : [HKObjectType quantityTypeForIdentifier:HKQuantityType    IdentifierDietaryIodine],
            //        @"Iron" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron],
            //        @"Magnesium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium],
            //        @"Manganese" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese],
            //        @"Molybdenum" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum],
            //        @"Niacin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin],
            //        @"PantothenicAcid" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid],
            //        @"Phosphorus" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus],
            //        @"Potassium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium],
            //        @"Riboflavin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin],
            //        @"Selenium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium],
            //        @"Sodium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium],
            //        @"Sugar" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar],
            //        @"Thiamin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin],
            //        @"VitaminA" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA],
            //        @"VitaminB12" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12],
            //        @"VitaminB6" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6],
            //        @"VitaminC" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC],
            //        @"VitaminD" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD],
            //        @"VitaminE" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE],
            //        @"VitaminK" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK],
            //        @"Zinc" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc],
            //        @"Water" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater],
            
        };
        return readPerms;
    } else {
        readPerms = @{
                      @"Weight" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
                      @"BodyMassIndex" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
                      @"Steps" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                      @"HeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate],
                      @"BloodPressureSystolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic],
                      @"BloodPressureDiastolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic],
                      @"BloodGlucose" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose],
                      @"SleepAnalysis" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis],
                      @"MindfulSession" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession],
                      @"Protein" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
                      @"Carbohydrates" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
                      @"FatMonounsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated],
                      @"FatPolyunsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated],
                      @"FatSaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated],
                      @"FatTotal" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
                      @"EnergyConsumed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
                      @"DateOfBirth" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
                      @"Height" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
                      @"BodyFatPercentage" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage],
                      @"OxygenSaturation" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierOxygenSaturation],
                      @"RespiratoryRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRespiratoryRate],
                      @"ActiveEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
                      @"BasalBodyTemperature" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalBodyTemperature],
                      @"BodyTemperature" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyTemperature],
                         
//                      @"BiologicalSex" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
//                    @"LeanBodyMass" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierLeanBodyMass],
//            //      Fitness Identifiers
//                    @"DistanceWalkingRunning" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
//                    @"DistanceCycling" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling],
//                    @"BasalEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned],
//                    @"ActiveEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
//                    @"FlightsClimbed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed],
//                    @"NikeFuel" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierNikeFuel],
//            //        @"AppleExerciseTime" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierAppleExerciseTime],
//                    // Nutrition Identifiers
//                    // Vital Signs Identifiers            //        @"RespiratoryRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRespiratoryRate],
//                    // Results Identifiers
//            
//                    @"Fiber" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber],
//                    @"Folate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate],
//                    @"Iodine" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIodine],
//                    @"Iron" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron],
//                    @"Magnesium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium],
//                    @"Manganese" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese],
//                    @"Molybdenum" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum],
//                    @"Niacin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin],
//                    @"PantothenicAcid" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid],
//                    @"Phosphorus" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus],
//                    @"Potassium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium],
//                    @"Riboflavin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin],
//                    @"Selenium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium],
//                    @"Sodium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium],
//                    @"Sugar" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar],
//                    @"Thiamin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin],
//                    @"VitaminA" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA],
//                    @"VitaminB12" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12],
//                    @"VitaminB6" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6],
//                    @"VitaminC" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC],
//                    @"VitaminD" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD],
//                    @"VitaminE" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE],
//                    @"VitaminK" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK],
//                    @"Zinc" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc],
//                    @"Water" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater],
        };
        return readPerms;
    }
}


- (NSDictionary *)writePermsDict {
    NSDictionary *writePerms;
    
    if (@available(iOS 11.0, *)) {
        writePerms = @{
// Body Measurements
//          @"Weight" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
//          @"BodyMassIndex" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
//          @"Steps" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
//          @"HeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate],
//          @"HeartRateVariability" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRateVariabilitySDNN],
//          @"BloodPressureSystolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic],
//          @"BloodPressureDiastolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic],
//          @"BloodGlucose" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose],
//          // Sleep
//          @"SleepAnalysis" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis],
//          // Mindfulness
//          @"MindfulSession" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession],
//          @"Protein" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
//          @"Carbohydrates" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
//          @"FatMonounsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated],
//          @"FatPolyunsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated],
//          @"FatSaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated],
//          @"FatTotal" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
//          @"EnergyConsumed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
//          // Characteristic Identifiers
//          @"DateOfBirth" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
//          // Body Measurements
//          @"Height" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
//          @"BodyFatPercentage" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage],
//          @"WaistCircumference" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierWaistCircumference],
//          @"RestingHeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRestingHeartRate],
//            @"OxygenSaturation" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierOxygenSaturation],
//        @"RespiratoryRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRespiratoryRate],
//        @"VO2Max" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierVO2Max],
//        @"ActiveEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
//         @"BasalBodyTemperature" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalBodyTemperature],
            
//        @"LeanBodyMass" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierLeanBodyMass],
//        // Fitness Identifiers
//        @"DistanceWalkingRunning" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
//        @"DistanceCycling" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling],
//        @"BasalEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned],
//        @"ActiveEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
//        @"FlightsClimbed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed],
//        // Nutrition Identifiers
//        @"Biotin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryBiotin],
//        @"Caffeine" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCaffeine],
//        @"Calcium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium],
//        @"Chloride" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryChloride],
//        @"Cholesterol" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCholesterol],
//        @"Copper" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCopper],
//        @"EnergyConsumed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
//        @"Fiber" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber],
//        @"Folate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate],
//        @"Iodine" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIodine],
//        @"Iron" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron],
//        @"Magnesium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium],
//        @"Manganese" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese],
//        @"Molybdenum" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum],
//        @"Niacin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin],
//        @"PantothenicAcid" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid],
//        @"Phosphorus" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus],
//        @"Potassium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium],
//        @"Riboflavin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin],
//        @"Selenium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium],
//        @"Sodium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium],
//        @"Sugar" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar],
//        @"Thiamin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin],
//        @"VitaminA" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA],
//        @"VitaminB12" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12],
//        @"VitaminB6" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6],
//        @"VitaminC" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC],
//        @"VitaminD" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD],
//        @"VitaminE" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE],
//        @"VitaminK" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK],
//        @"Zinc" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc],
//        @"Water" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater],

                                 };
    }
    else {
        writePerms = @{
//                      @"Weight" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
//                      @"BodyMassIndex" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
//                      @"Steps" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
//                      @"HeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate],
//                      @"BloodPressureSystolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic],
//                      @"BloodPressureDiastolic" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic],
//                      @"BloodGlucose" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodGlucose],
//                      @"SleepAnalysis" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierSleepAnalysis],
//                      @"MindfulSession" : [HKObjectType categoryTypeForIdentifier:HKCategoryTypeIdentifierMindfulSession],
//                      @"Protein" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryProtein],
//                      @"Carbohydrates" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCarbohydrates],
//                      @"FatMonounsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatMonounsaturated],
//                      @"FatPolyunsaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatPolyunsaturated],
//                      @"FatSaturated" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatSaturated],
//                      @"FatTotal" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFatTotal],
//                      @"EnergyConsumed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
//                      // Characteristic Identifiers
//                      @"DateOfBirth" : [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
//          @"Height" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
//          @"BodyFatPercentage" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyFatPercentage],
//          @"WaistCircumference" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierWaistCircumference],
//          @"RestingHeartRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRestingHeartRate],
//          @"OxygenSaturation" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierOxygenSaturation],
//          @"RespiratoryRate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierRespiratoryRate],
            
            
//                    @"LeanBodyMass" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierLeanBodyMass],
//                    // Fitness Identifiers
//                    @"DistanceWalkingRunning" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
//                    @"DistanceCycling" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling],
//                    @"BasalEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBasalEnergyBurned],
//                    @"ActiveEnergyBurned" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierActiveEnergyBurned],
//                    @"FlightsClimbed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierFlightsClimbed],
//                    // Nutrition Identifiers
//                    @"Biotin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryBiotin],
//                    @"Caffeine" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCaffeine],
//                    @"Calcium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCalcium],
//                    @"Chloride" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryChloride],
//                    @"Cholesterol" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCholesterol],
//                    @"Copper" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryCopper],
//                    @"EnergyConsumed" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed],
//                    @"Fiber" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFiber],
//                    @"Folate" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryFolate],
//                    @"Iodine" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIodine],
//                    @"Iron" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryIron],
//                    @"Magnesium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMagnesium],
//                    @"Manganese" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryManganese],
//                    @"Molybdenum" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryMolybdenum],
//                    @"Niacin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryNiacin],
//                    @"PantothenicAcid" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPantothenicAcid],
//                    @"Phosphorus" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPhosphorus],
//                    @"Potassium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryPotassium],
//                    @"Riboflavin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryRiboflavin],
//                    @"Selenium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySelenium],
//                    @"Sodium" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySodium],
//                    @"Sugar" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietarySugar],
//                    @"Thiamin" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryThiamin],
//                    @"VitaminA" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminA],
//                    @"VitaminB12" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB12],
//                    @"VitaminB6" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminB6],
//                    @"VitaminC" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminC],
//                    @"VitaminD" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminD],
//                    @"VitaminE" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminE],
//                    @"VitaminK" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryVitaminK],
//                    @"Zinc" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryZinc],
//                    @"Water" : [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryWater],
        };
    }
    return writePerms;
}

// Returns HealthKit read permission from option
- (NSSet *)getReadPermsFromOptions:(NSArray *)options {
    NSDictionary *readPermDict = [self readPermsDict];
    NSMutableSet *readPermSet = [NSMutableSet setWithCapacity:1];
//    bool bloodPressureMetric = false;
    
    for(int i=0; i<[options count]; i++) {
        NSString *optionKey = options[i];

        // NOTE: BP has two identifiers, automatically map both
        if ([optionKey isEqualToString:@"BloodPressure"]) {
          [readPermSet addObject:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic]];
          [readPermSet addObject:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic]];
          continue;
        }

        HKObjectType *val = [readPermDict objectForKey:optionKey];
        if(val != nil) {
            

            [readPermSet addObject:val];
        }
    }
    return readPermSet;
}


// Returns HealthKit read permission from option
- (HKQuantityType *)getReadPermFromOption:(NSString *)option {
    return [self.readPermsDict objectForKey:option];
}

- (NSSet *)getReadPerms {
    NSDictionary *readPermDict = [self readPermsDict];
    NSSet *readPermSet = [NSMutableSet setWithCapacity:1];
    
    NSArray *allPerms = [readPermDict allValues];
    readPermSet = [readPermSet setByAddingObjectsFromArray:allPerms];
    return readPermSet;
}

- (NSSet *)getWritePerms {
    NSDictionary *writePermDict = [self writePermsDict];
    NSSet *writePermSet = [NSMutableSet setWithCapacity:1];
    
    NSArray *allPerms = [writePermDict allValues];
    writePermSet = [writePermSet setByAddingObjectsFromArray:allPerms];
    return writePermSet;
}


// Returns HealthKit write permissions from options array
- (NSSet *)getWritePermsFromOptions:(NSArray *)options {
    NSDictionary *writePermDict = [self writePermsDict];
    NSMutableSet *writePermSet = [NSMutableSet setWithCapacity:1];
    
    for(int i=0; i<[options count]; i++) {
        NSString *optionKey = options[i];

        // NOTE: BP has two identifiers, automatically map both
        if ([optionKey isEqualToString:@"BloodPressure"]) {
          [writePermSet addObject:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureSystolic]];
          [writePermSet addObject:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBloodPressureDiastolic]];
          continue;
        }

        HKObjectType *val = [writePermDict objectForKey:optionKey];
        if(val != nil) {
            [writePermSet addObject:val];
        }
    }
    return writePermSet;
}

@end

