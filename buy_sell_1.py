
class Solution(object):
    def maxProfit(self, prices):
        buy = 0 # buy first day 
        max_profit = 0 
        for sell in range (1,len(prices)): #sell second day 
            if prices[buy] < prices[sell]:
                profit = prices[sell]- prices[buy]
                max_profit = max(max_profit, profit)
            else :
                buy = sell 
        return max_profit