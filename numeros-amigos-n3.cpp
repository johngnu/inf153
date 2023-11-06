#include<iostream>

using namespace std;

int sumadiv(int a) {
    int b, s = 0;
    b = 1;
    ini:
    if(a%b != 0) goto seguir;
    s += b;
    cout << b << " ";
    seguir:
    b++;
    if(b <= (a/2)) goto ini;  
    cout << endl;
    return s;
}

int main() {
    int ax, bx;
    cin >> ax >> bx;
    
    cout << " suma: " << sumadiv(ax) << endl;
    cout << " suma: " << sumadiv(bx) << endl;

    return 0;
}