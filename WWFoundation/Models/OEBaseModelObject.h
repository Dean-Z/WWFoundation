//
//  OEBaseModelObject.h
//  RocheRubik
//
//  Created by William Wu on 1/30/14.
//  Copyright (c) 2014 Oneve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IBCoreDataStore.h"

@interface OEBaseModelObject : NSObject

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSNumber *update_time;

- (id) toCoreDataEntity:(Class)entityType inStore:(IBCoreDataStore *)dataStore;
- (id) updateCoreDataEntity:(NSManagedObject *)entity;

+ (id) fromCoreDataEntity:(NSObject *)entity;
- (id) fromCoreDataEntity:(NSObject *)entity;

+ (id) fromDictionary:(NSDictionary *)dictionary;

@end
