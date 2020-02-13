import Foundation

protocol DecoderType {
    func decode<T: Decodable>(data: Data) throws -> T
}

class Decoder: DecoderType {

    // MARK: - DecoderType

    func decode<T>(data: Data) throws -> T where T : Decodable {
        try JSONDecoder().decode(T.self, from: data)
    }

}
