# Q0080. Remove Duplicates from Sorted Array II

## 💡 Approach
- **투포인터 (in-place)**: `i`로 전체를 스캔하고, `rIdx`는 “허용 결과”를 쓸 위치다.
- 앞의 **2칸은 무조건 유지** (`i < 2`일 때 `i`, `rIdx`만 전진).
- 그 이후 `nums[i]`를 넣을지는 **`nums[rIdx - 2]`와 다를 때만** — 결과 배열에서 같은 값이 이미 2번 들어갔는지를 한 번에 판별한다.
- 반환값은 별도 카운터 없이 **`rIdx`**(유효 길이).

## ⏳ Complexity
- Time: O(n)
- Space: O(1)

## [Solution Evolution]
- `feal: solve 80` (`680fba8`): `num`·`isDuplicatedOnce`로 “두 번째까지는 쓰기, 세 번째부터는 `k--`만” 하는 **상태 플래그** 풀이. in-place 복사는 맞지만 변수·분기가 많다.
- `feat: optimize 80` (`3b89438`): Q26 패턴 확장 — `nums[rIdx - 2] != nums[i]` 한 조건으로 중복 허용 여부를 판별하고, `k`·`num`·플래그를 제거해 **쓰기 인덱스만**으로 길이를 반환한다.

## [Key Insight]
- 정렬 배열에서 “최대 2개”는 **결과의 두 칸 앞 값**과만 비교하면 되고, 별도 중복 카운터가 필요 없다.
