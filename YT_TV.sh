#!/bin/bash
set -e

# 合并频道 ID
CHANNEL_IDS=(410355 370177 369244 369244 370183 369248 370173 370172 369324 415097 369318 370171)

# 创建输出文件
echo '<?xml version="1.0" encoding="UTF-8"?><tv>' > YT_TV.xml

for id in "${CHANNEL_IDS[@]}"; do
  curl -s "https://epg.pw/api/epg.xml?channel_id=$id" \
    | grep -v '?xml' | grep -v '<tv>' | grep -v '</tv>' >> YT_TV.xml
done

echo '</tv>' >> YT_TV.xml
