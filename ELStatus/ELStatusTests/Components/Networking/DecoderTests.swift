@testable import ELStatus
import Foundation
import XCTest

class DecoderTests: XCTestCase {

    func testDecoder() {
        do {
            let dummyModel = DummyModel(test: "test-123")
            let dummyData = try JSONEncoder().encode(dummyModel)
            let sut = Decoder()
            let model: DummyModel = try sut.decode(data: dummyData)
            XCTAssertEqual(model.test, "test-123")
        } catch {
            XCTFail("Should not throw")
        }
    }

}

private struct DummyModel: Codable {
    let test: String
}
