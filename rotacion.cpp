#include <iostream>
#include <string>

using namespace std;

int toBinaryInt(int n) {
    if (n / 2 != 0) {
        toBinaryInt(n / 2);
    }
    return n % 2;
}

string toBinary(int n) {
    if (n==0) return "0";
    else if (n==1) return "1";
    else if (n%2 == 0) return toBinary(n/2) + "0";
    else if (n%2 != 0) return toBinary(n/2) + "1";
}

int rotar(string s) {
    int i = 0, r = 0;
    int l = s.length();
    ini: 
        if(s[i] == '1')
            r--;
        else
            r++;
    i++;            
    if(i < l)
        goto ini;   
    return r;      
}

int main() {
    int n, x;   
    cin >> n;
    ini:
       cin >> x;
       string bin = toBinary(x);
       cout << bin;
       cout << rotar(bin);
    n--;
    if(n >= 1)
        goto ini; 
}