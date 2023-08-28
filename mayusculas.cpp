#include <iostream>

using namespace std;

int main() {
    char c;   
    cin >> c;
    //cout << toupper(c);
    if(int(c) >= 65 && int(c) <= 90)
        cout << (char) tolower(c);
    if(int(c) >= 97 && int(c) <= 122)    
        cout << (char) toupper(c);
}