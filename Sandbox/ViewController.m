//
//  ViewController.m
//  Sandbox
//
//  Created by Alejandro Martin on 24/4/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
    // Path to cache folder of sandbox
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSURL *url = [[fm URLsForDirectory:NSCachesDirectory
                             inDomains:NSUserDomainMask] lastObject];
    url = [url URLByAppendingPathComponent: @"test.txt"];
    
    NSError *error = nil;
    BOOL rc = NO;
    
    rc = [@"Hola mundo!" writeToURL:url
                         atomically:YES
                           encoding:NSUTF8StringEncoding
                              error:&error];
    
    if (rc == NO) {
        NSLog(@"Error al guardar: %@", error);
    }
    
    NSString *res = [NSString stringWithContentsOfURL:url
                                             encoding:NSUTF8StringEncoding
                                                error:&error];
    
    if (res == nil) {
        NSLog(@"Error al leer: %@", error);
    }
}
@end
