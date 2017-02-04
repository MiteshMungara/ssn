//
//  SSNViewController.m
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "SSNViewController.h"

@interface SSNViewController ()

@end

@implementation SSNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    self.tabBarController.tabBar.hidden = YES;
    //_databasePath = [[NSBundle mainBundle] pathForResource:@"SSNValidatorDB" ofType:@"db"]; // get source path
    //NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); // get base path from device
    
   // NSString *strDestPath = [arr objectAtIndex:0];
    
  //  NSError *error;
  //  NSString *dataPath = [strDestPath stringByAppendingPathComponent:@"/"];
    
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    _databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"SSNValidatorDB.db"]];

//    
//    dbHandler = [[DataBaseFile alloc]init];
//    NSString *strUserId = @"1";
//    NSString *strEmailPublic = @"123";
//    //DROP TABLE IF EXISTS "contactinfo";
//    // CREATE TABLE "contactinfo" ("id" INTEGER PRIMARY KEY  NOT NULL , "name" VARCHAR, "phoneno" VARCHAR);
//    
//    
//    NSString *strUserSettingInsertQuery = [NSString stringWithFormat:@"];
//    
//    [dbHandler insertDataWithQuesy:strUserSettingInsertQuery];
    
//http://www.cocoonplace.com/be/userRegister2.php")!)
    // let myUrl = NSURL(string: "http://www.cocoonplace.com/be/userRegister2.php")
    //let request = NSMutableURLRequest(url: myUrl! as URL)
    
    
    //request.httpMethod = "POST"
    //let postString = "streetname2=\(streetName!)&housenumber2=\(housenumber!)&postcode2=\(postcode!)&city2=\(city!)&email2=\(email2)";
    

//    [SVProgressHUD show];
//    [RequestHelper POSTRequestWithURL:@"http://www.cocoonplace.com/be/" endPoint:@"userRegister2.php" Param:@{@"streetname2":@"",@"housenumber2":@"",@"postcode2":@"",@"email2":@"mitu1742000@gmail.com"} success:^(id responseObject) {
//        [responseObject dictionaryToJSON];
//        NSLog(@"%@",responseObject);
//        //jsonDicArr = [[responseObject valueForKey:@"result"]valueForKey:@"allcategory"];
//        [SVProgressHUD dismiss];
//        //typeNameArr = [jsonDicArr valueForKey:@"project_category_name"];
//       // nameTf.text=@"Select Category";
//        //selectedDataArr = [jsonDicArr objectAtIndex:0];
//        
//    } failure:^(NSError *error) {
//        [SVProgressHUD dismiss];
//        
//    }];

    
}


-(void)viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
    self.tabBarController.tabBar.hidden = YES;
}



-(IBAction)trackingBtnClicked:(id)sender
{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    self.tabBarController.tabBar.hidden = NO;
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:1];
}
-(IBAction)dressingBtnClicked:(id)sender
{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    self.tabBarController.tabBar.hidden = NO;
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:2];
}
-(IBAction)settingBtnClicked:(id)sender
{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    self.tabBarController.tabBar.hidden = NO;
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:3];
}
-(IBAction)moreBtnClicked:(id)sender
{
    [[self navigationController] setNavigationBarHidden:NO animated:NO];
    self.tabBarController.tabBar.hidden = NO;
    self.tabBarController.selectedViewController
    = [self.tabBarController.viewControllers objectAtIndex:4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





-(IBAction)settingBtnPressed:(id)sender
{
      sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
  
    NSString *strEmailPublic = @"123";
    if (sqlite3_open(dbpath, &_contactDB) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT into Tracking (NAME) values ('%@')",strEmailPublic];
        
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_contactDB, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Contact added");
            
        } else {
            NSLog(@"Failed to add contact");
        }
        
        sqlite3_finalize(statement);
    }
    sqlite3_close(_contactDB);
    //[self performSegueWithIdentifier:@"" sender:self];
}

-(IBAction)moreBtnPressed:(id)sender
{
     [self performSegueWithIdentifier:@"" sender:self];
}

-(IBAction)TrackBtnPressed:(id)sender
{
     [self performSegueWithIdentifier:@"" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
