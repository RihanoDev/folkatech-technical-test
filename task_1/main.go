package main

import (
	"fmt"
)

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func MaxProfit(prices []int, i int) int {
	profit := make([]int, i)
	max_price := prices[i-1]
	min_price := prices[0]
	
	for j := i - 2; j >= 0; j-- {
		if prices[j] > max_price {
			max_price = prices[j]
		}
		profit[j] = max(profit[j + 1], max_price - prices[j])
	} 
	
	for j := 1; j < i; j++ {
		if prices[j] < min_price {
			min_price = prices[j]
		}
		profit[j] = max(profit[j-1], profit[j] + (prices[j] - min_price))
	}

	result := profit[i-1]

	return result
}

func main(){
	prices := []int{4, 11, 2, 20, 59, 80}
	i := len(prices)
	fmt.Println(MaxProfit(prices, i))
}