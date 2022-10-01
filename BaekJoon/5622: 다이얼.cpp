#include <iostream>
#include <string>

#define ARR_SIZE 9
#define BASIC_TIME_TAKEN 2

int main(void)
{
    std::string dial[ARR_SIZE] = { "", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ" };
    int result = 0;
    std::string data;
    
    std::cin >> data;
    for(int i=0; i<data.length(); i++) {
        for(int j=1; j<ARR_SIZE; j++) {
            if(dial[j].find(data[i]) != std::string::npos) {
                result += (BASIC_TIME_TAKEN+j);
                break;   
            }
        }
    }

    std::cout << result << '\n';
    return 0;
}
