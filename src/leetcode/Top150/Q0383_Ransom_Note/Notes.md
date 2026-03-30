# Q0383. Ransom Note

## 💡 Approach
- `IntArray(26)`에 `magazine` 각 문자의 빈도를 누적한다.
- `ransomNote`를 순회하며 해당 인덱스 카운트가 0이면 즉시 `false`를 반환한다.
- 사용 가능하면 카운트를 1 감소시키고 끝까지 통과하면 `true`를 반환한다.

## ⏳ Complexity
- Time: O(m + n) — `magazine` 1회 + `ransomNote` 1회 순회.
- Space: O(1) — 길이 26의 고정 배열만 사용.

## [Solution Evolution]
- `feat: solve 383` (`88d1da3`): `mutableMapOf<Char, Int>`로 문자 빈도 기반 기본 풀이를 완성했다.
- `feat: optimize 383` (`0ef221c`): `Map`을 `IntArray(26)`로 교체해 해시 조회/박싱 오버헤드를 줄이고 상수 시간 성능을 개선했다.

## [Key Insight]
- “소문자 26개”라는 제약을 직접 자료구조(`IntArray`)에 반영하면, 같은 O(n)이라도 실행 시간이 눈에 띄게 줄어든다.
