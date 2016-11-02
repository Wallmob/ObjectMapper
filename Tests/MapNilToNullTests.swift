//
//  ReferenceTypesFromJSON.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2015-11-29.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2014-2016 Hearst
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation
import XCTest
import ObjectMapper

class MapNilToNullTests: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testNilMappingWithBasicTypes() {
		let object = BasicTypes()

		guard let JSONString = Mapper(mapNilToNull: true).toJSONString(object, prettyPrint: true) else {
			XCTFail("Expected Mapper to produce a JSON string")
			return
		}
		guard let JSONData = JSONString.data(using: .utf8) else {
			XCTFail("Expected to be able to convert JSONString to Data")
			return
		}
		guard let JSONObject = try? JSONSerialization.jsonObject(with: JSONData, options: []) else {
			XCTFail("Expected to be able to deserialize JSONData")
			return
		}
		guard let JSONDict = JSONObject as? [String: Any] else {
			XCTFail("Expected JSON to be a Dictionary")
			return
		}

		for key in [
			"boolOpt",
			"intOpt",
			"doubleOpt",
			"floatOpt",
			"stringOpt",
			"anyObjectOpt",
			"arrayBoolOpt",
			"arrayIntOpt",
			"arrayDoubleOpt",
			"arrayFloatOpt",
			"arrayStringOpt",
			"arrayAnyObjectOpt",
			"dictBoolOpt",
			"dictIntOpt",
			"dictDoubleOpt",
			"dictFloatOpt",
			"dictStringOpt",
			"dictAnyObjectOpt",
			"enumIntOpt",
			"enumDoubleOpt",
			"enumStringOpt",
			"arrayEnumIntOpt",
			"dictEnumIntOpt"
			]
		{
				XCTAssertEqual(JSONDict[key] as? NSNull, NSNull())
		}
	}

	func testStandardWithBasicTypes() {
		let object = BasicTypes()

		guard let JSONString = Mapper(mapNilToNull: false).toJSONString(object, prettyPrint: true) else {
			XCTFail("Expected Mapper to produce a JSON string")
			return
		}
		guard let JSONData = JSONString.data(using: .utf8) else {
			XCTFail("Expected to be able to convert JSONString to Data")
			return
		}
		guard let JSONObject = try? JSONSerialization.jsonObject(with: JSONData, options: []) else {
			XCTFail("Expected to be able to deserialize JSONData")
			return
		}
		guard let JSONDict = JSONObject as? [String: Any] else {
			XCTFail("Expected JSON to be a Dictionary")
			return
		}

		for key in [
			"boolOpt",
			"intOpt",
			"doubleOpt",
			"floatOpt",
			"stringOpt",
			"anyObjectOpt",
			"arrayBoolOpt",
			"arrayIntOpt",
			"arrayDoubleOpt",
			"arrayFloatOpt",
			"arrayStringOpt",
			"arrayAnyObjectOpt",
			"dictBoolOpt",
			"dictIntOpt",
			"dictDoubleOpt",
			"dictFloatOpt",
			"dictStringOpt",
			"dictAnyObjectOpt",
			"enumIntOpt",
			"enumDoubleOpt",
			"enumStringOpt",
			"arrayEnumIntOpt",
			"dictEnumIntOpt"
			]
		{
			XCTAssertNil(JSONDict[key])
		}
	}


}
