package leetcode.Top150.Q0125_Valid_Palindrome

class Solution {
    fun isPalindrome(s: String): Boolean {
        var sIdx = 0
        var eIdx = s.length - 1
        while (sIdx < eIdx) {
            val start = s[sIdx]

            if (!isAlphanumeric(start)) {
                sIdx++
                continue
            }

            val end = s[eIdx]
            if (!isAlphanumeric(end)) {
                eIdx--
                continue
            }

            if (!isCharacterSame(start, end)) return false
            sIdx++
            eIdx--
        }

        return true
    }

    private fun isAlphanumeric(c: Char): Boolean {
        return ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z') || ('0' <= c && c <= '9')
    }

    private fun isCharacterSame(a: Char, b: Char): Boolean {
        return a.lowercaseChar() == b.lowercaseChar()
    }
}
