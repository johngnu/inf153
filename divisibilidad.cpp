#include <iostream>
using namespace std;

int main() {
    int a, b, r;    
    inicio:
        cin >> a >> b;
        r = 0;
        if(a % b == 0)
        {   
            cout << a << " es divisible por " << b << endl;
            goto inicio;
        }    
        if(b % a == 0)
        {   
            cout << b << " es divisible por " << a << endl;
            goto inicio;
        }
        if(r == 0)
        {   
            cout << "-1" << endl;   
            goto inicio;
        }

}   