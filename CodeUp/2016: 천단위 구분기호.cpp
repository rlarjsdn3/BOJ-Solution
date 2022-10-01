#include <iostream>
#include <stack>

int main(void)
{
    int n, count = 0; 
    std::string s, result = "";
    std::stack<char> stack;

    std::cin >> n >> s;

    for(int i=0; i<s.length(); i++)
        stack.push(s[i]);
    
    while(!stack.empty()) {
        if(count==3) {
            result = "," + result;
            count = 0;
        }
        result = stack.top() + result;
        stack.pop();
        count += 1;
    }

    std::cout << result << '\n';
    return 0;
}
