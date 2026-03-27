# Q0027. Remove Element

## 💡 Approach
- 기본: Forward 투포인터 압축 (`nums[i] != val`만 앞쪽으로 복사)
- 최적화 포인트: `val`이 많으면 양끝 투포인터 스왑 (`nums[left] == val`이면 `nums[right]`와 교환 후 길이 감소)
- 포인트: 순서 보장이 필요 없어서 스왑 전략이 유효

## ⏳ Complexity
- Time: O(n)
- Space: O(1)
