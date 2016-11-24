//
//  ViewController.h
//  LocationManager
//
//  Created by admin on 11/12/16.
//  Copyright © 2016 KSU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager * locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property CLLocationDirection currentHeading;

@end

