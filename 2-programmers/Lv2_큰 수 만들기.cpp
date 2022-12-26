#include <iostream>
#include <string>
#include <stack>

std::string solution(std::string number, int k) {
    int len = number.length();
    std::string result = "";
    std::stack<char> stack;

    stack.push(number[0]);
    for(auto it=number.begin()+1; it!=number.end(); it++) {
        if(stack.top()<*it && k!=0) {
            while(stack.top() < *it) {
               k -= 1;
               stack.pop();
                if(stack.empty() || k==0) break;
            }  
        } 
        
        stack.push(*it);
    }

    if(k != 0) {
        for(int i=0; i<len-(len-k); i++) {
            stack.pop();
        }
    }

    while(!stack.empty()) {
        result = stack.top() + result;
        stack.pop();
    }

    return result;
}

int main(void)
{
    std::cout << solution("654321", 4) << '\n';
    return 0;
}
