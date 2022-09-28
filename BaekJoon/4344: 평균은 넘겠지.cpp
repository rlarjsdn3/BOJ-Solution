#include <iostream>
#include <vector>

int main(void) {
    int n, m, v;
    int sum, cnt; 
    double average;

    std::vector<int> score;
    std::vector<double> result;

    std::cin >> n;
    for(int i=0, sum=0, cnt=0; i<n; i++) {
        std::cin >> m;
        for(int j=0; j<m; j++) {
            std::cin >> v;
            score.push_back(v);
            sum += v;
        }

        average = sum / (double)m;
        for(int k=0; k<score.size(); k++)
            if(average<score[k]) cnt++;

        result.push_back((cnt/(double)m)*100.0);

        sum = 0;
        cnt = 0;
        score.clear();
    }

    for(auto it=result.begin(); it!=result.end(); it++) {
        printf("%0.3lf%%\n", *it);
    }

    return 0;
}
