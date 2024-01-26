# Xcode-Image-Resizer
A handy bash script to help generate 1x, 2x, and 3x image sizes for Xcode

This Bash script dynamically resizes JPG, JPEG, PNG, and GIF images in a specified directory to 1x, 2x, and 3x their original dimensions. It's designed to work on macOS, utilizing the `sips` command for image processing.

## Prerequisites

- macOS operating system
- `sips` command-line tool (pre-installed on macOS)
- `awk` command-line utility (pre-installed on macOS)

## Installation

### Short Way
```bash
curl -O https://raw.githubusercontent.com/morganzellers/Xcode-Image-Resizer/main/resize-images.sh && chmod +x resize-images.sh
```

### Long Way

1. Download the `resize-images.sh` script to your local machine.
2. Open Terminal and navigate to the directory containing the downloaded script.
3. Make the script executable by running:

   ```bash
   chmod +x resize-images.sh
   ```

## Usage

To use the script, simply pass the directory containing your images as an argument to the script. The script will create an `output` subdirectory within the specified directory, where it will save the resized images.

```bash
./resize-images.sh /path/to/your/image_directory
```

### What the Script Does

- **🖼 Processes each image:** The script identifies all JPEG, PNG, and GIF images in the specified directory and generates resized versions at 1x, 2x, and 3x their original dimensions.
- **✅ Outputs status messages:** With each step, the script outputs fun and informative messages with emojis, indicating the progress and any issues encountered.
- **📁 Organizes resized images:** All resized images are neatly stored in an `output` folder within the original directory, named according to their size multiplier (e.g., `image_1x.jpg`, `image_2x.jpg`, `image_3x.jpg`).

## Troubleshooting

- **Command Not Found:** If you encounter a `command not found` error, ensure the script is executable (`chmod +x resize-images.sh`).
- **Permission Denied:** Make sure you have read and write permissions for the directory containing your images and the script.
- **Images Not Resizing:** Check that your images are in a supported format (JPEG, PNG, GIF) and that there are no spaces or special characters in the file names that might be causing issues.

## Contributing

Feel free to fork the repository, make improvements, and submit pull requests if you have ideas!

## License

This script is released under the Unlicense. See `LICENSE` file for more details, but you can basically do whatever you want.
