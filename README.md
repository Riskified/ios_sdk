## RiskifiedBeacon for iOS Devices
##### Version 1.2.7

###### The following guide explains how to install and implement Riskified's Mobile SDK into your application environment.
###### The Mobile SDK is analogous to Riskified's Javascript code used for analytics and fraud review enhancement on the browser, and is critical for main analytics features such as ATO Prevention and CHB Guarantee.

### Prerequisites:

 * iOS 8.0 and above.

---

### Installation:

#### Using CocoaPods:

 * Add the following line to the  `Podfile`, under your app's `target` section:
```yaml
  pod 'RiskifiedBeacon', '~> 1.2.7'
```

 * Run `$ pod install` in your project directory.
 * Open `App.xcworkspace` and build.
 
#### Manually:

 * Download and extract the latest release from [Github](https://github.com/Riskified/ios_sdk/releases/latest).
 * Copy/Drag `libriskifiedbeacon.a` and `RiskifiedBeacon.h` into your XCode project.
 * Ensure that the `libriskifiedbeacon.a` library exists in the project settings under Build Phases → Link Binary with Libraries.
 
---

### Implementation:

##### 1. Add an `#import "RiskifiedBeacon.h"` to the top of your ApplicationDelegate.

##### 2. Start the beacon at the end of `applicationDidFinishLaunching`:
```objective-c
    [RiskifiedBeacon startBeacon:@"myshop.com" sessionToken:token debugInfo:true];
```

   * `startBeacon()` arguments:
     * `shopName` - Name of your Riskified account.
     * `sessionTokeb` - Unique identifier of the user's current session in the app. The same identifier is passed by your backend (in the `cart_token` field) to Riskified.
     * `debugInfo` - Boolean parameter that indicates whether or not to display the beacon logs.


##### 3. When the user's session changes, update the token by calling:
```objective-c
    [RiskifiedBeacon updateSessionToken:newToken];
```

##### 4. Notify the beacon on each relevant HTTP request from the app:
```objective-c
    [RiskifiedBeacon logRequest:requestUrl];
```

##### 5. Collect rich device information. This method should usually be called only once per session:
```objective-c
    [RiskifiedBeacon logSensitiveDeviceInfo];
```

##### 6. (Optional) Extract Riskified's device identifier to support custom flows:
```objective-c
    NSString *riskifiedDeviceID = [RXBeacon rCookie];
```

---
### Bridging for Swift

If your project is built in Swift, you'll need to follow these additional steps:

 1. Add a new Bridging Header file if it doesn't already exists (ex. Bridging-Header.h).
 1. Ensure the file is listed correctly under Objective-C Bridging Header in the project's Build Settings.
 1. Add `#import "RiskifiedBeacon.h"` to the bridging header file. 
 1. Continue as usual using Swift syntax: `RiskifiedBeacon.startBeacon("myshop.com", sessionToken:token)`

---

### FAQs

##### Q: Does the SDK require any additional permissions from the user?
 * The SDK does **not** require or prompt for any user permissions. 
 * The SDK utilizes certain permissions if the host app previously requested them.

##### Q: When and how should `logRequest:` be used?
 * Call this method every time a user performs a meaningful action in the app (for example: view product page, search, add to cart).
 * Riskified uses this data for behavioral modeling and analysis, so please take care to only call `logRequest:` in response to an actual user action.
 * The single URL argument represents the action taken, this can usually be achieved by passing the same URL used in the backend call for the action (`https://api.myshop.com/search?term=shoes`).
 
##### Q: When should `logsensitiveDeviceInfo` be called? 
  * Ideally once per session, depending on the use case. For example - before attempting to process a checkout, or before the first login attempt.
  * Multiple invocations of this function in a single session will not generate an error, but have the wasteful effect of generating identical payloads for analysis. 
