//
//  Library.h
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#ifndef Library_h
#define Library_h


#define appDelegate ((AppDelegate *)([UIApplication sharedApplication].delegate))

#define Alert(title, msg,viewController) { UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action") style:UIAlertActionStyleDefault handler:nil];[alertController addAction:okAction]; [viewController presentViewController:alertController animated:YES completion:nil];}

#define NSLog(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#define SSNValidatorThemeColor [UIColor colorWithRed:28.0/255.0 green:145.0/255.0 blue:187.0/255.0 alpha:1.0]

//#define web_URL @"http://armigesfahani.com/tannis/tannisadmin"

//#define BASE_URL [NSString stringWithFormat:@"%@/api/",web_URL]

#define BASE_URL @"http://armigesfahani.com/tannis/tannisadmin"

#import <AFNetworking/AFNetworking.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "AppDelegate.h"
#import <LDProgressView/LDProgressView.h>
#import <SVProgressHUD/SVProgressHUD.h>
//#import <DXCustomCallout_ObjC/DXAnnotationView.h>
//#import <DXCustomCallout_ObjC/DXAnnotationSettings.h>
#import <CoreLocation/CoreLocation.h>
//#import <MapKit/MapKit.h>
#import <BFKit/BFKit.h>
#import "RequestHelper.h"
#import <sqlite3.h>
#import "DataBaseFile.h"
#endif /* Library_h */
