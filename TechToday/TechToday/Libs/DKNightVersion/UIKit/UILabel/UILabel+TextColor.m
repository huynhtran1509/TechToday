//
//  UILabel+TextColor.m
//  UILabel+TextColor
//
//  Copyright (c) 2015 Draveness. All rights reserved.
//
//  These files are generated by ruby script, if you want to modify code
//  in this file, you are supposed to update the ruby code, run it and
//  test it. And finally open a pull request.

#import "UILabel+TextColor.h"
#import "DKNightVersionManager.h"
#import "objc/runtime.h"

@interface UILabel ()

@property (nonatomic, strong) UIColor *normalTextColor;

@end

@implementation UILabel (TextColor)

+ (void)load {
    static dispatch_once_t onceToken;                                              
    dispatch_once(&onceToken, ^{                                                   
        Class class = [self class];                                                
        SEL originalSelector = @selector(setTextColor:);                                  
        SEL swizzledSelector = @selector(hook_setTextColor:);                                 
        Method originalMethod = class_getInstanceMethod(class, originalSelector);  
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);  
        BOOL didAddMethod =                                                        
        class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));                   
        if (didAddMethod){
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));           
        } else {                                                                   
            method_exchangeImplementations(originalMethod, swizzledMethod);        
        }
    });
    [DKNightVersionManager addClassToSet:self.class];
}

- (void)hook_setTextColor:(UIColor*)textColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal) [self setNormalTextColor:textColor];
    [self hook_setTextColor:textColor];
}

- (void)saveNormalColor {
    self.normalTextColor = self.textColor;
}

- (UIColor *)nightTextColor {
    UIColor *nightColor = objc_getAssociatedObject(self, @selector(nightTextColor));
    if (nightColor) {
        return nightColor;
    } else {
        UIColor *resultColor = self.normalTextColor ?: [UIColor clearColor];
        return resultColor;
    }
}

- (void)setNightTextColor:(UIColor *)nightTextColor {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) [self setTextColor:nightTextColor];
    objc_setAssociatedObject(self, @selector(nightTextColor), nightTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)normalTextColor {
    if (objc_getAssociatedObject(self, @selector(normalTextColor))) {
        return objc_getAssociatedObject(self, @selector(normalTextColor));
    } else {
        return [UIColor whiteColor];
    }
    
//    return objc_getAssociatedObject(self, @selector(normalTextColor));
}

- (void)setNormalTextColor:(UIColor *)normalTextColor {
    objc_setAssociatedObject(self, @selector(normalTextColor), normalTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
