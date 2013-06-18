//
//  User.h
//  Keyless
//
//  Created by David Mazza on 6/17/13.
//  Copyright (c) 2013 David Mazza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (strong, nonatomic) NSArray *passwords;

//-(id)initWithJSON;
+(NSString *)getPathToArchive;

+(User *)getUser;
+(void)saveUser:(User *)aUser;

@end
