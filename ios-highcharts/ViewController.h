//
//  ViewController.h
//  ios-hightcharts
//
//  Created by tnaototo on 2014/10/17.
//  Copyright (c) 2014年 tnaototo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextView *myComment;

@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegumentedCtrl;

- (IBAction)SegChanged:(id)sender;

@end

