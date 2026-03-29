package leetcode.Top150.Q0121_Best_Time_to_Buy_and_Sell_Stock

class Solution {
    /**
     * 1. 첫 데이터 buyPrice 저장
     * 2. 오른쪽 이동하면서 buyPrice와 비교 
     * ㄴ 크다면: result 기존 저장값과 비교해서 maxProfit 갱신 
     * ㄴ 작다면: buyPrice 갱신
     * 3. 순회 후 maxProfit 반환
     */
    fun maxProfit(prices: IntArray): Int {
        var maxProfit = 0
        var buyPrice = prices[0]

        for (idx in 1 until prices.size) {
            if(buyPrice <= prices[idx]) {
                val profit = prices[idx] - buyPrice
                maxProfit = maxOf(maxProfit, profit)
            } else {
                buyPrice = prices[idx]
            }
        }

        return maxProfit
    }
}
