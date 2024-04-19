package main

import (
	"fmt"
)

func ShiftArray(array []int, i int) []int {
	length := len(array)
	tmp := make([]int, length)

	for j := range array {
		tmp[(j+i)%length] = array[j]
	}
	for j := range array {
		array[j] = tmp[j]
	}
	
	return array
}

func main() {
	array := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}
	i := 1
	result := ShiftArray(array, i)
	fmt.Println(result)
}
