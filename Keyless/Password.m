//
//  Password.m
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "Password.h"

@implementation Password

-(id)init;
{
    self = [self initWithName:@"Name" message:@"message" customPassword:nil customUrl:nil];
    return self;
}

-(id)initWithName:(NSString *)aName
          message:(NSString *)aMessage
   customPassword:(NSString *)aCustomPassword
        customUrl:(NSString *)aCustomUrl;
{
    self = [super init];
    if (self) {
        self.name = aName;
        self.message = aMessage;
        self.customPassword = aCustomPassword;
        self.customUrl = aCustomUrl;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.message forKey:@"message"];
    [aCoder encodeObject:self.customPassword forKey:@"customPassword"];
    [aCoder encodeObject:self.customUrl forKey:@"customUrl"];
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.message = [aDecoder decodeObjectForKey:@"message"];
        self.customPassword = [aDecoder decodeObjectForKey:@"customPassword"];
        self.customUrl = [aDecoder decodeObjectForKey:@"customUrl"];
    }
    return self;
}

@end
