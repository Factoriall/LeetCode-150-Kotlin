package leetcode.Top150.Q0383_Ransom_Note

class Solution {
    fun canConstruct(ransomNote: String, magazine: String): Boolean {
        val charMap = mutableMapOf<Char, Int>()
        for (mChar in magazine) {
            charMap[mChar] = charMap.getOrPut(mChar) { 0 } + 1
        }

        for (rChar in ransomNote) {
            if (charMap.getOrPut(rChar) { 0 } == 0) return false
            charMap[rChar] = charMap[rChar]!! - 1
        }

        return true
    }
}
