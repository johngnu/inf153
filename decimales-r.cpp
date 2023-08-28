#include<iostream>
#include<string>

using namespace std;
int main()
{   
    int bx, cx, dx;
    string ax;
    cout << "ingresa un numero: ";
    cin >> dx;
    cx = 66;
    bx = 10;
    ini:
    if(bx < dx) goto menor;
    ax += to_string(bx / dx);
    bx = bx % dx;
    bx = bx * 10;
    goto fin; 

    menor:
    ax +=  "X";
    bx = bx * 10;

    fin:

    cx--;
    if(cx >= 1) goto ini;

    cout << ax << endl;
    cout << ax[0];

    return 0;
}