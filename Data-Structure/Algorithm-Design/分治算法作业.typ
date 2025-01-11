#import "template.typ": *

#show: apply_styles.with()
#header([分治算法作业])

= 2.8
== 题意
设n个不同的整数排好序后存于 $T[1:n]$ 中\
若存在一个下标 $i$，$1<=i<=n$ 使得 $T[i] = i$
设计一个有效算法找到这个下标. 要求算法在最坏情况下的计算时间$O(log n)$

== 解法
由于是互不相同的整数，且只存在一个下标使得 $T[i] = i$，我们设这个下标为 $t$ \

互不相同 ：
$ forall i >= 1, T[i] - T[i - 1] >= 1 $
故有
$ forall i > t, T[i] - i >= (T[t] + i - t) - i >= T[t] - t >= 0 $
$ forall i < t, T[i] - i <= (T[t] - i) - i <= T[t] - t <= 0 $
而序列中只有一个数 $t$ 使得 $T[t] - t = 0$，且满足 $t$ 的左侧均小于0，右侧均大于0 采用二分答案解决，时间复杂度为$O(log n)$

== 伪代码
```c
int findIndex(int n, int T[])
{
    int l = 1, r = n;
    while (l <= r)
    {
        int mid = (l + r) / 2;
        if (T[mid] == mid)
            return mid;
        else if (T[mid] > mid)
            r = mid - 1;
        else
            l = mid + 1;
    }
    return -1;
}
```
= 2.9
== 题意
设 $T[0:n-1]$ 是 $n$ 个元素的数组. 对任一元素 $x$, 设 $S(x)={i | T[i]=x}$.当$|S(x)| > n/2$时, 称$x$为主元素. 设计一个线性时间算法, 确定$T[0:n-1]$是否有一个主元素

== 解法
主元素出现的个数比其他的所有元素都要多\
首先假定当前元素是主元素，遍历数组，按照是否和当前元素相同来更新计数器，不合法的时候就更换主元素，最后筛下来的一定是主元素

时间复杂度为$O(n)$，额外空间复杂度为$O(1)$

== 伪代码
```cpp
int findMode(int T[], int n)
{
    int count = 0;
    int answer = -1;
    for (int i = 0; i < n; ++i)
    {
        if (answer == T[i])
            ++count;
        else
            --count;
        if (count <= 0)
        {
            answer = T[i];
            count = 1;
        }
    }
    return answer;
}
```
= 2.25
== 题意
在线性时间选择算法中，输入元素被划分为5个一组，如果将它们划分为7个一组, 该算法仍然是线性时间算法吗？划分成3个一组又怎样？
== 答

+ * 7 个一组*

  设 $T(n) = a n$
  $
    T(n) &<= T(n / 7) + T((5n) / 7) + c n \
    &<= 6 / 7 a n + c n \
    & = a n
  $
  仍为线性复杂度\
  不考虑 7 个一组的原因是在组内插入排序时常数因子比较大，得不偿失

+ * 3 个一组*

  设 $T(n) = a n$
  $
    T(n) &<= T(n / 3) + T((2n) / 3) + c n \
    &<= a n + c n \
    &!= a n
  $
  无法自证为线性复杂度
