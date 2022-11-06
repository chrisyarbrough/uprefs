import ArgumentParser

/// Options shared by most sub-commands.
struct EditOptions: ParsableArguments {
    @Argument
    var key: String

    func validate() throws {
        guard !key.isEmpty else {
            throw ValidationError("Please specify a key and value pair.")
        }
    }
}