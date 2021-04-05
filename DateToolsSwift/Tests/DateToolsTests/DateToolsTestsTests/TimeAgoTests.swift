//
//  TimeAgoTests.swift
//  DateToolsTests
//
//  Created by Grayson Webster on 8/19/16.
//  Copyright © 2016 Matthew York. All rights reserved.
//

import XCTest
@testable import DateToolsSwift


class TimeAgoTests : XCTestCase {
    
    var formatter: DateFormatter!
    var date0: Date!
    var date1: Date!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.formatter = DateFormatter()
        self.formatter.dateFormat = "yyyy MM dd HH:mm:ss.SSS"
        self.date0 = self.formatter.date(from: "2014 11 05 18:15:12.000")
        self.date1 = self.formatter.date(from: "2014 11 07 18:15:12.000")
    }
    
    func testBasicLongTimeAgo() {
        let now: String = self.date0.timeAgo(since: self.date0)
        XCTAssertFalse(now.isEmpty, "'Now' is nil or empty.")
        let ago: String = self.date1.timeAgo(since: self.date0)
        XCTAssertFalse(ago.isEmpty, "Ago is nil or empty.")
    }
    
    func testLongTimeAgo2Days() {
        self.date0 = self.formatter.date(from: "2014 11 05 18:15:12.000")
        self.date1 = self.formatter.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.timeAgo(since: self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("2 days ago"))
    }
    
    func testLongTimeAgo1DayAndHalf() {
        self.date0 = self.formatter?.date(from: "2014 11 06 9:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.timeAgo(since: self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("Yesterday"))
    }
    
    func testLongTimeAgoExactlyYesterday() {
        self.date0 = self.formatter?.date(from: "2014 11 06 18:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.timeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("Yesterday"))
    }
    
    func testLongTimeAgoLessThan24hoursButYesterday() {
        self.date0 = self.formatter?.date(from: "2014 11 06 20:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date1.timeAgo(since:self.date0)
        XCTAssertEqual(ago, DateToolsLocalizedString("22 hours ago"))
    }
    
    func testLongTimeAgoLessThan24hoursSameDay() {
        self.date0 = self.formatter?.date(from: "2014 11 07 10:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.timeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("8 hours ago"))
    }
    
    func testLongTimeAgoBetween24And48Hours() {
        self.date0 = self.formatter?.date(from: "2014 11 07 10:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 08 18:15:12.000")
        let ago: String = self.date0.timeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("Yesterday"))
    }
    
    func testBasicshortTimeAgo() {
        let now: String = self.date0.shortTimeAgo(since:self.date0)
        XCTAssertFalse(now.isEmpty, "'Now' is nil or empty.")
        let ago: String = self.date1.shortTimeAgo(since:self.date0)
        XCTAssertFalse(ago.isEmpty, "Ago is nil or empty.")
    }
    
    func testShortTimeAgo2Days() {
        self.date0 = self.formatter?.date(from: "2014 11 05 18:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.shortTimeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("2d"))
    }
    
    func testShortTimeAgo1DayAndHalf() {
        self.date0 = self.formatter?.date(from: "2014 11 06 9:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.shortTimeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("1d"))
    }
    
    func testShortTimeAgoExactlyYesterday() {
        self.date0 = self.formatter?.date(from: "2014 11 06 18:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.shortTimeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("1d"))
    }
    
    func testShortTimeAgoLessThan24hoursButYesterday() {
        self.date0 = self.formatter?.date(from: "2014 11 06 20:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date1.shortTimeAgo(since:self.date0)
        XCTAssertEqual(ago, DateToolsLocalizedString("22h"))
    }
    
    func testShortTimeAgoLessThan24hoursSameDay() {
        self.date0 = self.formatter?.date(from: "2014 11 07 10:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 07 18:15:12.000")
        let ago: String = self.date0.shortTimeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("8h"))
    }
    
    func testShortTimeAgoBetween24And48Hours() {
        self.date0 = self.formatter?.date(from: "2014 11 07 10:15:12.000")
        self.date1 = self.formatter?.date(from: "2014 11 08 18:15:12.000")
        let ago: String = self.date0.shortTimeAgo(since:self.date1)
        XCTAssertEqual(ago, DateToolsLocalizedString("1d"))
    }
    
    func testLongTimeAgoLocalizationsAccessible() {
        let en_local: String = "Yesterday"
        let ja_local: String = "昨日"
        let key: String = en_local
        let path: String = NSString(string: Bundle.dateToolsBundle.bundlePath).appendingPathComponent("ja.lproj")
        let bundle: Bundle = Bundle(path: path)!
        let ja_result: String = NSLocalizedString(key, tableName: "DateTools", bundle: bundle, value: "", comment: "")
        XCTAssertEqual(ja_local, ja_result, "Could not access localizations.")
    }
    
}

