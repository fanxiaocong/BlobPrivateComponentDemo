//
//  XCCustomerView.m
//  BlobPrivateComponentDemo
//
//  Created by 樊小聪 on 2019/12/6.
//

#import "XCCustomerView.h"
#import <XCMacros/XCMacros.h>

@implementation XCCustomerView

#pragma mark - 🔓 👀 Private Method 👀


/*
    注：当修改了组件里面的代码或者 podspec 里面的配置，运行项目前请先 pod install ，然后再 clean 一下
 */

+ (instancetype)customerView
{
    CGFloat w = SCREEN_WIDTH / 3;
    CGFloat h = w * 1.5;
    
    XCCustomerView *view = [XCCustomerView new];
    view.bounds = CGRectMake(0, 0, w, h);
    view.backgroundColor = [UIColor colorWithWhite:0 alpha:.3f];
    
    UIImageView *imgView = [UIImageView new];
    imgView.frame = CGRectMake(0, 0, w, w);
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    imgView.clipsToBounds = YES;
    
    // imgView.image = [UIImage imageNamed:@"code"];
    /*
        这里直接通过 UIImage 的 imageNamed: 方法是加载不出图片的
     
        imageNamed: 方法是在当前项目的主 bundle 中加载对应名字的图片。
        而项目所依赖的那些 Pods 库都有自己独立的主 bundle 文件，存放在当前项目的主 bundle 中的 Frameworks 目录下。
        组件内部的资源文件（图片、xib、storyboard、json等等），都存放各自的 bundle 内部。因此在加载的时候，先要找到对应的 bundle 文件，然后再在 bundle 中查找对应的文件资源。
     */
    // 1、获取当前组件所属的主 bundle
    NSBundle *currentBundle = [NSBundle bundleForClass:[self class]];
    // 2、根据 podspec 文件中指定的 bundle 名称，来加载对应的资源 bundle 文件
    /*
        BlobPrivateComponentDemo.podspec 文件
     
         s.resource_bundles = {
            'BlobPrivateComponentDemo' => ['xxx.png']
         }
     */
    // 2.1 组件中资源文件的 bundle 一般只有一个，名字和当前组件的名称一致 BlobPrivateComponentDemo.bundle
    NSString *bundleName = [currentBundle.infoDictionary[@"CFBundleName"] stringByAppendingString:@".bundle"];
    // 3、根据 bundle 加载图片
    // 3.1 获取当前设备的倍率，分别加载 @2x 和 @3x 图片
    NSInteger scale = [UIScreen mainScreen].scale;
    // 3.2 获取图片名称
    NSString *imageName = @"code";
    // 3.3 获取图片路径
    NSString *imagePath = [currentBundle pathForResource:[NSString stringWithFormat:@"%@@%zdx", imageName, scale] ofType:@"png" inDirectory:bundleName];
    // 4 显示图片
    imgView.image = [UIImage imageWithContentsOfFile:imagePath];
    
    [view addSubview:imgView];
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, w, w, h-w)];
    l.textColor = [UIColor whiteColor];
    l.textAlignment = NSTextAlignmentCenter;
    l.font = [UIFont systemFontOfSize:15];
    l.text = @"Hello World";
    [view addSubview:l];
    
    return view;
}

@end
