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
    stack<int> p;
    cout << "ingresar numero: ";
    cin >> ax;

    ciclo: 
     cin >> bx;
     p.push(bx);     
     ax--;
    if(ax >= 1) goto ciclo;

    ini:
      bx = p.top();
      if(verificar(bx)) goto seguir;      
       v.push_back(bx);
       seguir:
       p.pop();
    if(!p.empty()) goto ini;

    cout << "Resultado: " << endl; 
    ax = v.size() - 1;
    mostrar: 
    cout << v[ax];
    ax--;
    if(ax >= 0) goto mostrar;

    return 0;
}