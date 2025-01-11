#include <bits/stdc++.h>
#pragma GCC optimize(2)
#pragma GCC optimize("Ofast")
#pragma GCC optimize(3, "inline")
void solve(int n)
{
    using Point = std::pair<double, double>;
    using iterP = std::vector<Point>::iterator;
    std::vector<Point> points;
    for (int i = 0; i < n; ++i)
    {
        double x, y;
        std::cin >> x >> y;
        points.emplace_back(x, y);
    }
    std::sort(points.begin(), points.end());
    auto dis = [](Point a, Point b)
    {
        auto pow = [](double x, double y)
        { return x * x + y * y; };
        return pow(a.first - b.first, a.second - b.second);
    };
    std::function<double(iterP, iterP)> closest = [&](iterP l, iterP r) -> double
    {
        if (r - l == 1)
            return LONG_LONG_MAX;
        iterP mid = l + (r - l) / 2;
        double midX = mid->first;
        double d = std::min(closest(l, mid), closest(mid, r));
        double sqrtD = std::sqrt(d) + 2;
        std::inplace_merge(l, mid, r, [](Point a, Point b)
                           { return a.second < b.second; });
        std::vector<iterP> mids;
        for (iterP it = l; it != r; ++it)
            if (std::abs(it->first - midX) < sqrtD)
                mids.push_back(it);
        for (auto it = mids.begin(); it != mids.end(); ++it)
            for (auto jt = std::next(it); jt != mids.end() && (*jt)->second - (*it)->second < sqrtD; ++jt)
                d = std::min(d, dis(**it, **jt));
        return d;
    };
    std::cout << std::fixed << std::setprecision(2) << std::sqrt(closest(points.begin(), points.end())) / 2 << std::endl;
}
int main()
{
    std::cin.tie(nullptr)->sync_with_stdio(false);

    for (int n; std::cin >> n, n; solve(n))
        ;
}
