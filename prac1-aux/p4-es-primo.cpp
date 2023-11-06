#include <iostream>
using namespace std;

int main() {
   int a, b, k, i; 
   cout << "Ingresa un numero: ";
   cin >> a;

   k = a;
   i = 2;
   ciclo:
   if (k % i == 0) goto noprimo;
   i++;
   if(i < k/2) goto ciclo;
   cout << k << " es primo!" << endl;  
   goto fin;

   noprimo:
   cout << k << " no es primo!" << endl;
   
   fin:
   return 0;
}