//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */

- (NSArray *)pickApplesFromFruits:(NSArray *)fruits {
    
    NSString *fruit ;
    NSMutableArray *pickApplesFromFruits = [ NSMutableArray new ];
    for ( NSUInteger i = 0 ; i < [ fruits count ] ; i++ ) {
        fruit = fruits[i] ;
        if ( [ fruit isEqualToString:@"apple" ] ) {
            [ pickApplesFromFruits addObject:fruit ];
        }
        NSLog(@"%@", pickApplesFromFruits );
    }
    return pickApplesFromFruits;
}

- (NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    
    NSMutableArray *holidaysInSeason = [ NSMutableArray new ];
    holidaysInSeason = [ database[season] allKeys ] ;
    NSLog(@"%@",holidaysInSeason);
    return holidaysInSeason;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableArray *suppliesInHoliday = [ NSMutableArray new ] ;
    for ( NSUInteger i = 0 ; i < [ database[season][holiday] count ]; i++ ) {
        NSString *item = database[season][holiday][i] ;
        [ suppliesInHoliday addObject:item ];
    }
    NSLog(@"%@", suppliesInHoliday) ;
    return suppliesInHoliday ;
}

- (BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database
{
    BOOL isInSeason ;
    NSUInteger holidayCheck ;
    
    if ( [database[season] objectForKey:holiday ] == nil ) {
        isInSeason = 0;
    }
    else {
        isInSeason = 1;
    }
//    if ( [ database[season] containsObject:holiday ]) {
//        isInSeason = 1 ;
//    }
//    else {
//        isInSeason = 0 ;
//    }
//    NSPredicate *holidayMatch = [NSPredicate predicateWith:holiday] ;
//    
//    NSArray *holidays = [ database[season] filteredArrayUsingPredicate:holidayMatch ] ;
//    if ( [holidays count ] > 0 ) {
//        isInSeason = YES ;
//    }
//    else {
//        isInSeason = NO ;
//    }
    return isInSeason ;
}
- (BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    BOOL isInHoliday = [ database[season][holiday] containsObject:supply];
    return isInHoliday;
    
}

- (NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *addHoliday = [ database copy ] ;
    addHoliday[season][holiday] = [ NSMutableArray new ];
    NSLog(@"%@", addHoliday[season]);
    return addHoliday ;
}
- (NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database {
    NSMutableDictionary *addSupply = [ database copy ] ;
    addSupply[season][holiday] = supply ;
    return addSupply;
}

@end