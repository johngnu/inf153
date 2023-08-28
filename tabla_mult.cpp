#include <iostream>

using namespace std;
int main() {
    int x, y, a;    
    cin >> x >> y;
    a = x;
    bucle:
    cout << x << " "; 
    x = x + a;
    y--;
    if(y >= 1)
        goto bucle;
}