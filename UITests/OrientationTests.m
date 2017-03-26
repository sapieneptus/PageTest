//
//  OrientationTests.m
//  PageTest
//
//  Created by Chris Fuentes on 3/25/17.
//  Copyright © 2017 cfuentes. All rights reserved.
//

#import <VSMobileCenterExtensions/VSMobileCenterExtensions.h>
#import <XCTest/XCTest.h>

@interface OrientationTests : XCTestCase

@end

@implementation OrientationTests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testAppOrientationLandscapeLeft {
    [self testAppOrientation: @"Landscape Left"];
}

- (void)testAppOrientationPortraitUpsideDown {
    [self testAppOrientation: @"Portrait, upside-down"];
}

- (void)testAppOrientationLandscapeRight {
    [self testAppOrientation: @"Landscape Right"];
}

- (void)testAppOrientationPortrait {
    [self testAppOrientation: @"Portrait"];
}

- (void)testAppOrientation: (NSString*) orientation {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    label(@"I can select %@",  orientation);
    [self waitAndTap: app.buttons[@"Orientations"]];
    [self waitAndTap: app.buttons[orientation]];
    XCTAssert(app.staticTexts[[@"This is " stringByAppendingString: orientation.lowercaseString]].exists);
    label(@"I was able to select %@", orientation);
}

- (void) waitAndTap: (XCUIElement *) element {
    NSPredicate *exists = [NSPredicate predicateWithFormat: @"exists == true"];
    XCTestExpectation *expectation = [self expectationForPredicate: exists evaluatedWithObject: element handler: nil];

    [self waitForExpectationsWithTimeout: 5 handler: nil];
    [element tap];
}

@end
