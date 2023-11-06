#include <iostream>
using namespace std;

int busquedaLineal(int arr[], int n, int objetivo) {    
    int i = 0;
    ciclo:
     if (arr[i] == objetivo) goto esverdad;
     i++; 
    if(i < n) goto ciclo;
    return -1;

    esverdad:
    return i;
}

int main() {
    int arreglo[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(arreglo) / sizeof(arreglo[0]);
    int objetivo = 22;

    int resultado = busquedaLineal(arreglo, n, objetivo);
    
    if (resultado != -1) goto esverdad;            
    cout << "El elemento " << objetivo << " no se encuentra en el arreglo." << endl;
    goto fin;

    esverdad:
    cout << "El elemento " << objetivo << " se encuentra en la posición " << resultado << endl;

    fin:
    return 0;
}