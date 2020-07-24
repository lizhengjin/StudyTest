//
//  ViewController.m
//  FishhookTest
//
//  Created by liqi on 2020/7/20.
//  Copyright © 2020 zhht. All rights reserved.
//

#import "ViewController.h"
#import "fishhook.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    struct rebinding nslog;
    nslog.name = "NSLog";
    nslog.replacement = myNslog;
    nslog.replaced = (void *)&sys_nslog;
    struct rebinding rebs[1] = {nslog};
    rebind_symbols(rebs, 1);
}

static void (*sys_nslog)(NSString * format,...);
void myNslog(NSString * format,...){
    format = [format stringByAppendingString:@"勾上了!\n"];
    sys_nslog(format);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"点击屏幕了!!");
}
@end
