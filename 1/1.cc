#include <iostream>
#include <vector>
using namespace std;

int moduleFuelWithoutFuel(int mass) {
  return mass / 3 - 2;
}

int moduleFuel(int mass) {
  int f = 0, m = mass;
  for (;;) {
    m = moduleFuelWithoutFuel(m);
    if (m <= 0) { break; }
    f += m;
  }
  return f;
}

int totalFuel(vector<int> modules, int(*moduleFuel)(int)) {
  int f = 0;
  for (int m: modules) { f += (*moduleFuel)(m); }
  return f;
}

vector<int> loadModules() {
  vector<int> modules;
  string line;
  while(getline(cin, line)) {
    modules.push_back(stoi(line));
  }
  return modules;
}

int main() {
  vector<int> modules = loadModules();
  cout << totalFuel(modules, moduleFuelWithoutFuel) << endl;
  cout << totalFuel(modules, moduleFuel) << endl;
}
