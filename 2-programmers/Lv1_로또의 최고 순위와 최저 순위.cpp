#include <iostream>
#include <algorithm>
#include <vector>

std::vector<int> solution(std::vector<int> lottos, std::vector<int> win_nums) {
    int highRank = 0, lowRank = 0;
    int rank[] = { 6, 6, 5, 4, 3, 2, 1 };
    std::vector<int> answer;

    for(int i=0; i<lottos.size(); i++) {
        if(lottos[i]==0) {
            highRank += 1;
            continue;
        }

        if(std::find(win_nums.begin(),win_nums.end(),
                                  lottos[i])!=win_nums.end()) {
            highRank += 1;
            lowRank += 1;
        }
    }

    answer.push_back(rank[highRank]);
    answer.push_back(rank[lowRank]);

    return answer;
}

int main(void)
{
    std::vector<int> lottos = { 1, 2, 3, 4, 0, 0 };
    std::vector<int> win_nums = { 1, 2, 3, 4, 5, 6 };
 
    std::vector<int> answer = solution(lottos, win_nums);
    for(auto it=answer.begin(); it!=answer.end(); it++) {
        std::cout << *it << ' ';
    }
    std::cout << '\n';

    return 0;
}
