/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2015 OTS
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

//
//  EmailTests.m
//  SmsVoice
//
//  Created by Nirwan Nursabda on 7/10/15.
//

#import <XCTest/XCTest.h>
#import "EmailResourceImpl.h"

@interface EmailTests : XCTestCase

@end

@implementation EmailTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void) testSendEmail{
    @try {
        NSString *appSid = @"cYWr62UeR6mbGZw6qHWUhiVX8z5ed";
        EmailResourceImpl *impl = [[EmailResourceImpl alloc] init];
        [impl initializeEmailResourceImpl:appSid];
        
        //param
        NSString *recipient = @"nirwan_jr1@yahoo.com";
        NSString *from = @"Test";
        NSString *body = @"Test Email";
        
        //send message id status
        EmailSendResponse *response = [impl send:recipient withFrom:from withBody:body];
        
        if([response.success isEqualToString:@"true"]){
            NSLog(@"%@", [response toString]);
            NSLog(@"Parsing send email successfully");
        }else{
            NSLog(@"%@", [response toString]);
            NSLog(@"Failed send email");
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Error cause of: %@ - %@", exception.name, exception.reason);
    }
}

-(void) testGetEmailsReport{
    @try {
        NSString *appSid = @"cYWr62UeR6mbGZw6qHWUhiVX8z5ed";
        EmailResourceImpl *impl = [[EmailResourceImpl alloc] init];
        [impl initializeEmailResourceImpl:appSid];
        
        //send message id status
        EmailGetReportResponse *response = [impl getEmailsReport];
        
        if([response.success isEqualToString:@"true"]){
            NSLog(@"%@", [response toString]);
            NSLog(@"Parsing get emails report successfully");
        }else{
            NSLog(@"%@", [response toString]);
            NSLog(@"Failed get emails report");
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Error cause of: %@ - %@", exception.name, exception.reason);
    }
}

@end
