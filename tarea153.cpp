#include<iostream>
#include<sstream>
#include<string>

using namespace std;
int main()
{   int dec, dah;
    stringstream ss, ssh, ssl; 
    string shex, sah, sal;
    // ====================================== lectura
    cout << "Registro AX" << endl;
    cout << "Valor decimal: ";
    cin >> dec;
    ss << hex << dec;    
    shex = ss.str();
    sah = shex.substr(0,2);
    sal = shex.substr(2,4);

    // ====================================== proceso
    cout << "ah | al" << endl;
    cout << "-------" << endl;
    cout << sah << " | " << sal << endl; 

    cout << "Valor de ah: ";
    cin >> dec;
    ssh << hex << dec;
    sah = ssh.str();
    if(dec != 0) goto ceroh;
    sah = "00";    
    ceroh:

    cout << "ah | al" << endl;
    cout << "-------" << endl;
    cout << sah << " | " << sal << endl; 
    
    shex = sah + sal;
    cout << "AX hex = " << shex << endl;
    dah = stoi(shex, nullptr, 16);
    cout << "AX dec = " << dah << endl;

    cout << "Valor de al: ";
    cin >> dec;
    ssl << hex << dec;
    sal = ssl.str();
    if(dec != 0) goto cerol;
    sal = "00";    
    cerol:

    cout << "ah | al" << endl;
    cout << "-------" << endl;
    cout << sah << " | " << sal << endl; 

    shex = sah + sal;
    cout << "AX hex = " << shex << endl;
    dah = stoi(shex, nullptr, 16);
    cout << "AX dec = " << dah << endl;

    return 0;
}