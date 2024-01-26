#!/bin/bash

# Ensures sips and awk are available
command -v sips >/dev/null 2>&1 || { printf "🚫 Error: sips is required but it's not installed.\n" >&2; exit 1; }
command -v awk >/dev/null 2>&1 || { printf "🚫 Error: awk is required but it's not installed.\n" >&2; exit 1; }

if [ "$#" -ne 1 ]; then
    printf "🚀 Usage: %s <image_directory>\n" "$0"
    exit 1
fi

IMAGE_DIR="$1"
OUTPUT_DIR="$IMAGE_DIR/output"
mkdir -p "$OUTPUT_DIR" || { printf "❌ Failed to create output directory %s\n" "$OUTPUT_DIR" >&2; exit 1; }

resize_image() {
    local input_file="$1"
    local output_file="$2"
    local scale_factor="$3"

    # Read original dimensions and calculate new dimensions
    read -r original_width original_height <<< $(sips -g pixelWidth -g pixelHeight "$input_file" | awk '/pixel/{print $2}')
    local new_width=$((original_width * scale_factor))
    
    # Resize the image
    sips --resampleWidth "$new_width" "$input_file" --out "$output_file" >/dev/null 2>&1 || { printf "❌ Failed to resize image %s\n" "$input_file" >&2; }
}

for IMAGE_FILE in "$IMAGE_DIR"/*.{jpg,jpeg,png,gif}; do
    if [ -f "$IMAGE_FILE" ]; then
        FILENAME=$(basename -- "$IMAGE_FILE")
        EXTENSION="${FILENAME##*.}"
        BASENAME="${FILENAME%.*}"

        printf "🖼 Processing %s...\n" "$FILENAME"

        resize_image "$IMAGE_FILE" "$OUTPUT_DIR/${BASENAME}_1x.$EXTENSION" 1
        resize_image "$IMAGE_FILE" "$OUTPUT_DIR/${BASENAME}_2x.$EXTENSION" 2
        resize_image "$IMAGE_FILE" "$OUTPUT_DIR/${BASENAME}_3x.$EXTENSION" 3

        printf "✅ Done with %s\n" "$FILENAME"
    fi
done
