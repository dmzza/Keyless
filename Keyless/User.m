//
//  User.m
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import "User.h"

@implementation User

-(id)init {
    self = [super init];
    if(self) {
        self.passwords = [[NSArray alloc] init];
    }
    return self;
}

+(NSString *)getPathToArchive {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [paths objectAtIndex:0];
    return [docsDir stringByAppendingPathComponent:@"user.model"];
}

+(User *)getUser {
	return [NSKeyedUnarchiver unarchiveObjectWithFile:[User getPathToArchive]];
}

+(void)saveUser:(User *)aUser {
	[NSKeyedArchiver archiveRootObject:aUser toFile:[User getPathToArchive]];
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.passwords forKey:@"passwords"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        self.passwords = [aDecoder decodeObjectForKey:@"passwords"];
    }
    return self;
}

@end
