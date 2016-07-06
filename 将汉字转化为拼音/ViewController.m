//
//  ViewController.m
//  将汉字转化为拼音
//
//  Created by nanke on 16/7/6.
//  Copyright © 2016年 nanke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"张三", @"李四", @"王五", @"赵六", @"周一"];
    for (NSString *name in array) {
        [self chineseToPinyin:name withSpace:NO];
    }
//    [self chineseToPinyin:@"南珂" withSpace:NO];
}
- (NSString *)chineseToPinyin:(NSString *)chinese withSpace:(BOOL)withSpace
{
    CFStringRef hanzi = (__bridge CFStringRef)chinese;
    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, hanzi);
    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
    NSString *pinyin = (NSString *)CFBridgingRelease(string);
    if (!withSpace) {
        pinyin = [pinyin stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    NSLog(@"%@", pinyin);
    return pinyin;
}
//作者： Realank刘
//链接：http://www.imooc.com/article/4527

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
