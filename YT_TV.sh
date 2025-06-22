#!/bin/bash
set -e

# 合并的频道 ID（已去重）
CHANNEL_IDS=(410355 370177 369244 370183 369248 370173 370172 369324 415097 369318 370171 335029 369749 403819 412098 405729 410308)

# 输出文件名
OUTPUT_FILE="YT_TV.xml"

echo "🛠️ 开始生成 $OUTPUT_FILE ..."
echo '<?xml version="1.0" encoding="UTF-8"?><tv>' > "$OUTPUT_FILE"

for id in "${CHANNEL_IDS[@]}"; do
  echo "📺 Fetching channel_id=$id"
  curl -s "https://epg.pw/api/epg.xml?channel_id=$id" \
    | grep -v '?xml' | grep -v '<tv>' | grep -v '</tv>' >> "$OUTPUT_FILE"
done

echo '<!-- generated at '"$(date -u '+%Y-%m-%d %H:%M:%S UTC')" '-->' >> "$OUTPUT_FILE"
echo '</tv>' >> "$OUTPUT_FILE"

echo "✅ 完成：已生成 $OUTPUT_FILE"
