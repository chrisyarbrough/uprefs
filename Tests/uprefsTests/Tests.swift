import XCTest
@testable import uprefs

final class uprefs_tests: XCTestCase {

    func testEditOptionsFailsValidationWhenKeyIsEmpty() throws {
        var editOptions = EditOptions()
        editOptions.key = ""
        XCTAssertThrowsError(try editOptions.validate())
    }

    func testSetBoolSetsValueAsNumber() throws {
        var command = UnityPrefs.SetBool()
        command.editOptions = EditOptions()
        command.editOptions.key = "MyKey"
        command.value = true
        var dict = Dictionary<String, Any>()
        try command.edit(&dict)
        // Special Unity convention: boolean prefs are saved as number.
        XCTAssertEqual(1, dict["MyKey"] as? Int)
    }

    func testRootCommandHasMetaData() {
        let config = UnityPrefs.configuration

        XCTAssertFalse(config.commandName!.isEmpty)
        XCTAssertFalse(config.abstract.isEmpty)
        XCTAssertFalse(config.version.isEmpty)
    }
}
