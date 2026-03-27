# Q0169. Majority Element

## 💡 Approach
- Boyer-Moore Voting: `majorNum`(후보), `majorCount`(투표 수)로 한 번 순회
- `majorCount == 0`이면 현재 값을 새 후보로 교체, 같으면 `+1` 다르면 `-1`
- 과반 원소 존재가 보장되므로 최종 후보가 정답

## ⏳ Complexity
- Time: O(n)
- Space: O(1)
