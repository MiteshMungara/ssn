//
//  MoreViewController.m
//  SSN Validator App
//
//  Created by iSquare infoTech on 2/1/17.
//  Copyright © 2017 MitsSoft. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
{
    NSMutableArray *courtDetailArr;
}
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"More";
   courtDetailArr = [[NSMutableArray alloc]init];
    [courtDetailArr addObject:@"About us"];
    [courtDetailArr addObject:@"Privecy Policy"];
    [courtDetailArr addObject:@"Terms of Use"];
    [courtDetailArr addObject:@"FAQs"];
    
    
    [tbl_moreTableV reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return courtDetailArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoreVCCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MoreVCCell"];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[courtDetailArr  objectAtIndex:indexPath.row]];
    
    
    
    [cell updateFocusIfNeeded];
    return cell;
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    return [UIView new];
//
//    // If you are not using ARC:
//    // return [[UIView new] autorelease];
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    // This will create a "invisible" footer
//    return 0.01f;
//}
////-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
////{
////    if (indexPath.row == arrActivities.count-2)
////    {
////        if (activityDetail.totalRowDisplay<activityDetail.totalCount) // If its static data no need to get data for next page
////        {
////            if (!isRequestSend)
////            {
////                [footerNoDataAvailable removeFromSuperview];
////                [footerView addSubview:footerActivityIndicator];
////
////                tblNotificationList.tableFooterView = footerView;
////                [footerActivityIndicator startAnimating];
////                [self getActivities];
////            }
////        }
////    }
////}
////
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[courtDetailArr objectAtIndex:indexPath.row] isEqualToString:@"About us"]) {
        [self performSegueWithIdentifier:@"AboutVC" sender:self];
    }
    if ([[courtDetailArr objectAtIndex:indexPath.row] isEqualToString:@"Privecy Policy"]) {
         [self performSegueWithIdentifier:@"PrivecyPolicyVC" sender:self];
    }
//    if ([[courtDetailArr objectAtIndex:indexPath.row] isEqualToString:@"FAQs"]) {
//        [self performSegueWithIdentifier:@"FAQVC" sender:self];
//    }
    if ([[courtDetailArr objectAtIndex:indexPath.row] isEqualToString:@"Terms of Use"]) {
        [self performSegueWithIdentifier:@"TermsofUseVC" sender:self];
    }
    if ([[courtDetailArr objectAtIndex:indexPath.row] isEqualToString:@"FAQs"]) {
        [self performSegueWithIdentifier:@"FAQsVC" sender:self];
    }
    //[self performSegueWithIdentifier:@"CommunityServiceTrackerVC" sender:self];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
