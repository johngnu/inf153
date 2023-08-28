#include<iostream>
using namespace std;

int main()
{
    long long n, t, m, d;
    cin >> n;
    t = n;
    ciclo:
    d = t % 10;
    m = (m * 10) + d;
    t = t / 10;
    if(t > 0) goto ciclo;
    if(n == m) goto capicua;
    cout << "N"; 
    goto fin;     
    capicua:
    cout << "S";
    fin:
    return 0;
}