//
//  Password.h
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Password : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *customPassword;
@property (strong, nonatomic) NSString *customUrl;

- (id)initWithName:(NSString *)aName message:(NSString *)aMessage customPassword:(NSString *)aCustomPassword customUrl:(NSString *)aCustomUrl;
@end
