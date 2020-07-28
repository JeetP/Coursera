#include <iostream>
#include <vector>
#include <algorithm>

long long MaxPairwiseProduct(const std::vector<int>& numbers) {

    int n = numbers.size();

    int index = -1;
    for(int i = 0; i<n; i++){
        if((index == -1) || (numbers[i] > numbers[index])){
            index = i;
        }
    }
    int index2 = -1;
    for(int i = 0;i<n;++i){
        if((i != index) && ((index2 == -1) || (numbers[i] > numbers[index2]))){
            index2 = i;
        }
    }
    //long long ans = numbers[index] * numbers[index2];
    //return ans;
    return (long long) numbers[index] * (numbers[index2]);
}

int main() {
    int n;
    std::cin >> n;
    std::vector<int> numbers(n);
    for (int i = 0; i < n; ++i) {
        std::cin >> numbers[i];
    }
    std::cout << MaxPairwiseProduct(numbers) << "\n";
    return 0;
}
