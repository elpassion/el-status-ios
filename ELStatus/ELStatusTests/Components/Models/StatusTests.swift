@testable import ELStatus
import XCTest
import Networking

class StatusTests: XCTestCase {

    func testStatusParsing() {
        do {
            let data = JSONReader.jsonData(name: "statuses")
            let decoder = ResponseDecoder()
            let statuses = try decoder.decode(data) as [Status]
            XCTAssertEqual(statuses.count, 1)
            XCTAssertEqual(statuses.first?.type, StatusType.off)
            XCTAssertEqual(statuses.first?.comment, "doctor")
            XCTAssertEqual(statuses.first?.user, User(firstName: "James", lastName: "Bond"))
        } catch {
            XCTFail("can not decode data! \(error)")
        }
    }

}
