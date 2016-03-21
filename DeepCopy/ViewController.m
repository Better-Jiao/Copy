//
//  ViewController.m
//  DeepCopy
//
//  Created by 焦星星 on 16/3/13.
//  Copyright © 2016年 jxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *_str;
}
@property (nonatomic ,copy) NSString *str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self unCollectionCopy];
//    [self collectionCopy];
//    NSLog(@"%@",[self class]);
//    NSLog(@"%@",[super class]);
    
}


/**
 *  非集合对象的拷贝
 */
- (void)unCollectionCopy
{
  
    
//  不可变非集合对象copy拷贝。是指针拷贝。
//  MutableCopy是值拷贝。
//    NSString *str = [NSString stringWithFormat:@"aa"];
//    NSString *copyStr = [str copy];
//    NSMutableString *mutableStr = [str mutableCopy];
//    [mutableStr appendString:@"bb"];
//    NSLog(@"origin:%p,%@,copyStr:%p,%@,mutableCopy:%p,%@",str,str,copyStr,copyStr,mutableStr,mutableStr);
////   不能用&copystr去访问地址，这个得到的是指针的地址。
//  运行结果：0xa000000000061612,aa,copyStr:0xa000000000061612,aa,mutableCopy:0x7fb3e8c364f0,aabb

    
    
//  对可变非集合对象copy拷贝，是值拷贝。
//  MutableCopy也是值拷贝。
    NSMutableString *str = [NSMutableString stringWithFormat:@"aa"];
    NSString *copyStr = [str copy];
//    [copyStr appendString:@"cc"];产生不可变字符串，不能调用该方法。
    NSMutableString *mutableStr = [str mutableCopy];
    [mutableStr appendString:@"bb"];
    NSLog(@"origin:%p,%@,copyStr:%p,%@,mutableStr:%p,%@",str,str,copyStr,copyStr,mutableStr,mutableStr);
//  运行结果：0x7f9ca3414f60,aa,copyStr:0xa000000000061612,aa,mutableStr:0x7f9ca3414fa0,aabb

}

/**
 *  对集合的拷贝
 */
- (void)collectionCopy
{
    
//  值拷贝
    NSArray *array = @[@"1",@"2"];
    NSArray *copyArray = [array copy];
    array = @[@"2",@"3"];
    NSLog(@"origin:%p,%@,copyStr:%p,%@",&array,array,&copyArray,copyArray);
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
