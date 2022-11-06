import ArgumentParser
import Foundation
import Rainbow

extension UnityPrefs {
    struct List: PrefsCommand {
        static let configuration = CommandConfiguration(abstract: "Lists the Unity EditorPrefs line by line.")

        enum OutputType: String, EnumerableFlag {
            case keys
            case values
            case keysAndValues

            static func name(for value: Self) -> NameSpecification {
                switch value {
                case .keys:
                    return [.customShort("k"), .long]
                case .values:
                    return [.customShort("v"), .long]
                case .keysAndValues:
                    return .long
                }
            }
        }

        @Flag(help: "Should the command print 'keys', 'values' or 'keysAndValues'?")
        var outputType: OutputType = .keysAndValues

        @Option(name: .shortAndLong, help: "A string that separates key and value.")
        var delimiter = ": "

        @Option(name: .shortAndLong, help: "A string which indents each entry.")
        var indent = String(repeating: " ", count: 4)

        @Flag(name: .shortAndLong, help: "Remove newlines from pref values.")
        var singleLine = false;

        @Flag(help: "Print output without ansi colors.")
        var noColor = false

        func edit(_ dict: inout [String: Any]) throws {
            if noColor || getenv("UPREFS_NO_COLOR") != nil {
                Rainbow.enabled = false
            }

            for (key, value) in dict.sorted(by: { $0.key < $1.key }) {
                let message = buildOutputLine(key, value)
                print(message)
            }
        }

        private func buildOutputLine(_ key: String, _ value: Any) -> String {
            var line: String = indent

            switch outputType {
            case .keys:
                line += String(describing: key)

            case .values:
                line += filteredStringFor(value)

            case .keysAndValues:
                line += String(describing: key).green
                line += delimiter
                line += filteredStringFor(value)
            }
            return line
        }

        private func filteredStringFor(_ value: Any) -> String {
            var s = String(describing: value)
            if singleLine {
                s = s.filter {
                    !$0.isNewline
                }
            }
            return s;
        }
    }
}
