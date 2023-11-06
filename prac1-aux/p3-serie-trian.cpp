#include <iostream>
using namespace std;

int main() {
    int a, b, c;    
    cout << "Ingresar cuantos números: " << endl;
    cin >> a;
    
    c = 1;
    b = c;
    ciclo:
    cout << b << " ";    
    c++;
    b += c;
    if(c <= a) goto ciclo;
    cout << endl;

    return 0;
}
