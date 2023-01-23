#include <iostream>
#include <algorithm>
#include <vector>
#include <set>
#include <cmath>

int main(void)
{
    int n[2];
    std::set<int> set;
    std::vector<int> vector;

    std::cin >> n[0] >> n[1];
    
    for(int i=0; i<2; i++) {
        // 효율적으로 약수를 구하는 알고리즘
        for(int j=1; j<=sqrt(n[i]); j++) {
            if(n[i]%j==0) {
                set.insert(j);

                if(n[i]/j!=j) set.insert(n[i]/j); 
            }
        }
    }

    for(std::set<int>::iterator it=set.begin(); it!=set.end(); it++)
        vector.push_back(*it); 
    std::sort(vector.begin(), vector.end());

    for(std::vector<int>::iterator it=vector.begin(); it!=vector.end(); it++) 
        std::cout << *it << ' ';
    std::cout << '\n';

    return 0;
}

// C++의 집합(set) 자료형은 내부적으로 이진트리로 구현되어 있으며, (insert 함수로 삽입 시) 기본적으로 ‘오름차순’으로 정렬되어 있습니다.
// 따라서, vector로 따로 ‘정렬’을 할 필요가 없습니다.
