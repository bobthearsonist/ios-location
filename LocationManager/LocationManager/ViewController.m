//
//  ViewController.m
//  LocationManager
//
//  Created by admin on 11/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self SetupLocationManager];
}

-(void)SetupLocationManager
{
    _locationManager = [[CLLocationManager alloc] init];
    
    _locationManager.delegate = self;
    
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager requestAlwaysAuthorization];
    
    //set the defualts for the lcoation manager for the etnire app
    //cuurrently set to the defaults, only change to navigation if needed
    //only updates if you move 10m!
    //[_locationManager allowDeferredLocationUpdatesUntilTraveled:kCLLocationAccuracyNearestTenMeters timeout:1];
    [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [_locationManager setDistanceFilter:kCLLocationAccuracyBest];
    [_locationManager startUpdatingLocation];

    [_locationManager setHeadingFilter:10];
    [_locationManager startUpdatingHeading];
}

//trying to force compass calibration which will also calibrate magnetometer
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager
{
    CLLocationDirection accuracy = [[manager heading] headingAccuracy];
    return accuracy <= 0.0f || accuracy > 10.0f;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error"
                               message:@"Failed to Get Your Location"
                               delegate:nil
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    _currentLocation = location;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    _currentHeading = newHeading.trueHeading;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
