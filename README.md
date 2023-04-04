# Keynote Presentation Exporter

This AppleScript automates the process of exporting a Keynote presentation to a PDF file, based on user-selected tags.  The script is intended to simplify the creation of multiple decks for pitching, sales, different languages, and so on, from a single master deck. When run, the script prompts the user to select a Keynote file and a list of tags to include in the exported PDF.  The script will hide the unwanted slides, export the deck as a PDF, and restore the deck to the state it was in when run.

## Requirements

- macOS
- Keynote

## Usage

1. Double-click the script file to open it in the Script Editor.
2. Run the script by clicking the "Run" button or by pressing Command + R.
3. Follow the prompts to select a Keynote file, choose tags to include, and specify the output PDF file name.
4. The script will loop through all slides of the presentation and set their visibility based on the selected tags.
5. The script will export the presentation as a PDF file with the specified file name and location.
6. The script will restore the original visibility state of each slide.
7. Close the Keynote file.

## License

This script is licensed under the Unlicense.
