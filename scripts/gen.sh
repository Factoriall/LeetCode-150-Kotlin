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
TITLE_DASH=$(echo $2 | sed 's/ /-/g' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]//g')
DIR_NAME="src/leetcode/Top150/Q${NUMBER}_${TITLE_UNDERSCORE}"

# 1. 폴더 및 파일 생성
mkdir -p "$DIR_NAME"

# Solution.kt 생성
cat <<EOF > "$DIR_NAME/Solution.kt"
package leetcode.Top150.Q${NUMBER}_${TITLE_UNDERSCORE}

class Solution {
    fun solution() {
        // Solve: $TITLE_RAW
    }
}
EOF

# Notes.md 생성
cat <<EOF > "$DIR_NAME/Notes.md"
# Q${NUMBER}. $TITLE_RAW

## ⏳ Complexity
- Time: O()
- Space: O()
EOF

# 2. README.md 데이터 업데이트 (로컬에서 직접 계산)
README_FILE="README.md"
TOTAL=150

# 현재까지 풀린 문제 개수 계산 (Q로 시작하는 디렉토리 수)
COMPLETED=$(find src/leetcode/Top150 -maxdepth 1 -type d -name "Q*" | wc -l | xargs)
PERCENT=$(( COMPLETED * 100 / TOTAL ))

# 프로그레스 바 생성
FILLED=$(( PERCENT / 10 ))
EMPTY=$(( 10 - FILLED ))
BAR=$(printf '▓%.0s' $(seq 1 $FILLED 2>/dev/null || true))$(printf '░%.0s' $(seq 1 $EMPTY 2>/dev/null || true))

# Status 및 진행률 텍스트 치환 (macOS/Linux 호환용)
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    sed -i "" "s@Status:.*@Status: $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
    sed -i "" "s@진행률:.*@진행률: [$BAR] $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
else
    # Linux
    sed -i "s@Status:.*@Status: $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
    sed -i "s@진행률:.*@진행률: [$BAR] $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
fi

# 3. Problem List 표에 새 문제 추가 (중복 체크 후)
PROBLEM_LINK="https://leetcode.com/problems/${TITLE_DASH}/"
TABLE_ROW="| ${NUMBER} | ${TITLE_RAW} | [Link](${PROBLEM_LINK}) |"

if ! grep -q "${NUMBER}" "$README_FILE"; then
    echo "$TABLE_ROW" >> "$README_FILE"
    echo "✅ Added to Table: $TITLE_RAW"
fi

echo "✅ Done: Q${NUMBER} $TITLE_RAW (Status: $COMPLETED / $TOTAL)"