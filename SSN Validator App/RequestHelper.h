//
//  RequestHelper.h
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"


typedef void (^CompletionBlock)(id responseObject);
typedef void (^CompletionErrorBlock)(NSError *error);
@interface RequestHelper : NSObject
/*!
 *  @author Jaha Rabari, 16-04-01 00:04:20
 *
 *  @brief <#Description#>
 *
 *  @param url        <#url description#>
 *  @param endPoint   <#endPoint description#>
 *  @param parameters <#parameters description#>
 *  @param success    <#success description#>
 *  @param failure    <#failure description#>
 */
+(void)POSTRequestWithURL:(NSString*)url endPoint:(NSString *)endPoint Param:(NSDictionary *)parameters success:(CompletionBlock)success failure:(CompletionErrorBlock)failure;
/*!
 *  @author Jaha Rabari, 16-04-01 00:04:36
 *
 *  @brief <#Description#>
 *
 *  @param url        <#url description#>
 *  @param endPoint   <#endPoint description#>
 *  @param parameters <#parameters description#>
 *  @param success    <#success description#>
 *  @param failure    <#failure description#>
 */
+(void)GETRequestWithURL:(NSString*)url endPoint:(NSString *)endPoint Param:(NSDictionary *)parameters success:(CompletionBlock)success failure:(CompletionErrorBlock)failure;
/*!
 *  @brief <#Description#>
 *
 *  @param url        <#url description#>
 *  @param endPoint   <#endPoint description#>
 *  @param parameters <#parameters description#>
 *  @param image      <#image description#>
 *  @param success    <#success description#>
 *  @param failure    <#failure description#>
 */
//+(void)UpdateProfileImageWithURL:(NSString*)url endPoint:(NSString *)endPoint Param:(NSDictionary *)parameters image:(UIImage *)image success:(CompletionBlock)success failure:(CompletionErrorBlock)failure;

@end
