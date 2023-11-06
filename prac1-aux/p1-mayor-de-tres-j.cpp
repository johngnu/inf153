#include <iostream>
using namespace std;

int main() {
    int a, b, c, d;    
    cout << "Ingresar 3 numeros: " << endl;
    cin >> a >> b >> c;

    if(a > b) goto amb;
    if(b > c) goto bmc;
    cout << "El mayor es: " << c << endl;  
    goto fin;

    amb:
    if(a > c) goto amc;
    cout << "El mayor es: " << c << endl;  
    goto fin;

    bmc:
    cout << "El mayor es: " << b << endl;  
    goto fin;

    amc:
    cout << "El mayor es: " << a << endl;  

    fin:
    return 0;
}