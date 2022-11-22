#include <iostream>
#include <deque>

int main(void) {
    int n, p;
    std::deque<int> queue;

    std::cin >> n;
    while( true ) {
        std::cin >> p;
        if( p == -1 ){
            break;
        }

        if( p == 0 ) {
            queue.pop_front();
        } else {
            if( queue.size() < n && p != 0 ) {
                queue.push_back(p);
            }
        }
    }

    if( queue.empty() ) {
        std::cout << "empty";
    } else {
        for(auto it=queue.begin(); it!=queue.end(); ++it) {
            std::cout << *it << " ";
        }
    }
}
