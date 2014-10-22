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
    
    
    NSString *comment = @"生活習慣病とは、生活習慣（life style）が要因となって発生する諸疾病を指すための呼称・概念である。ここで生活習慣と言っているのは、食事のとりかた、水分のとりかた、喫煙/非喫煙の習慣、運動をする/しないの習慣　等々のことである。各国で同様の概念は用いられており、例えば英語・フランス語・ドイツ語ではそれぞれ、英: lifestyle related disease、仏: maladie de comportement、独: Zivilisationskrankheitと言う。";
    self.myComment.text = comment;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    // TODO get data from db
    NSString *data = @"[[Date.UTC(2014, 0, 1, 10, 1), 59.2], [Date.UTC(2014, 0, 1, 11, 2), 59.6]]";
    
    NSString *comment = @"\"生活習慣病とは、生活習慣（life style）が要因となって発生する諸疾病を指すための呼称・概念である。ここで生活習慣と言っているのは、食事のとりかた、水分のとりかた、喫煙/非喫煙の習慣、運動をする/しないの習慣　等々のことである。各国で同様の概念は用いられており、例えば英語・フランス語・ドイツ語ではそれぞれ、英: lifestyle related disease、仏: maladie de comportement、独: Zivilisationskrankheitと言う。\"";
//    NSString *comment = @"\"hogehogehogehogehogehogehogehogehogehogehogehoge\"";
//    NSString *js = @"draw([[Date.UTC(2014, 0, 1, 10, 1), 59.2], [Date.UTC(2014, 0, 1, 11, 2), 59.6]]);";
    NSString *js = [NSString stringWithFormat:@"draw(%@, %@);", data, comment];
    NSLog(@"%@", js);
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

@end
