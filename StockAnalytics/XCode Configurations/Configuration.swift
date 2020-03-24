import Foundation

/// A class which extracts the value for the provided key for the current build configuration
enum Configuration {

  /// Errors
  enum Error: Swift.Error {
    case missingKey, invalidValue
  }

  /// List of keys available in the build configuration files
  enum Key {
    static let serverURLString = "SERVER_URL_STRING"
  }

  /// Extracts the value for the specified key and throws the error if there's no value or it's invalid value
  /// - Parameter key: Key for which the value needs to be extracted
  static func value<T>(
    for key: String,
    in bundle: Bundle = .main
  ) throws -> T where T: LosslessStringConvertible {
    guard let object = bundle.object(forInfoDictionaryKey: key) else {
      throw Error.missingKey
    }

    switch object {
    case (let value as T):
      return value
    case (let string as String):
      guard let value = T(string) else { fallthrough }
      return value
    default:
      throw Error.invalidValue
    }
  }
}
