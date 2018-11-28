//
//  RCTAppleHealthKit+ObserverQueries.h
//  RCTAppleHealthKit
//
//  Created by Julian Kingman on 2018-11-27.
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "RCTAppleHealthKit.h"

@interface RCTAppleHealthKit (Observer_Queries)

- (void)observers_initializeEventObserverForType:(NSDictionary *)input callback:(RCTResponseSenderBlock)callback;

@end
