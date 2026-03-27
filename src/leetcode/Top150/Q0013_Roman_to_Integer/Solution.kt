package leetcode.Top150.Q0013_Roman_to_Integer

class Solution {
    fun romanToInt(s: String): Int {

        var result = 0

        var prevChar: Char = EMPTY_CHAR
        for (i in s.length - 1 downTo 0) {
            val char = s[i]
            val int = char.romanToInt()
            val prevInt = prevChar.romanToInt()

            if (int >= prevInt) result += int else result -= int
            prevChar = char
        }

        return result
    }

    private fun Char.romanToInt() : Int {
        return when(this) {
                        'I' -> 1
                        'V' -> 5
                        'X' -> 10
                        'L' -> 50
                        'C' -> 100
                        'D' -> 500
                        'M' -> 1000
                        else -> 0

        }
    }

    companion object {
        const val EMPTY_CHAR = ' '
    }
}
