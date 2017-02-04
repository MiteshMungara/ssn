//
//  RequestHelper.m
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "RequestHelper.h"
#import "Library.h"

@implementation RequestHelper

+(void)POSTRequestWithURL:(NSString*)url endPoint:(NSString *)endPoint Param:(NSDictionary *)parameters success:(CompletionBlock)success failure:(CompletionErrorBlock)failure{
    //    [SVProgressHUD show];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        if (status==AFNetworkReachabilityStatusNotReachable) {
            Alert(@"Error", @"Please Check internet connection",[UIApplication sharedApplication].keyWindow.rootViewController);
            return;
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
   // NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
  //  sessionConfig.timeoutIntervalForRequest = 300.0;
  //  sessionConfig.timeoutIntervalForResource = 600.0;
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
   // AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:sessionConfig];
    
 
    url = [url stringByAppendingPathComponent:endPoint];
    
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success!");
        [SVProgressHUD dismiss];
        if (success) {
            NSLog(@"%@:::%@",endPoint,[responseObject dictionaryToJSON]);
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSLog(@"error: %@:::%@",endPoint, error);
        
        if (failure) {
            failure(error);
        }
    }];
}

+(void)GETRequestWithURL:(NSString*)url endPoint:(NSString *)endPoint Param:(NSDictionary *)parameters success:(CompletionBlock)success failure:(CompletionErrorBlock)failure{
    [SVProgressHUD show];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        if (status==AFNetworkReachabilityStatusNotReachable) {
            Alert(@"Error", @"Please Check internet connection",[UIApplication sharedApplication].keyWindow.rootViewController);
            return;
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    url=[url stringByAppendingPathComponent:endPoint];
    
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        NSLog(@"success!");
        if (success) {
            NSLog(@"%@:::%@",endPoint,[responseObject dictionaryToJSON]);
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
        [SVProgressHUD dismiss];
        if (failure) {
            failure(error);
        }
    }];
}

/*
+(void)UpdateProfileImageWithURL:(NSString*)url endPoint:(NSString *)endPoint Param:(NSDictionary *)parameters image:(UIImage *)image success:(CompletionBlock)success failure:(CompletionErrorBlock)failure{
    [SVProgressHUD show];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        if (status==AFNetworkReachabilityStatusNotReachable) {
            Alert(@"Error", @"Please Check internet connection",[UIApplication sharedApplication].keyWindow.rootViewController);
            return;
        }
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data"];
    [manager.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    
    
    url=[url stringByAppendingPathComponent:endPoint];
    
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *dataForJPEGFile = UIImageJPEGRepresentation(image, 0.5);
        NSString *imageName = [NSString stringWithFormat:@"IMG000.jpg"];
        [formData appendPartWithFileData:dataForJPEGFile name:@"file" fileName:imageName mimeType:@"image/jpeg"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"success!");
        [SVProgressHUD dismiss];
        if (success) {
            NSLog(@"%@:::%@",endPoint,responseObject);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@:::%@",endPoint, error.localizedDescription);
        [SVProgressHUD dismiss];
        if (failure) {
            failure(error);
        }
    }];
    
}*/

@end
