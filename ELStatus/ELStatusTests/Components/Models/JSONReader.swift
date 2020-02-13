import Foundation

class JSONReader {
    static func jsonData(name: String) -> Data {
        FileHelper.shared.data(forPath: name, type: "json", bundle: Bundle(for: MockResponseHelper.self))!
    }

    private class MockResponseHelper {
        static func load(_ fileName: String) -> Data? {
            return FileHelper.shared.data(forPath: fileName, type: "json", bundle: Bundle(for: MockResponseHelper.self))
        }
    }

    private class FileHelper {
        static let shared: FileHelper = {
            let instance = FileHelper()
            return instance
        }()

        func data(forPath path: String, type: String, bundle: Bundle = Bundle.main) -> Data? {
            do {
                if let path = bundle.path(forResource: path, ofType: type) {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                    return data
                }
            } catch {
                return nil
            }
            return nil
        }
    }

}
