//
//  getGPSViewController.h
//  getGPS
//
//  Created by 尾林 祐太朗 on 2014/03/09.
//  Copyright (c) 2014年 Yutaro OBAYASHI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  <CoreLocation/CoreLocation.h>

@interface getGPSViewController : UIViewController <CLLocationManagerDelegate>
- (IBAction)getGPS:(id)sender;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UILabel *labelLatitude;
@property (weak, nonatomic) IBOutlet UILabel *labelLongitude;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;

@end
