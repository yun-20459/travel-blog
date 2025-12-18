#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./new_post.sh \"title\""
  exit 1
fi

TITLE="$1"
DATE=$(date +%Y-%m-%d)
NAME="$DATE"
COUNTER=0

while [ -f "content/posts/$NAME.md" ]; do
  COUNTER=$((COUNTER + 1))
  NAME="${DATE}-${COUNTER}"
done

FILEPATH="posts/$NAME.md"

hugo new "$FILEPATH"

FULL_PATH="content/$FILEPATH"

sed -i '' "s/^title = .*/title = \"$TITLE\"/" "$FULL_PATH"

echo "------------------------------------------------"
echo "✅ 文章建立成功！"
echo "📄 檔案路徑: $FULL_PATH"
echo "🏷️  文章標題: $TITLE"
echo "------------------------------------------------"