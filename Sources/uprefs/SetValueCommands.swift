import ArgumentParser

extension UnityPrefs {
    struct SetString: PrefsCommand {

        @OptionGroup
        var editOptions: EditOptions

        @Argument
        var value: String

        func edit(_ dict: inout [String: Any]) throws {
            dict[editOptions.key] = value;
        }
    }

    struct SetInt: PrefsCommand {
        @OptionGroup
        var editOptions: EditOptions

        @Argument
        var value: Int

        func edit(_ dict: inout [String: Any]) throws {
            dict[editOptions.key] = value;
        }
    }

    struct SetFloat: PrefsCommand {
        @OptionGroup
        var editOptions: EditOptions

        @Argument
        var value: Float

        func edit(_ dict: inout [String: Any]) throws {
            dict[editOptions.key] = value;
        }
    }

    struct SetBool: PrefsCommand {
        @OptionGroup
        var editOptions: EditOptions

        @Argument
        var value: Bool

        func edit(_ dict: inout [String: Any]) throws {
            dict[editOptions.key] = value ? 1 : 0
        }
    }
}
