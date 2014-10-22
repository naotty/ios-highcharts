//
//  ViewController.m
//  ios-hightcharts
//
//  Created by tnaototo on 2014/10/17.
//  Copyright (c) 2014年 tnaototo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"graph" ofType:@"html"];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"lineChart" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // TODO get data from db
    NSString *js = @"draw([[Date.UTC(2014, 0, 1, 10, 1), 59.2], [Date.UTC(2014, 0, 1, 11, 2), 59.6]]);";
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

@end
