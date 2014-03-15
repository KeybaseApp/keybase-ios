//
//  PGPKHex2Bin.m
//  Keybase
//
//  Created by App Requests on 3/14/14.
//  Copyright (c) 2014 Turboe Creations. All rights reserved.
//

#import "PGPKHex2Bin.h"

@implementation PGPKHex2Bin
+(char*) decode:(NSString*)string
{
    NSString * hexString = @"AABBCCDD";
    char * myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    printf("%s\n", myBuffer);
    return myBuffer;
}
@end
