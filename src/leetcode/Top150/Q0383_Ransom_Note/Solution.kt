package leetcode.Top150.Q0383_Ransom_Note

class Solution {
    fun canConstruct(ransomNote: String, magazine: String): Boolean {
        val charMap = IntArray(26)
        for (mChar in magazine) {
            val idx = mChar - 'a'
            charMap[idx]++
        }

        for (rChar in ransomNote) {
            val idx = rChar - 'a'
            if (charMap[idx] == 0) return false
            charMap[idx]--
        }

        return true
    }
}
