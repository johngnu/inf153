#include<iostream>
#include<string>
#include<stack>
#include<vector>

using namespace std;

vector<int> v;
bool verificar(int n) {
    int x = 0;
    if(v.empty()) goto noexiste;
    ini: 
    if(v[x] == n) goto existe;
    x++;
    if(x < v.size()) goto ini;
    noexiste:
    return false;
    existe:
    return true;
}

int main()
{   
    int ax, bx, cx, dx;
    cout << "ingresar numero: ";
    cin >> ax;
    ini:
      cin >> bx;
      if(verificar(bx)) goto seguir;      
       v.push_back(bx);
       seguir:
       ax--;
    if(ax >= 1) goto ini;

    cout << "Resultado: " << endl; 
    ax = 0;
    mostrar: 
    cout << v[ax];
    ax++;
    if(ax < v.size()) goto mostrar;

    return 0;
}