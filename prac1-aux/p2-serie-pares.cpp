#include <iostream>
using namespace std;

int main() {
    int a, b;    
    cout << "Ingresar cuantos números: " << endl;
    cin >> a;

    b = 2;
    ciclo:
    cout << b << " ";
    b += 2;
    a--;
    if(a >= 1) goto ciclo;
    cout << endl;

    return 0;
}