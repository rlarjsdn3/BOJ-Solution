#include <iostream>
#include <sstream>
#include <string> 
#include <vector>

std::vector<std::string> split(std::string str, char delimeter) {
    std::string buff;
    std::vector<std::string> tmp;
    std::istringstream iss(str);

    while(std::getline(iss, buff, delimeter)) {
        if(buff!="") tmp.push_back(buff);
    }
    
    return tmp;
}

int main(void) {
    std::vector<std::string> vector;
    std::getline(std::cin, str);
    vector = split(str, ' ');
    std::cout << vector.size() << std::endl;

    return 0;
}
