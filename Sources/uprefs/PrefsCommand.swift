import ArgumentParser
import Foundation

/// A command which allows reading from and writing to the Unity EditorPrefs file.
protocol PrefsCommand: ParsableCommand {
    func edit(_ dict: inout [String: Any]) throws
}

extension PrefsCommand {
    func run() throws {
        // From Unity 2017.4: UnityEditor5.x.plist
        // Earlier: UnityEditor.plist
        let path = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(
                "Library/Preferences/com.unity3d.UnityEditor5.x.plist").path
        var dict = try load(path)
        try self.edit(&dict)
        write(dict, path)
    }

    private func load(_ path: String) throws -> [String: Any] {
        guard let data = FileManager.default.contents(atPath: path) else {
            throw RuntimeError("Couldn't read input file '\(path)'.")
        }

        return try PropertyListSerialization.propertyList(from: data, format: nil) as! [String: Any]
    }

    func write(_ dict: [String: Any], _ path: String) {
        (dict as NSDictionary).write(toFile: path, atomically: true)
    }
}
