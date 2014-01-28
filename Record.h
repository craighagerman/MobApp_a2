//
//  Record.h
//  MobApp_a2
//
//  Created by Craig Hagerman on 1/27/14.
//  Copyright (c) 2014 ece1778. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Record : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * favoritefood;
@property (nonatomic, retain) NSNumber * age;

@end
