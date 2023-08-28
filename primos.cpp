#include<iostream>

using namespace std;

int main() 
{   
    cout << "Primos en un rango:" << endl;
    int a, b;
    cin >> a >> b;
    int k = a;
    ciclo:
      int i = 2;
    ciclo2:
      bool primo = true;
    if(k%i == 0) goto noprimo;
    i++;
    if(i<k/2) goto ciclo2;
    cout << k << " ";
    goto finciclo;
    noprimo:
       primo=false;
    finciclo:
      k++;
    if (k<=b) goto ciclo;     

}