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

-(IBAction)settingBtnPressed:(id)sender;
-(IBAction)moreBtnPressed:(id)sender;
-(IBAction)TrackBtnPressed:(id)sender;

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;

@end
