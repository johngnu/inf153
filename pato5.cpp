#include<iostream>
using namespace std;
int main ()
{
    int x, y, s, k, c;
    c = 0;
    cin >> x >> y;
    inicio:
    s = 0;
    cin >> k;
    suma:    
    s += k;
    if(cin >> k) goto suma;    
    cout << s;
    if(s != x) goto siguiente;
    c++;
    siguiente:
    if(cin >> x >> y) goto inicio;
    cout << c;
    return 0;
}