//
//  ViewController.h
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseFile.h"
#import "Library.h"
@interface ViewController : UIViewController
{
    DataBaseFile *dbHandler;
    
}

@property (strong, nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *contactDB;

@end

