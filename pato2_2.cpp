#include<iostream>
using namespace std;

int main()
{
    string a, b;
    cin >> a;
    int n = a.length() - 1;
    int i = n;
    ciclo:
    b += a[i];
    if(a[i] != a[n-i]) goto nocapicua;
    i--;     
    if(i>=0) goto ciclo;

    capicua:
    cout << "S";
    goto fin;     

    nocapicua:
    cout << "N"; 
    
    fin:
    return 0;
}