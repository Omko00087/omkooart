#import "SCLAlertView/SCLAlertView.h"

#import <Metal/Metal.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <mach-o/dyld.h>

static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {



#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
    
    
    NSUserDefaults *check;
    check = [NSUserDefaults standardUserDefaults];
    
    
    timer(5) {
        
        
        SCLAlertView *alert = [[SCLAlertView alloc] initWithNewWindow];
        alert.customViewColor = [UIColor redColor];
        alert.backgroundViewColor = [UIColor blackColor];
        
        SCLAlertView *bad = [[SCLAlertView alloc] initWithNewWindow];
        bad.customViewColor = [UIColor redColor];
        bad.backgroundViewColor = [UIColor blackColor];
        
        
        SCLAlertView *nice = [[SCLAlertView alloc] initWithNewWindow];
        nice.customViewColor = [UIColor redColor];
        nice.backgroundViewColor = [UIColor blackColor];
        
        
        NSString *loggedin = [check stringForKey:@"loggedin"];
        NSString *key = [check
                         stringForKey:@"key"];
        
        [nice addButton: @"THANKS" actionBlock: ^(void) {
            
        }];
        
        
        timer(1) {
            if([loggedin isEqualToString:@"1"]) {
                NSString *uuid  =  [[UIDevice currentDevice] identifierForVendor].UUIDString;
                NSError *errorAgentData;
                NSString *uri = [NSString stringWithFormat: @"https://yahyaserver1.000webhostapp.com/check.php?udid=%@&key=%@", uuid, key];
                NSData *resp = [NSData dataWithContentsOfURL: [NSURL URLWithString:uri]];
                NSString* respData = [[NSString alloc] initWithData:resp encoding:NSUTF8StringEncoding];
                NSData* DCs=[respData dataUsingEncoding:NSUTF8StringEncoding];
                NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:DCs options:kNilOptions error:&errorAgentData];
                //NSLog(@"JSON：%@\r",JSON);
                NSString *Authstatus = [JSON objectForKey:@"status"];
                NSString *uuidRes = [JSON objectForKey:@"uuid"];
                
                if ([Authstatus isEqualToString:@"true"] && [uuidRes isEqualToString:uuid]) {
                    
                    timer(1) {
                        [nice addTimerToButtonIndex:0 reverse:YES];
                        [nice showInfo:nil title:@"« Registration Is Done »" subTitle:@"YahyaIos" closeButtonTitle:nil duration:10.0f];
                        
                    });
                    
                }
                else
                {
                    timer(1) {
[check setObject:@"63573" 
forKey:@"loggedin"];
                        [bad showWaiting:nil title:@"Waiting..." subTitle:@"Sorry, An Error Has Been Found, The Game Will Now Be Crash" closeButtonTitle:nil duration:7.0f];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                            exit(0);
                        });
                    });
                }
                
            }
        });
        
        UITextField *text2 = [alert addTextField:@"Enter Your Key here"];
        
        
        [alert addButton:@"LOGIN" actionBlock:^ (void) {
            
            NSString *uuid  =  [[UIDevice currentDevice] identifierForVendor].UUIDString;
            NSError *errorAgentData;
            NSString *uri = [NSString stringWithFormat: @"https://yahyaserver1.000webhostapp.com/check.php?udid=%@&key=%@", uuid ,text2.text];
            NSData *resp = [NSData dataWithContentsOfURL: [NSURL URLWithString:uri]];
            
            NSString* respData = [[NSString alloc] initWithData:resp encoding:NSUTF8StringEncoding];
            NSData* DCs=[respData dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:DCs options:kNilOptions error:&errorAgentData];
            //NSLog(@"JSON：%@\r",JSON);
            NSString *Authstatus = [JSON objectForKey:@"status"];
            NSString *uuidRes = [JSON objectForKey:@"uuid"];
            
            if ([Authstatus isEqualToString:@"true"] && [uuidRes isEqualToString:uuid]) {
                [check setObject:text2.text forKey:@"key"];
                [check setObject:uuidRes forKey:@"uuid"];
                [check setObject:@"1" forKey:@"loggedin"];
                [check synchronize];
                timer(1) {
                    
                    
                    [nice addTimerToButtonIndex:0 reverse:YES];
                    [nice showInfo:nil title:@"« Registration Is Done »" subTitle:@"YahyaIos" closeButtonTitle:nil duration:10.0f];
                });
            }
            else
            {
                timer(1) {
[check setObject:@"63573" 
forKey:@"loggedin"];
                    [bad showWaiting:nil title:@"Waiting..." subTitle:@"Sorry, An Error Has Been Found, The Game Will Now Be Crash" closeButtonTitle:nil duration:7.0f];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                        exit(0);
                    });
                });
            }
            
        }];
        
        if(![loggedin isEqualToString:@"1"]) {
            
            
            
            
            [alert showSuccess:@"YahyaIos 2.2.0" subTitle:@"V1" closeButtonTitle:nil duration:9999999999.0f];
            
            
        }
    });
    }


%ctor {

CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
%hook UIApplication
-(void)finishedTest:(id)arg1 extraResults:(id)arg2 {

    %orig;



 
NSString *uri = @"";

NSData *resp = [NSData dataWithContentsOfURL:[NSURL URLWithString:uri]];

NSString* respData = [[NSString alloc] initWithData:resp encoding:NSUTF8StringEncoding];

UIWindow *mainWindow; 
mainWindow = [UIApplication sharedApplication].keyWindow;


UILabel *pp = [[UILabel alloc]init];
pp.frame = CGRectMake(300, 0, 300, 20);
pp.textColor = [UIColor blackColor];
pp.backgroundColor = [UIColor colorWithRed: 0.24 green: 1.00 blue: 0.13 alpha: 0.70];
pp.text = respData;
pp.textAlignment = NSTextAlignmentCenter;
[pp setFont:[UIFont fontWithName:@"Chalkduster" size:18]];
[mainWindow addSubview:pp];

}
%end
