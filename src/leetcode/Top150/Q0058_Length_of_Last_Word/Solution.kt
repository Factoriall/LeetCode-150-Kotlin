package leetcode.Top150.Q0058_Length_of_Last_Word

class Solution {
    fun lengthOfLastWord(s: String): Int {
        var lastWordEndIdx = -1

        for(idx in s.length - 1 downTo 0) {
            val char = s[idx]
            if(char != ' ' && lastWordEndIdx == -1) {
                lastWordEndIdx = idx
            }
            if(char == ' ' && lastWordEndIdx != -1) {
                return lastWordEndIdx - idx
            }
        }

        return lastWordEndIdx + 1
    }
}
