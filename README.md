# uprefs
A command line utility to view and modify Unity EditorPrefs.

<img width="771" alt="uprefs_list" src="https://user-images.githubusercontent.com/17833862/200186113-728030a7-2c56-4bc0-a066-8a6385380854.png">

# Support
Operating system: macOS (tested on Monterey 12.6.1)<br>
Unity version: 2017.4 or newer (at least until 2023)

# Use case
This tool is especially useful as part of an automated build process.
For example, when wanting to set Unity preferences before opening the editor 
in an environment which does not provide a GUI (e.g. CI/CD server).
It can also be used simply as a fast way to view and search for preference
items, e.g. to align their format, delete outdated entries or similar.

# Setup
The utility is written in Swift 5 and runs as a command line application.
Copy the binary to a location of your choice, e.g. `/usr/local/bin/`

Or, build/run from source.

# Dependencies
- Swift Argument Parser
- Rainbow

# Usage
Run `uprefs --help` to see all commands and options.
The utility should not be used to edit prefs 
while Unity is running because changes may be overridden.

## View Entries
Display all EditorPrefs in the format *key:value*:<br>
`uprefs list`

This is the same as:<br>
`uprefs list --keys-and-values`

Search for keys by piping a list of all keys to grep:<br>
`uprefs list --keys | grep 'UnityEditor.'`

To output only the values:<br>
`uprefs list --values`

By default, the list output is indented with whitespace to make it easier
to differentiate entries if some values are long multiline strings.
Disable the indent by specifying an empty string:<br>
`uprefs list -i ''`

If EditorPrefs string values contain many line breaks, the output layout may be hard to read.
To address this, it is possible to remove newlines from values like so:
`uprefs list --single-line`

By default, they output is colored if both keys and values are printed.
The utility attempts to detect when the output is piped into e.g. a file and will not show color in such cases.
To force no color for the command:
`uprefs list --no-color`

Also, the environment variables `NO_COLOR` and `UPREFS_NO_COLOR` are supported.

By default, keys and values are separated by a colon.
To change the delimiter:<br>
`uprefs list -d ' = '`

## View Individual Keys and Values

Use the subcommand `has-key <key>` to check if a key is present
and `get-value <key>` to retrieve the value. 

## Set Values

To set values, use one of the subcommands:<br>
`uprefs set-bool <key> <value>`<br>
`set-int`<br>
`set-float`<br>
`set-string`<br>

## Remove Entries
To remove an entry without confirmation:<br>
`delete-key <key>`

# Contributing
I will attempt to make this tool robust and functional as much as time allows.
Please feel free to add any suggestions, feature requests or bug reports to the GitHub Issues section.
All contributions are welcome!

# Tips
To build a distributable executable:<br>
`swift build --configuration release`

Copy to release folder:<br>
`cp -f .build/release/uprefs /usr/local/bin/uprefs`

To test the utility from source within the package folder:<br>
`swift run`
