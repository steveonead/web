#!/bin/bash

# 支援的圖片格式
formats=("png" "jpg" "jpeg" "PNG" "JPG" "JPEG")

# 遍歷所有支援的格式
for format in "${formats[@]}"; do
    # 找出所有符合格式的檔案
    find . -type f -name "*.$format" | while read file; do
        # 取得檔案名稱（不含副檔名）
        filename=$(basename "$file" ".$format")
        directory=$(dirname "$file")

        # 轉換檔案到 WebP 格式
        echo "Converting: $file to ${directory}/${filename}.webp"
        cwebp -q 80 "$file" -o "${directory}/${filename}.webp"
    done
done

echo "Conversion complete!"
