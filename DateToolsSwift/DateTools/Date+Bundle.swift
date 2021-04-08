//
//  Date+Bundle.swift
//  DateTools
//
//  Created by Matthew York on 8/26/16.
//  Copyright © 2016 Matthew York. All rights reserved.
//

import Foundation

public extension Bundle {
  
    class var dateToolsBundle: Bundle {
        let assetPath = Bundle.module.resourcePath!
        return Bundle(path: NSString(string: assetPath).appendingPathComponent("DateTools.bundle"))!
    }
}

