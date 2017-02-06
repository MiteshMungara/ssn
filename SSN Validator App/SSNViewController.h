//
//  SSNViewController.h
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Library.h"
@interface SSNViewController : UIViewController
{
       DataBaseFile *dbHandler;
}

-(IBAction)trackingBtnClicked:(id)sender;
-(IBAction)dressingBtnClicked:(id)sender;
-(IBAction)settingBtnClicked:(id)sender;
-(IBAction)moreBtnClicked:(id)sender;

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;

@end
