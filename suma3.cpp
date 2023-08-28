#include <iostream>
using namespace std;

int main() {
    int n, r;    
    cin >> n;
    r = 0;
    n--;
    ini:
       if(n % 3 == 0) 
            r = r + n;
       n--;
    if(n >= 3) 
       goto ini;       
    cout << r;
}