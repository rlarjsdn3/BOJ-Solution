#include <iostream>
#include <string>
#include <cctype>

#define SIZE 10

int solution(std::string s) {
    std::string numbers[SIZE] = { "zero", "one", "two", "three", "four",
                                  "five", "six", "seven", "eight", "nine" };
    std::string temp, result;

    for(auto it=s.begin(); it!=s.end(); it++) {
        if(isdigit(*it)) {
            result += *it;
        } else {
            temp += *it;

            if(temp.size()>2) {
                for(int i=0; i<SIZE; i++) {
                    if(temp==numbers[i]) {
                        result += std::to_string(i);
                        temp = "";
                    }
                }
            }
        }
    }

    return std::stoi(result);
}

int main(void)
{
    std::string str; 
    std::cin >> str;
    std::cout << solution(str) << '\n';
    return 0;
}
