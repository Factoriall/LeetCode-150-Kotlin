# Q0013. Roman to Integer

## 💡 Approach
- 문자열을 오른쪽에서 왼쪽으로 순회하면서 현재 로마 숫자 값을 계산한다.
- 직전(오른쪽) 값보다 현재 값이 작으면 감산, 크거나 같으면 가산한다.
- `Char.romanToInt()` 확장 함수로 문자-숫자 매핑을 상수 시간에 처리한다.

## ⏳ Complexity
- Time: O(n)
- Space: O(1)
