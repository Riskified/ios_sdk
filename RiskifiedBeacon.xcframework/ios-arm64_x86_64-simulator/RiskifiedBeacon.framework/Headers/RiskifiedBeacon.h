/**
 * Copyright 2013-2015 Riskified.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 * http://www.apache.org/licenses/LICENSE-2.0.html
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@class DecoConfig;
@class MfaConfig;

@interface RiskifiedBeacon : NSObject

/**
 Entry point, should be called at the end of applicationDidFinishLaunching:
 @param shopName The Riskified account name (shop.com)
 @param token The initial session's unique identifier
 @param debug Controls debug logging to NSLog
 */
+ (void)startBeacon:(NSString *)shopName sessionToken:(NSString *)token debugInfo:(BOOL)debug;

/**
 Updates that the user has begun a new browsing session
 @param token The new session's unique identifier
 */
+ (void)updateSessionToken:(NSString *)token;

/**
 Manually log a request to a specific URL.
 @param url The remote url that the host app sent a request to.
 */
+ (void)logRequest:(NSURL *)url;

/**
 Manually log sensitive Personally Identifiable Information (social account data).
 */
+ (void)logSensitiveDeviceInfo;

/**
   Get the unique Riskified Identifier.
 */
+ (NSString *)rCookie;

/**
 Deco function - see IOS documenation
 */
+ (void)offerDeco:(DecoConfig *)decoConfig;

/**
 MFA function - see IOS documenation
 */
+ (void)OfferMFA:(MfaConfig *)mfaConfig;

@end
