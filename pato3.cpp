#include<iostream>
#include<sstream>
#include<string> 
#include<sstream>
#include<vector>

using namespace std;
int main() 
{
    vector<string> v;
    string s;
    getline(cin, s);
    //cout << endl;
    //cout << s << endl;
    istringstream iss(s);   //or use stringstream
    string word;
    iss>>word;
    /*while(iss>>word){
        cout<<word<<endl;
    }*/
    ciclo:
      //cout << word << endl;
      v.push_back(word);
    if(iss>>word) goto ciclo;
    int i = v.size() - 1;
    cout << endl;
    
    istringstream iss2(s);
    iss2>>word;
    
    ciclo2:
      //cout << v[i] << " " << word.compare(v[i]) << " " << (word == v[i]) << endl;  
      if(word.compare(v[i]) != 0) goto nopal; 
      i--;
      iss2>>word;
    if(i >= 0) goto ciclo2;   
    cout << "SI";
    goto fin; 
    //cout << endl << s; 

    nopal:
    cout << "NO"; 

    fin:
    return 0;
}
