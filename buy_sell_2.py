class Solution(object):
    def maxProfit(self, prices):
        profit = 0
        for i in range(1,len(prices)) : #it is necessary to buy to sell, so it starts from the second day
            if prices[i] > prices[i-1]:
                profit += (prices[i] - prices[i-1])
        return profit
       