//
//  ViewController.m
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [NSTimer scheduledTimerWithTimeInterval:0.60 target:self selector:@selector(goFirstView) userInfo:nil repeats:NO];
   // [self fetchHospitalContentDataFromDatabase:kAllContent];
  //  [self fetchFacilityContentDataFromDatabase];
    
    // INSERT UserSettingTable
    //NSString *strId = [userSettingArray valueForKey:@"id"];
    //DataBase
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    _databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"SSNValidatorDB.db"]];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt =
            "CREATE TABLE IF NOT EXISTS Tracking (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT);";
            if (sqlite3_exec(_contactDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog (@"Failed to create table");
            }
            sqlite3_close(_contactDB);
        } else {
            NSLog(@"Failed to open/create database");
        }
    }
   
    
}

-(void)goFirstView
{
         [self performSegueWithIdentifier:@"SSNViewController" sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
