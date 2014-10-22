//
//  ViewController.m
//  ios-hightcharts
//
//  Created by tnaototo on 2014/10/17.
//  Copyright (c) 2014年 tnaototo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *chartData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    
    // デフォルトは体重
    // TODO グラフのテンプレ化
    [self changeWeightLineChart];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *js = [NSString stringWithFormat:@"draw(%@);", chartData];
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

- (IBAction)SegChanged:(id)sender {
    switch (self.mySegumentedCtrl.selectedSegmentIndex) {
        case 1:
            NSLog(@"体脂肪");
            [self changeFatLineChart];
            break;
        
        case 2:
            NSLog(@"BMI");
            [self changeBMILineChart];
            break;
        
        default:
            NSLog(@"体重");
            [self changeWeightLineChart];
            break;
    }
}

# pragma mark - private methods
- (void)changeWeightLineChart {
    
    // TODO get data from db
    chartData = @"[[Date.UTC(2014, 0, 1, 10, 1), 59.2], [Date.UTC(2014, 0, 1, 11, 2), 59.6]]";
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"weightLineChart" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    
    
    NSString *comment = @"生活習慣病とは、生活習慣（life style）が要因となって発生する諸疾病を指すための呼称・概念である。ここで生活習慣と言っているのは、食事のとりかた、水分のとりかた、喫煙/非喫煙の習慣、運動をする/しないの習慣　等々のことである。各国で同様の概念は用いられており、例えば英語・フランス語・ドイツ語ではそれぞれ、英: lifestyle related disease、仏: maladie de comportement、独: Zivilisationskrankheitと言う。";
    self.myComment.text = comment;
    
}

- (void)changeFatLineChart {
    
    // TODO get data from db
    chartData = @"[[Date.UTC(2014, 0, 1, 10, 1), 12.2], [Date.UTC(2014, 0, 1, 11, 2), 12.6]]";
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"fatLineChart" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    
    NSString *comment = @"体脂肪率は、低ければ低いほど良い、というものではなく、低すぎると体温の低下や筋力の低下（筋肉を分解してエネルギーを作り出すため）を招くことがある。女性の場合はホルモンバランスの異常から、生理不順や早発性閉経を招くこともある。適正な体脂肪率は、以下のように言われている。プロのスポーツ選手の場合、10パーセント以下もめずらしくない。";
    self.myComment.text = comment;
    
}

- (void)changeBMILineChart {
    
    // TODO get data from db
    chartData = @"[[Date.UTC(2014, 0, 1, 10, 1), 18.2], [Date.UTC(2014, 0, 1, 11, 2), 18.6]]";
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"bmiLineChart" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    
    NSString *comment = @"肥満は、糖尿病、高血圧、脳血管障害、虚血性心疾患などの重要な危険因子である。また痩せは、栄養不良や慢性進行性疾患などで生じることがある。どの程度の肥満や痩せがあるかを正確に評価して把握することは、それらの疾患の予防や治療のために役立つ。そして、この評価に基づいて、対策を実行し、効果を判定することは意義が大きい。そのための簡便な指標が望まれる。肥満の評価には、本来は、体脂肪率や体組成の計測が行われるべきであるが、それらの計測は通常は困難である（普及している体脂肪計は、両足の間の電気抵抗を測定するに過ぎない）。このため、身長と体重から、簡便に計算されるBMIが使用される。BMIの最も良い点は、たいていの人において、体の総脂肪量とよく相関することである。";
    self.myComment.text = comment;
    
}

@end
