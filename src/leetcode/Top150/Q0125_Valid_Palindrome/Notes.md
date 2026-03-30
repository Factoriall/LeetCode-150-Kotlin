# Q0125. Valid Palindrome

## 💡 Approach
- 두 포인터(`sIdx`, `eIdx`)를 시작/끝에서 두고 `sIdx < eIdx` 동안 반복한다.
- 각 포인터에서 `isAlphanumeric()`(A-Z, a-z, 0-9)로 “영문/숫자”가 나올 때까지 이동해 비알파벳은 건너뛴다.
- 둘 다 유효한 문자가 되면 `lowercaseChar()`로 소문자화해 같으면 계속, 다르면 즉시 `false`를 반환한다.

## ⏳ Complexity
- Time: O(n) — 각 인덱스는 최대 한 번씩만 전진/후퇴.
- Space: O(1) — 인덱스와 문자 비교만 사용.

## [Solution Evolution]
- `feat: solve 125` (`1bc0e65`): 문제 폴더/클래스 골격(`isPalindrome` stub)부터 생성했다.
- `feat: solve 125` (`1fda67b`): 투포인터 + `isAlphanumeric()`/`isCharacterSame()`을 추가해 완전한 동작을 구현했다(대소문자 무시는 `lowercase()`로 처리).
- `feat: optimize 125` (`3b9912c`): `lowercase()` 대신 `lowercaseChar()`로 바꿔 비교 시 불필요한 문자열 생성 오버헤드를 줄였다.

## [Key Insight]
- “문자열을 정제해서 새로 만들지 않고”, 양끝에서 바로 건너뛰며 비교하면 `split`/`trim` 같은 추가 메모리 없이도 O(n)으로 끝낼 수 있다.
