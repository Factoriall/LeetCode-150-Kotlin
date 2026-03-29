# Q0121. Best Time to Buy and Sell Stock

## 💡 Approach
- 가격 배열을 한 번 순회하며 **지금까지 본 최저가**(`minPrice`)를 갱신한다.
- 각 날짜에 **오늘 가격 − 최저가**로 이익을 계산하고, 그중 최댓값을 `maxProfit`에 유지한다.
- `minOf` / `maxOf`로 “저점 갱신 → 이익 갱신”을 분기 없이 같은 루프에서 처리한다.

## ⏳ Complexity
- Time: O(n)
- Space: O(1)

## [Solution Evolution]
- `feat: solve 121` (`69c2a06`): `maxProfit` 시그니처 없이 스캐폴딩만 두어 문제 폴더/클래스 골격을 잡았다.
- `feat: solve 121` (`bb33204`): `buyPrice`와 당일 가격을 비교하는 if/else로 저점·최대 이익을 갱신하는 한 패스 풀이로 완성했다.
- `feat: optimize 121` (`2f46dda`): 인덱스 루프 대신 전체를 순회하고, `minPrice`·`minOf`·`maxOf`로 동일 로직을 압축해 가독성과 분기 수를 줄였다(복잡도는 동일).

## [Key Insight]
- **과거 최저 매수가**만 기억하면, 매일 “그날에 팔면 얼마나 버는지”를 선형 시간에 끝낼 수 있다.
