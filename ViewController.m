//
//  ViewController.m
//  TrackU
//
//  Created by ゆがみ on 2017/07/15.
//  Copyright © 平成29年 kakinoki. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ViewController *controller = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    
    self.viewController = controller;
    
    [self findMe:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findMe:(id)sender {
    self.locationManager = [[CLLocationManager alloc] init];
//    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 1000.0f;
    [self.locationManager startUpdatingLocation];
    [_activity startAnimating];
    NSLog(@"start gps");
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    self.latitudeText.text = [NSString stringWithFormat:@"%3.5f",newLocation.coordinate.latitude];
    self.longitudeText.text = [NSString stringWithFormat:@"%3.5f",newLocation.coordinate.longitude];
    [self.activity stopAnimating];
    [locationManager stopUpdatingLocation];
    NSLog(@"location ok");
}


- (IBAction)webMap:(id)sender {
    CLLocation *lastLocation = [locationManager location];
    if(!lastLocation)
    {
        UIAlertController *alert;
        alert = [UIAlertController alertControllerWithTitle:@"系统错误"
            message:@"还没有接收到数据"
            preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
        
        [alert addAction:firstAction];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    NSString *urlString = [NSString stringWithFormat: @"http://maps.google.com/maps?q=Here+I+Am!@%f,%f",
                           lastLocation.coordinate.latitude,
                           lastLocation.coordinate.longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)buttonTapped:(id)sender {
    self.textOutput.text = [NSString stringWithFormat:@"what"];
    [self locationManager:locationManager didUpdateToLocation:NULL fromLocation:NULL];
}

@end
