import ArgumentParser

extension UnityPrefs {
    struct GetValue: PrefsCommand {
        @OptionGroup
        var editOptions: EditOptions

        func edit(_ dict: inout [String: Any]) throws {
            print(dict[editOptions.key]!)
        }
    }
}
