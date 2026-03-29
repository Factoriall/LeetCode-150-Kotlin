package leetcode.Top150.Q0058_Length_of_Last_Word

class Solution {
    fun lengthOfLastWord(s: String): Int {
        return getLength(s, getEndIndex(s))
    }

    private fun getEndIndex(s: String): Int {
        for(idx in s.length - 1 downTo 0) {
            val char = s[idx]
            if(char != ' ') return idx
        }

        return -1
    }

    private fun getLength(s: String, end: Int): Int {
        for(idx in end - 1 downTo 0) {
            val char = s[idx]
            if(char == ' ') return end - idx
        }
        return end + 1
    }
}
