#include <iostream>
using namespace std;

int main() {
    int a, b, c;    
    cin >> a >> b >> c;
    if(a > b) 
        if(b > c)
            cout << a;
        else    
            if(a > c)
                cout << a;
            else
                cout << c;
    else        
        if(b > c)
            cout << b;            
        else 
            cout << c;    
}