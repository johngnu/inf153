#include <iostream>
#include <vector>
using namespace std;

vector<int> tribonacci(int n) {
    vector<int> vec(n);
    
    vec[0] = 0;    
    vec[1] = 1;    
    vec[2] = 1;
    
    int i = 3;
    ciclo:
     vec[i] = vec[i - 1] + vec[i - 2] + vec[i - 3];
     i++; 
    if(i < n) goto ciclo;

    return vec;
}

int main() {
    int n, i;
    cout << "Ingrese la cantidad de números Tribonacci: ";
    cin >> n;

    vector<int> v = tribonacci(n);

    i = 0;
    ciclo:
     cout << v[i] << " ";
     i++; 
    if(i < n) goto ciclo;

    cout << std::endl;
    return 0;
}
