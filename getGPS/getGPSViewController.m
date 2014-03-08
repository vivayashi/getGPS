//
//  getGPSViewController.m
//  getGPS
//
//  Created by 尾林 祐太朗 on 2014/03/09.
//  Copyright (c) 2014年 Yutaro OBAYASHI. All rights reserved.
//

#import "getGPSViewController.h"

@interface getGPSViewController ()

@end

@implementation getGPSViewController
@synthesize locationManager;
@synthesize labelLatitude;
@synthesize labelLongitude;
@synthesize labelTime;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (nil == locationManager) {
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = 500;
    [locationManager startUpdatingLocation];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getGPS:(id)sender {
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    NSDate* timestamp = location.timestamp;
    NSTimeInterval howRecent = [timestamp timeIntervalSinceNow];
    if (abs(howRecent) < 15.0) {
    NSLog(@"緯度 %+.6f, 経度 %+.6f\n", location.coordinate.latitude, location.coordinate.longitude);
    labelLatitude.text = [NSString stringWithFormat:@"%+.6f", location.coordinate.latitude];
    labelLongitude.text = [NSString stringWithFormat:@"%+.6f", location.coordinate.longitude];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy/MM/dd HH:mm:ss"];
    labelTime.text = [df stringFromDate:timestamp];
    }
}
@end
