//
//  GIDACalculateStringTests.m
//  GIDACalculateStringTests
//
//  Created by Alejandro Paredes Alva on 19/03/14.
//  Copyright (c) 2014 GIDAIbero. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GIDACalculateString.h"

@interface GIDACalculateStringTests : XCTestCase

@end


/* Methods to check
 +(BOOL)usingThis:(NSString *)string addThis:(NSString *)newString;
 +(BOOL)usingThis:(NSString *)string addThis:(NSString *)newString here:(NSRange)range;
 
 +(NSString *)stringFrom:(NSString *)string withThis:(NSString *)newString;
 +(NSString *)stringFrom:(NSString *)string withThis:(NSString *)newString here:(NSRange)range;
 
 +(NSNumber *)solveString:(NSString *)string;
*/
@implementation GIDACalculateStringTests

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

- (void)testUsingThisAddThis {
    NSString *usingThis;
    NSArray  *addThisArray;
    NSString *addThis;
    
    usingThis    = @"";
    addThisArray =  @[@"+",@"*",@"/",@")"];
    for (addThis in addThisArray) {
        XCTAssertFalse([GIDACalculateString usingThis:usingThis addThis:addThis], @"GIDACalculateString usingThis:addThis:\tFailed to return false using:%@ and adding:%@",usingThis, addThis);
    }
    
    usingThis    = @"";
    addThisArray = @[@"-",@"(",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",];
    for (NSString *addThis in addThisArray) {
        XCTAssertTrue([GIDACalculateString usingThis:usingThis addThis:addThis], @"GIDACalculateString usingThis:addThis:\tFailed to return true using:%@ and adding:%@",usingThis, addThis);
    }
   
    usingThis    = @".";
    addThisArray = @[@".",@"+",@"-",@"*",@"/",@"(",@")"];
    for (addThis in addThisArray) {
        XCTAssertFalse([GIDACalculateString usingThis:usingThis addThis:addThis], @"GIDACalculateString usingThis:addThis: Failed to return false using:%@ and adding:%@", usingThis, addThis);
    }
    usingThis    = @"(";
    addThisArray = @[@"+",@"*",@"/",@")"];
    for (addThis in addThisArray) {
        XCTAssertFalse([GIDACalculateString usingThis:usingThis addThis:addThis], @"GIDACalculateString usingThis:addThis: Failed to return false using:%@ and adding:%@", usingThis, addThis);
    }
    
    usingThis    = @"3";
    addThisArray = @[@")"];
    for (addThis in addThisArray) {
        XCTAssertFalse([GIDACalculateString usingThis:usingThis addThis:addThis], @"GIDACalculateString usingThis:addThis: Failed to return false using:%@ and adding:%@", usingThis, addThis);
    }
    
    usingThis    = @"3.5";
    addThisArray = @[@"."];
    for (addThis in addThisArray) {
        XCTAssertFalse([GIDACalculateString usingThis:usingThis addThis:addThis], @"GIDACalculateString usingThis:addThis: Failed to return false using:%@ and adding:%@", usingThis, addThis);
    }
    
    usingThis    = @"-";
    addThisArray = @[@"+",@"-",@"*",@"/",@")"];
    for (addThis in addThisArray) {
        XCTAssertFalse([GIDACalculateString usingThis:usingThis addThis:addThis], @"GIDACalculateString usingThis:addThis: Failed to return false using:%@ and adding:%@", usingThis, addThis);
    }
}



@end
