#include<iostream>
#include<cmath>
using namespace std;
int main()
{
    int t, n;
    cin >> t; // numero de casos
    ciclo:
    cin >> n;
    int x = int(cbrt(n)) + 2; // Utilizamos la función cbrt para la raíz cúbica 
    int a, b, c;
    a = 0;
    cicloa:
    b = 0;
    ciclob:
    c = 0;
    cicloc:
      int s = pow(a, 3) + pow(b, 3) + pow(c, 3);
      if(s == n) goto sepuede; // se puede
    c++; 
    if(c < x) goto cicloc;
    b++; 
    if(b < x) goto ciclob;
    a++; 
    if(a < x) goto cicloa;
    // no se puede
    cout << n << " no se puede expresar como la suma de 3 cubos" << endl; 
    goto fin;

    sepuede:
    cout << n << " se puede expresar como la suma de 3 cubos" << endl; 
    
    fin:
    t--;
    if(t > 0) goto ciclo;
    return 0;    
}