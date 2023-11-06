#include <iostream>
using namespace std;

int main() {
    int a, b, c, d;    
    cin >> a >> b >> c;

    if(a > b) goto amb;
    d = b; 
    goto c1;
    amb:
    d = a;

    c1:
    if(c > d) goto cmd;
    cout << "El mayor es: " << d << endl;   
    goto c2;
    cmd:
    cout << "El mayor es: " << c << endl;   
    
    c2:
    return 0;
}