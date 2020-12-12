//
//  AlbumTest.swift
//  NikeSampleProjectTests
//
//  Created by David Rynn on 12/11/20.
//

import XCTest
@testable import NikeSampleProject

class AlbumTest: XCTestCase {
    var sut: AppleResponse?

    override func setUpWithError() throws {
        super.setUp()
        let data = try getDataFromJSON()
        let decoder = JSONDecoder()
        sut = try decoder.decode(AppleResponse.self, from: data)
    }

    override func tearDown() {
        sut = nil
    }

    func testOptions_shouldHave100Count() {
        guard let sut = sut else {
            XCTFail()
            return
        }
        let feed = sut.feed
        let results = feed.results
        if results.count != 100 {
            XCTFail()
        }
    }

    func testOptions_shouldHaveName() {
        guard let sut = sut else {
            XCTFail()
            return
        }
        let feed = sut.feed
        let results = feed.results

        guard let first = results.first else {
            XCTFail()
            return
        }

        XCTAssert(first.name == "EL ÚLTIMO TOUR DEL MUNDO", first.name)
    }

    func testOptions_shouldHaveArtistName() {
        guard let sut = sut else {
            XCTFail()
            return
        }
        let feed = sut.feed
        let results = feed.results

        guard let first = results.first else {
            XCTFail()
            return
        }

        XCTAssert(first.artistName == "Bad Bunny", first.artistName)
    }


}

extension XCTestCase {
    enum TestError: Error {
        case fileNotFound
    }

    func getDataFromJSON() throws -> Data {
        let fileName = "TestJson"
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing File: \(fileName).json")
            throw TestError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}
