//
//  ViewController.h
//  TrackU
//
//  Created by ゆがみ on 2017/07/15.
//  Copyright © 平成29年 kakinoki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController {
    CLLocationManager* locationManager;
    ViewController *viewController;
}

// test
@property (strong, nonatomic) CLLocationManager* locationManager;
@property (strong, nonatomic) ViewController* viewController;
@property (weak, nonatomic) IBOutlet UITextField *longitudeText;
@property (weak, nonatomic) IBOutlet UITextField *latitudeText;

@property (retain, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UITextField *textOutput;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *activity;

- (IBAction)findMe:(id)sender;
- (IBAction)webMap:(id)sender;
- (IBAction)buttonTapped:(id)sender;

@end

