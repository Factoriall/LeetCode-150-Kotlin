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

# 3. Notes.md 생성 (요청하신 한글 형식)
cat <<EOF > "$DIR_NAME/Notes.md"
# Q${NUMBER}. $TITLE_RAW

## 💡 Approach
- 

## ⏳ Complexity
- Time: O()
- Space: O()
EOF

# 4. README.md 데이터 업데이트
README_FILE="README.md"
TOTAL=150
COMPLETED=$(find src/leetcode/Top150 -maxdepth 1 -type d -name "Q*" | wc -l | xargs)
PERCENT=$(( COMPLETED * 100 / TOTAL ))
FILLED=$(( PERCENT / 10 ))
EMPTY=$(( 10 - FILLED ))
BAR=$(printf '▓%.0s' $(seq 1 $FILLED 2>/dev/null || true))$(printf '░%.0s' $(seq 1 $EMPTY 2>/dev/null || true))

# Status 업데이트 (OS별 대응)
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i "" "s@Status:.*@Status: $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
    sed -i "" "s@진행률:.*@진행률: [$BAR] $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
else
    sed -i "s@Status:.*@Status: $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
    sed -i "s@진행률:.*@진행률: [$BAR] $COMPLETED / $TOTAL ($PERCENT%)@g" "$README_FILE"
fi

# 5. Problem List 표에 새 문제 추가 (줄바꿈 처리 포함)
PROBLEM_LINK="https://leetcode.com/problems/${TITLE_DASH}/"
TABLE_ROW="| ${NUMBER} | ${TITLE_RAW} | [Link](${PROBLEM_LINK}) |"

if ! grep -q "${NUMBER}" "$README_FILE"; then
    # 파일 끝에 줄바꿈이 없으면 추가하여 표 꼬임 방지
    [[ $(tail -c1 "$README_FILE" | wc -l) -eq 0 ]] && echo "" >> "$README_FILE"
    echo "$TABLE_ROW" >> "$README_FILE"
fi

echo "✅ Done: Q${NUMBER} $TITLE_RAW"