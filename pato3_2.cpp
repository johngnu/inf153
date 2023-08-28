#include<iostream>
#include<sstream>
#include<vector>

using namespace std;
int main() 
{
    string n;
    getline(cin, n);
    
    vector<string> v;
    string s;
    getline(cin, s);

    istringstream iss(s);   
    string w;
    iss >> w;

    ciclo:
    v.push_back(w);
    if(iss >> w) goto ciclo;
    int i = v.size() - 1;

    istringstream iss2(s);
    iss2 >> w;
    
    ciclo2:
    if(w.compare(v[i]) != 0) goto nop; 
    i--;
    iss2 >> w;
    if(i >= 0) goto ciclo2;   
    cout << "SI";
    goto fin; 

    nop:
    cout << "NO"; 

    fin:
    return 0;
}
