//
//  ViewController.m
//  UIScrollview
//
//  Created by akaimo on 2015/07/15.
//  Copyright (c) 2015年 akaimo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic) CGFloat pWidth;
@property (nonatomic) CGFloat pHeight;

@end

// Totalのページ数
const NSUInteger pNum = 4;

@implementation ViewController

// 画像のframeサイズ取得とScrollViewへ追加
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pWidth = [[UIScreen mainScreen] bounds].size.width;
    _pHeight = _pWidth * 9/16;
    NSUInteger i;
    for (i=0;i < pNum; i++){
        unsigned int n = i+1;
        
        // UIImageViewのインスタンス
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg", n];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        CGRect rect = imageView.frame;
        rect.size.height = _pHeight;
        rect.size.width = _pWidth;
        imageView.frame = rect;
        imageView.tag = n;
        
        // UIScrollViewのインスタンスに画像を貼付ける
        [_scrollView addSubview:imageView];
    }
    [self setupScrollImages];
    
}

//ScrollViewの設定
- (void)setupScrollImages
{
    UIImageView *view = nil;
    NSArray *subviews = [_scrollView subviews];
    // 描画開始の x,y 位置
    CGFloat px = 0;
    CGFloat py = 100;
    for (view in subviews)
    {
        NSLog(@"tag = %ld",(long)view.tag);
        if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
        {
            CGRect frame = view.frame;
            frame.origin = CGPointMake(px, py);
            view.frame = frame;
            
            px += (_pWidth);
        }
    }
    
    // UIScrollViewのコンテンツサイズを画像のtotalサイズに合わせる
    [_scrollView setContentSize:CGSizeMake( _pWidth * pNum, _pHeight)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
