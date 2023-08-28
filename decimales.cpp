#include<iostream>

using namespace std;
int main()
{   
    int ax, bx, cx, dx;
    cout << "ingresa un numero: ";
    cin >> dx;
    cx = 66;
    bx = 10;
    ini:
    if(bx < dx) goto menor;
    cout << (bx / dx) << " ";
    bx = bx % dx;
    bx = bx * 10;
    goto fin; 
    menor:
    cout << "0 ";
    bx = bx * 10;

    fin:

    cx--;
    if(cx >= 1) goto ini;

    return 0;
}