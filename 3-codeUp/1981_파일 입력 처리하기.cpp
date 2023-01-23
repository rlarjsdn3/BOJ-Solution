#include <iostream>

using namespace std; 

int main(void)
{
    FILE *fi = fopen("secret.dic", "r");
    char buffer[100];
    while(fgets(buffer, 100, fi) != NULL) {
        fputs(buffer, stdout);
    }

    fclose(fi);
}
