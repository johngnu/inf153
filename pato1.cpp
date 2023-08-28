#include <iostream>
using namespace std;

int main() 
{   int x, y, tem;
    // entrada de x y y
    cin >> x >> y;
    if(y > x) goto ciclo;
    tem = x;
	x = y;
	y = tem;

	ciclo:
	cout << y << endl;
    y--;
	if(y >= x) goto ciclo;
	return 0;
}