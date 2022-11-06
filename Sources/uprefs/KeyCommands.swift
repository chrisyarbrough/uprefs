import ArgumentParser

extension UnityPrefs {
    struct HasKey: PrefsCommand {
        @OptionGroup
        var editOptions: EditOptions

        func edit(_ dict: inout [String: Any]) throws {
            print(dict[editOptions.key] != nil)
        }
    }

    struct DeleteKey: PrefsCommand {
        @OptionGroup
        var editOptions: EditOptions

        func edit(_ dict: inout [String: Any]) throws {
            dict.removeValue(forKey: editOptions.key)
        }
    }
}
