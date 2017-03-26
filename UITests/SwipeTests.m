//
//  SwipeTests.m
//  PageTest
//
//  Created by Chris Fuentes on 3/25/17.
//  Copyright © 2017 cfuentes. All rights reserved.
//

#import <VSMobileCenterExtensions/VSMobileCenterExtensions.h>
#import <XCTest/XCTest.h>

@interface SwipeTests : XCTestCase

@end

@implementation SwipeTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)testFail {
    label(@"And I expect to fail");
    XCUIApplication *app = [XCUIApplication new];
    XCUIElement *fake = app.staticTexts[@"fake"];
    XCTAssert(fake.exists, @"CRASH!");
}

- (void)testSwipeAround {
    XCUIApplication *app = [XCUIApplication new];
    label(@"I will swipe left");
    XCUIElement *swipable = [[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element;
    [swipable swipeLeft];

    label(@"And I expect to see February");
    XCUIElement *february = app.staticTexts[@"February"];
    XCTAssert(february.exists, @"Could not see February after swiping left.");

    label(@"And I swipe back right");
    [swipable swipeRight];

    label(@"And I expect to see January");

    XCUIElement *january = app.staticTexts[@"January"];
    XCTAssert(january.exists, @"Could not see January after swiping right.");
}


@end
