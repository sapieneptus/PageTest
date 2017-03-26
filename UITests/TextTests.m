
#import <VSMobileCenterExtensions/VSMobileCenterExtensions.h>
#import <XCTest/XCTest.h>

@interface TextTests : XCTestCase
@end

@implementation TextTests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)type:(NSString *)text {
    label(@"I am preparing to type text");
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *textView = [[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeTextView].element;
    [textView tap];
    [textView tap];
    sleep(1);
    [textView tap];
    [textView tap];    
    
    [textView typeText:text];

    label(@"Then I type '%@'", text);
}

- (void)test1 {
    [self type:NSStringFromSelector(_cmd)];
}

- (void)test2 {
    [self type:NSStringFromSelector(_cmd)];
}

- (void)test3 {
   [self type:NSStringFromSelector(_cmd)];
}

@end
