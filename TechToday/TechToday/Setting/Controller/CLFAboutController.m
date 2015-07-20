//
//  CLFAboutController.m
//  TechToday
//
//  Created by CaiGavin on 7/5/15.
//  Copyright (c) 2015 CaiGavin. All rights reserved.
//

#import "CLFAboutController.h"
#import "CLFCommonHeader.h"
#import "NSString+CLF.h"

@interface CLFAboutController () <UIWebViewDelegate>

// 显示应用图标/slogan/版本号等
@property (weak, nonatomic) UIView    *appIconView;
// 对应用的介绍 内置一个WebView
@property (weak, nonatomic) UIWebView    *appIntroView;
//@property (weak, nonatomic) UIWebView *IntroView;

@end

@implementation CLFAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.nightBackgroundColor = CLFNightViewColor;
    [self setupNavigationBar];
    [self setupAppIconView];
    [self setupAppIntroView];
}

#pragma mark - set up navigationBar

- (void)setupNavigationBar {
    UIButton *leftButton = [[UIButton alloc] init];
    [leftButton setImage:[UIImage imageNamed:@"NavigationbarBackArrow"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backToHomeView) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(0, 0, 20, 24);
    leftButton.nightBackgroundColor = CLFNightBarColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIButton *rightButton = [[UIButton alloc] init];
    rightButton.frame = CGRectMake(0, 0, 20, 24);
    rightButton.nightBackgroundColor = CLFNightBarColor;
    [rightButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"关于我们";
    titleLabel.nightTextColor = CLFNightTextColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = CLFArticleTitleFont;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.frame = CGRectMake(0, 0, 80, 20);
    self.navigationItem.titleView = titleLabel;
}

- (void)backToHomeView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - set up appIconView
- (UIView *)appIconView {
    if (!_appIconView) {
        UIView *appIconView = [[UIView alloc] init];
        
        CGFloat appIconViewX = 0;
        CGFloat appIconViewY = 0;
        CGFloat appIconViewW = CGRectGetWidth(self.view.frame);
        CGFloat appIconViewH = 142;
        appIconView.frame = CGRectMake(appIconViewX, appIconViewY, appIconViewW, appIconViewH);
        [self.view addSubview:appIconView];
        
        _appIconView = appIconView;
    }
    return _appIconView;
}

- (void)setupAppIconView {
    self.appIconView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *iconView = [[UIImageView alloc] init];
    CGFloat iconViewW = 108;
    CGFloat iconViewH = 108;
    CGFloat iconViewX = CGRectGetWidth(self.view.frame) * 0.5 - iconViewW - 5;;
    CGFloat iconViewY = 15;
    iconView.frame = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    iconView.image = [UIImage imageNamed:@"TechToday"];
    [self.appIconView addSubview:iconView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"TechToday";
    titleLabel.font = CLFArticleTitleFont;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.nightTextColor = CLFNightTextColor;
    
    CGSize titleSize = [NSString sizeOfText:titleLabel.text maxSize:CGSizeMake(200, MAXFLOAT) font:CLFArticleTitleFont];
    CGFloat titleX = CGRectGetMaxX(iconView.frame) + 10;
    CGFloat titleY = iconView.frame.origin.y;
    titleLabel.frame = (CGRect){{titleX, titleY}, titleSize};
    [self.appIconView addSubview:titleLabel];
    
    UILabel *slogan1Label = [[UILabel alloc] init];
    slogan1Label.text = @"聚焦今日";
    slogan1Label.font = CLFArticleTitleFont;
    slogan1Label.textColor = [UIColor blackColor];
    slogan1Label.nightTextColor = CLFNightTextColor;
    
    CGSize slogan1Size = [NSString sizeOfText:titleLabel.text maxSize:CGSizeMake(200, MAXFLOAT) font:CLFArticleTitleFont];
    CGFloat slogan1X = CGRectGetMaxX(iconView.frame) + 10;
    CGFloat slogan1Y = CGRectGetMaxY(titleLabel.frame) + 4;
    slogan1Label.frame = (CGRect){{slogan1X, slogan1Y}, slogan1Size};
    [self.appIconView addSubview:slogan1Label];
    
    UILabel *slogan2Label = [[UILabel alloc] init];
    slogan2Label.text = @"拒绝昨日";
    slogan2Label.font = CLFArticleTitleFont;
    slogan2Label.textColor = [UIColor blackColor];
    slogan2Label.nightTextColor = CLFNightTextColor;
    
    CGSize slogan2Size = [NSString sizeOfText:titleLabel.text maxSize:CGSizeMake(200, MAXFLOAT) font:CLFArticleTitleFont];
    CGFloat slogan2X = CGRectGetMaxX(iconView.frame) + 10;
    CGFloat slogan2Y = CGRectGetMaxY(slogan1Label.frame) + 2;
    slogan2Label.frame = (CGRect){{slogan2X, slogan2Y}, slogan2Size};
    [self.appIconView addSubview:slogan2Label];
    
    UILabel *versionLabel = [[UILabel alloc] init];
    versionLabel.text = @"版本号: v 1.0.0";
    versionLabel.textAlignment = NSTextAlignmentLeft;
    versionLabel.font = CLFArticleOtherFont;
    versionLabel.textColor = [UIColor blackColor];
    versionLabel.nightTextColor = CLFNightTextColor;
    CGFloat versionLabelW = iconViewW;
    CGFloat versionLabelH = 15;
    CGFloat versionLabelX = CGRectGetMaxX(iconView.frame) + 10;
    CGFloat versionLabelY = CGRectGetMaxY(slogan2Label.frame) + 4;
    versionLabel.frame = CGRectMake(versionLabelX, versionLabelY, versionLabelW, versionLabelH);
    [self.appIconView addSubview:versionLabel];
    
    UIView *seperatorView = [[UIView alloc] init];
    seperatorView.backgroundColor = CLFUIMainColor;
    seperatorView.nightBackgroundColor = CLFNightBarColor;
    CGFloat seperatorViewX = 5;
    CGFloat seperatorViewY = CGRectGetMaxY(iconView.frame) + 15;
    CGFloat seperatorViewW = CGRectGetWidth(self.view.frame) - 2 * seperatorViewX;
    CGFloat seperatorViewH = 4;
    seperatorView.frame = CGRectMake(seperatorViewX, seperatorViewY, seperatorViewW, seperatorViewH);
    [self.appIconView addSubview:seperatorView];
}

#pragma mark - set up appIntroView

- (UIWebView *)appIntroView {
    if (!_appIntroView) {
        UIWebView *appIntroView = [[UIWebView alloc] init];
        
        CGFloat appIntroViewX = 15;
        CGFloat appIntroViewY = CGRectGetMaxY(self.appIconView.frame) + 15;
        CGFloat appIntroViewW = CGRectGetWidth(self.view.frame) - 30;
        CGFloat appIntroViewH = CGRectGetHeight(self.view.frame) - CGRectGetHeight(self.appIconView.frame);
        appIntroView.frame = CGRectMake(appIntroViewX, appIntroViewY, appIntroViewW, appIntroViewH);
        appIntroView.backgroundColor = [UIColor whiteColor];
        appIntroView.nightBackgroundColor = CLFNightViewColor;
        [self.view addSubview:appIntroView];
        
        _appIntroView = appIntroView;
    }
    return _appIntroView;
}

- (void)setupAppIntroView {
    self.appIntroView.backgroundColor = [UIColor whiteColor];
    
    NSString *mainBundleDirectory = [[NSBundle mainBundle] bundlePath];
    NSString *path = [mainBundleDirectory  stringByAppendingPathComponent:@"AboutTechToday.html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    self.appIntroView.scalesPageToFit = YES;
    [self.appIntroView loadRequest:request];
    self.appIntroView.delegate = self;
    
    self.appIntroView.scrollView.backgroundColor = [UIColor clearColor];
    self.appIntroView.scrollView.nightBackgroundColor = CLFNightViewColor;
    self.appIntroView.backgroundColor = [UIColor clearColor];
    self.appIntroView.nightBackgroundColor = CLFNightViewColor;
    
    self.appIntroView.scrollView.contentInset = UIEdgeInsetsMake(10, 0, 100, 0);
    self.appIntroView.scrollView.showsVerticalScrollIndicator = NO;
    self.appIntroView.opaque = NO;
}


#pragma mark - webView delegate methods

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
{
    NSURL *requestURL =[request URL];
    if (([[requestURL scheme] isEqualToString:@"http"] || [[requestURL scheme] isEqualToString:@"https"] || [[requestURL scheme] isEqualToString:@"mailto" ]) && (navigationType == UIWebViewNavigationTypeLinkClicked)) {
        return ![[UIApplication sharedApplication] openURL:requestURL];
    }
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *fontColor = nil;
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        fontColor = @"#828282";
    } else {
        fontColor = @"#000000";
    }
    
    [webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:
    @"var tagHead =document.documentElement.firstChild;"
     "var tagStyle = document.createElement(\"style\");"
     "tagStyle.setAttribute(\"type\", \"text/css\");"
     "tagStyle.appendChild(document.createTextNode(\"BODY{color: %@}\"));"
     "var tagHeadAdd = tagHead.appendChild(tagStyle);", fontColor]];
}

@end
