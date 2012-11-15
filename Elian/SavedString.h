//
//  SavedString.h
//  Elian
//
//  Created by Harlan Haskins on 10/28/12.
//  Copyright (c) 2012 Valley Rocket. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserStats;

@interface SavedString : NSManagedObject

@property (nonatomic, retain) NSString * savedText;
@property (nonatomic, retain) UserStats *userStats;

@end
