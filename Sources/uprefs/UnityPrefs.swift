import ArgumentParser
import Foundation

/// The top-level command and entry point to the command line tool.
@main
struct UnityPrefs: ParsableCommand {
    static var configuration = CommandConfiguration(
            commandName: "uprefs",
            abstract: "A utility for reading and modifying Unity EditorPrefs.",
            version: "1.0.0",
            subcommands: [
                List.self,
                GetValue.self,
                SetBool.self,
                SetInt.self,
                SetFloat.self,
                SetString.self,
                HasKey.self,
                DeleteKey.self,
            ])
}
