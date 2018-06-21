//
//    RootClass.swift
//
//    Create by Kam Hong Chan on 19/6/2018
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct HolidayResults: Codable {
    struct Holiday : Codable {
        var date : String
        var description : String
        var holidayCategory : String
        var isHoliday : String
        var name : String
    }
    var resultCount: Int
    var results: [Holiday]
}

