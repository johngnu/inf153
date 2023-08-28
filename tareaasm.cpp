#include<iostream>
#include<sstream>
using namespace std;
int main()
{   int dec, dah;
    stringstream ss, ssh, ssl; 

    cout << "Registro AX" << endl;
    cout << "Valor decimal: ";
    cin >> dec;
    ss << hex << dec;
    string shex = ss.str();
    //cout << shex;
    string x1 = shex.substr(0,2);
    string x2 = shex.substr(2,4);

    cout << "ah | al" << endl;
    cout << "-------" << endl;
    cout << x1 << " | " << x2 << endl; 

    cout << "Valor de ah: ";
    cin >> dec;
    ssh << hex << dec;
    x1 = ssh.str();
    if(dec != 0) goto ceroh;
    x1 = "00";    
    ceroh:

    cout << "ah | al" << endl;
    cout << "-------" << endl;
    cout << x1 << " | " << x2 << endl; 
    
    shex = x1 + x2;
    cout << "AX hex = " << shex << endl;
    dah = stoi(shex, nullptr, 16);
    cout << "AX dec = " << dah << endl;

    cout << "Valor de al: ";
    cin >> dec;
    ssl << hex << dec;
    x2 = ssl.str();
    if(dec != 0) goto cerol;
    x2 = "00";    
    cerol:

    cout << "ah | al" << endl;
    cout << "-------" << endl;
    cout << x1 << " | " << x2 << endl; 

    shex = x1 + x2;
    cout << "AX hex = " << shex << endl;
    dah = stoi(shex, nullptr, 16);
    cout << "AX dec = " << dah << endl;

    return 0;
}