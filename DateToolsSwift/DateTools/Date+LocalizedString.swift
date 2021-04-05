import Foundation

func DateToolsLocalizedString(_ key: String, tableName: String? = "DateTools", bundle: Bundle = Bundle.dateToolsBundle, value: String = "", comment: String = "") -> String {
    #if os(Linux)
    // NSLocalizedString() is not available yet, see: https://github.com/apple/swift-corelibs-foundation/blob/16f83ddcd311b768e30a93637af161676b0a5f2f/Foundation/NSData.swift
    // However, a seemingly-equivalent method from NSBundle is:
    return Bundle.main.localizedString(forKey: key, value: value, table: tableName)
    #else
    return NSLocalizedString(key, tableName: tableName, bundle: Bundle.dateToolsBundle, value: value, comment: comment)
    #endif
}
