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
//  CallStopScheduledResponse.m
//  SmsVoice
//
//  Created by Nirwan Nursabda on 7/10/15.
//

#import "CallStopScheduledResponse.h"

@implementation CallStopScheduledResponse
- (instancetype)init
{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (instancetype) initWithJSONString:(NSDictionary *)jsonResp{
    self = [super init];
    if(self){
        for (NSString* key in jsonResp) {
            if([key isEqualToString:@"data"]){
                NSDictionary *datas = [jsonResp valueForKeyPath:@"data"];
                
                for (NSString* keys in datas) {
                    [self setValue:[datas valueForKey:keys] forKey:keys];
                }
            }else if([key isEqualToString:@"message"]){
                const id object = [jsonResp valueForKeyPath:@"message"];
                if (object == nil) {
                    NSLog(@"contain null value");
                }
                else if ([object isKindOfClass: [NSDictionary class]]) {
                    super.message = [[NSMutableDictionary alloc]init];
                    NSDictionary *datas = [jsonResp valueForKeyPath:@"message"];
                    for (id obj in datas) {
                        NSArray *dataArrays = [datas valueForKeyPath:obj];
                        [super.message setObject:dataArrays forKey:obj];
                    }
                }else if([object isEqualToString:@""]){
                    NSLog(@"empty message");
                }else if ([object isKindOfClass: [NSString class]]) {
                    super.message = [[NSMutableDictionary alloc]init];
                    NSMutableDictionary *datas = [[NSMutableDictionary alloc]init];
                    [datas setObject:[jsonResp valueForKeyPath:@"message"] forKey:@"message"];
                    for (id obj in datas) {
                        NSArray *dataArrays = [datas valueForKeyPath:obj];
                        [super.message setObject:dataArrays forKey:obj];
                    }
                }
            }else if([key isEqualToString:@"success"]){
                [super setSuccess:[jsonResp valueForKey:key]];
            }else{
                [self setValue:[jsonResp valueForKey:key] forKey:key];
            }
            
            
        }
    }
    
    return self;
}

- (NSString*) toString{
    return [NSString stringWithFormat:@"{success=%@, message=%@, errorCode=%@, MessageResponse{Success=%@}}", [super success], [super toStringMessage], [super errorCode], _Success];
}

@end
