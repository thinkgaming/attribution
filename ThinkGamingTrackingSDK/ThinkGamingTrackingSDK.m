//
//  ThinkGamingTrackingSDK.m
//  ThinkGamingTrackingSDK
//
//  Created by Aaron Junod on 5/20/14.
//  Copyright (c) 2014 ThinkGaming. All rights reserved.
//

#import "ThinkGamingTrackingSDK.h"

@interface ThinkGamingTrackingSDK()

@property (strong) NSString *appsFlyerDevKey;
@property (strong) NSString *appId;

- (instancetype) initWithAppsFlyerDevKey:(NSString *)appsFlyerDevKey andAppId:(NSString *)appId;

@end


@implementation ThinkGamingTrackingSDK

- (instancetype) initWithAppsFlyerDevKey:(NSString *)appsFlyerDevKey andAppId:(NSString *)appId {
    if (self = [super init]) {
        self.appsFlyerDevKey = appsFlyerDevKey;
        self.appId = appId;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didCompletePurchase:) name:@"__TG__PurchaseCompleted" object:nil];
        
        [AppsFlyerTracker sharedTracker].appsFlyerDevKey = self.appsFlyerDevKey;
        [AppsFlyerTracker sharedTracker].appleAppID = self.appId;
        [[AppsFlyerTracker sharedTracker] trackAppLaunch];
        
        NSString *previousRun = [[NSUserDefaults standardUserDefaults] objectForKey:@"__TG__ReferralReceived"];
        if (previousRun == nil) {
            [[AppsFlyerTracker sharedTracker] loadConversionDataWithDelegate:self];
        }
        
    }
    return self;
}

+ (ThinkGamingTrackingSDK *) startSessionWithDevKey:(NSString *)appsFlyerDevKey appId:(NSString *)appId {
    static ThinkGamingTrackingSDK *sharedThinkGamingTrackingSDK;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedThinkGamingTrackingSDK = [[ThinkGamingTrackingSDK alloc] initWithAppsFlyerDevKey:appsFlyerDevKey andAppId:appId];
    });
    return sharedThinkGamingTrackingSDK;
}

- (void) didCompletePurchase:(NSNotification *)notification {
    [[AppsFlyerTracker sharedTracker] trackEvent:@"purchase_completed" withValue:notification.object];
}

- (void) onConversionDataReceived:(NSDictionary*) installData {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"__TG__ReferralReceived" object:installData];
    [[NSUserDefaults standardUserDefaults] setValue:@"__TG__ReferralReceived" forKey:@"__TG__ReferralReceived"];
}

- (void) onConversionDataRequestFailure:(NSError *)error {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"__TG__ReferralError" object:nil];
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
