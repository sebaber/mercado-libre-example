//
//  MercadoLibreExampleTests.swift
//  MercadoLibreExampleTests
//
//  Created by Sebastian Vicario on 27/04/2023.
//

import XCTest
@testable import MercadoLibreExample

final class MercadoLibreExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClientSearchNoMatchResults() throws {
        let search = "&%&/%$&%$&%"
        NetworkManager.shared.fetchSearch(search: search) { (result: Result<SearchResult>) in
            switch result {
            case .success(let result):
                assert(result.results.count == 0)
            case .failure(_): break
            }
        }
    }
    
    func testClientSearchMatchQueryResultParam() throws {
        let search = "Hola"
        NetworkManager.shared.fetchSearch(search: search) { (result: Result<SearchResult>) in
            switch result {
            case .success(let result):
                assert(result.query == search)
            case .failure(_): break
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
