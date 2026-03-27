#!/bin/bash

# 프로젝트 루트로 이동
cd "$(dirname "$0")/.."

if [ $# -lt 2 ]; then
    echo "Usage: lgen [Number] [Title]"
    exit 1
fi

NUMBER=$(printf "%04d" $1)
TITLE_RAW=$2
TITLE_UNDERSCORE=$(echo $2 | sed 's/ /_/g')
# 리트코드 URL용: 특수문자 제거 및 소문자 변환
TITLE_DASH=$(echo $2 | sed 's/ /-/g' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]//g')
DIR_NAME="src/leetcode/Top150/Q${NUMBER}_${TITLE_UNDERSCORE}"

# 1. 폴더 생성
mkdir -p "$DIR_NAME"

# 2. Solution.kt 생성
cat <<EOF > "$DIR_NAME/Solution.kt"
package leetcode.Top150.Q${NUMBER}_${TITLE_UNDERSCORE}

class Solution {
    fun solution() {
        // Solve: $TITLE_RAW
    }
}
EOF

# 3. Notes.md 생성 (복잡도 기록용)
cat <<EOF > "$DIR_NAME/Notes.md"
# Q${NUMBER}. $TITLE_RAW

## 💡 Approach
- 

## ⏳ Complexity
- Time: O()
- Space: O()
EOF

# 4. README.md 표에 한 줄 추가 (번호 | 제목 | 링크)
README_FILE="README.md"
PROBLEM_LINK="https://leetcode.com/problems/${TITLE_DASH}/"
TABLE_ROW="| ${NUMBER} | ${TITLE_RAW} | [Link](${PROBLEM_LINK}) |"

if ! grep -q "${NUMBER}" "$README_FILE"; then
    echo "$TABLE_ROW" >> "$README_FILE"
fi

echo "✅ Done: Q${NUMBER} $TITLE_RAW (Folder, Notes, README Updated)"