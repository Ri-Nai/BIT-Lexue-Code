#include <bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cin >> n;
    vector<int> l, r;
    for (int i = 0; i < n; ++i)
    {
        int lx, rx;
        cin >> lx >> rx;
        l.push_back(lx);
        r.push_back(rx);
    }
    sort(l.begin(), l.end());
    sort(r.begin(), r.end());
    int ans = 0, now = 0;
    for (int i = 0, j = 0; i < n; )
    {
        if (l[i] < r[j])
        {
            ++now;
            ++i;
        }
        else
        {
            --now;
            ++j;
        }
        if (now > ans)
            ans = now;
    }
    cout << ans << endl;
}
