#include <bits/stdc++.h>

int main()
{
    std::cin.tie(nullptr)->sync_with_stdio(false);
    auto inputArray = []()
    {
        std::vector<int> result;
        char dot;
        for (int x, y; std::cin >> x >> dot >> y;)
            result.push_back(y);
        return result;
    };
    auto Y = inputArray();
    srand(time(nullptr));
    std::function<int(int, int, int)> findKth = [&](int start, int end, int offset) -> int
    {
        if (start == end - 1)
            return Y[start];
        int pivot = Y[rand() % (end - start) + start];
        int left = start, right = end - 1;
        while (left <= right)
        {
            while (left <= right && Y[left] < pivot)
                ++left;
            while (left <= right && Y[right] > pivot)
                --right;
            if (left <= right)
            {
                std::swap(Y[left], Y[right]);
                ++left;
                --right;
            }
        }
        if (left - start >= offset)
            return findKth(start, left, offset);
        else
            return findKth(left, end, offset - (left - start));
    };
    std::cout << findKth(0, Y.size(), (Y.size() + 1) / 2) << std::endl;
}
