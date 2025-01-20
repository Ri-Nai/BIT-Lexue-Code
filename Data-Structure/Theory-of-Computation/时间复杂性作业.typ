#import "../template.typ": *

#show: apply_styles.with()
#header([时间复杂性作业])

= 7.9
== 题意
无向图中的三角形是一个3团。\
证明：$"TRIANGLE" in "P"$，其中 $"TRIANGLE" = \{angle.l G angle.r | G "是一个无向图，包含一个三角形"\}$。\

== 证明
我们可以枚举三角形的三个点，然后判断这三个点是否构成一个三角形。\
这样的话，我们需要枚举的点的个数是$O(n^3)$，然后判断是否构成三角形的时间复杂度是$O(1)$，所以总的时间复杂度是$O(n^3)$。

构造如下高水平描述的图灵机 $upright(H) = $“\
对于输入 $angle.l G angle.r$，$G$是一个无向图\
1. 设 $G$ 有 $n$ 个顶点 $u_1, u_2, dots, u_n$。
2. 若 $n < 3$，则拒绝。
3. 对 $i$ 从 $1$ 到 $n$：
4. #h(2em)对 $j$ 从 $i + 1$ 到 $n$：
5. #h(4em)对 $k$ 从 $j + 1$ 到 $n$：
6. #h(6em)若 $u_i$ 和 $u_j$ 和 $u_k$ 之间有边，则接受。
7. 拒绝。”

我们可以看到，这个图灵机的时间复杂度是$O(n^3)$，所以$"TRIANGLE" in "P"$。

= 7.11
== 题意
若图 $G$ 的节点重新排序后，$G$ 可以变得与 $H$ 完全相同，则称 $G$ 与 $H$ 是同构的。\
令 $"ISO" = {angle.l G,H angle.r | G 和 H "是同构的图"}$。\
证明：$"ISO" in italic("NP")$。

== 证明
构造如下高水平描述的非确定性图灵机 $upright(N) = $“\
对于输入 $angle.l G,H angle.r$，$G$ 和 $H$ 是两个无向图\
1. 设 $G$ 有 $n$ 个顶点 $u_1, u_2, dots, u_n$，$H$ 有 $m$ 个顶点 $v_1, v_2, dots, v_m$。
2. 若 $n != m$，则拒绝。
3. 非确定性地选择一个 $n$ 的排列 $p_i$。
4. 对 $i$ 从 $1$ 到 $n$：
5. #h(2em)对 $j$ 从 $1$ 到 $n$：
6. #pad(x:4em)[若 $u_i$ 和 $u_j$ 之间有边且 $v_(p_i)$ 和 $v_(p_j)$ 之间无边， \ 或 $u_i$ 和 $u_j$ 之间无边且 $v_(p_i)$ 和 $v_(p_j)$ 之间有边，则拒绝。]
7. 接受。”
若$G$, $H$同构,则 $upright(N)$ 一定有分支接受； 否则，N所有分支拒绝。\
以上图灵机可以在 $O(n^2)$ 的时间内判定问题，故 $"ISO" in italic("NP")$。

= 7.21
== 题意
令$"Double-SAT" = { angle.l phi angle.r | phi"至少有两个满足赋值" }$。\
证明：$"Double-SAT"$ 是 $italic("NP")$ 完全的。

== 证明
=== 1. Double-SAT 属于 $italic("NP")$
#set enum(numbering: "(1)")
#set list(marker: ([#sym.circle.filled.tiny], [#sym.circle.stroked.tiny]))
构造如下高水平描述的非确定性图灵机 $upright(N) = $“\
对于输入 $angle.l phi angle.r$，$phi$ 是布尔公式\
1. 非确定性地产生两组不同赋值 $s, t$。
2. 若在赋值 $s$ 下 $phi = 1$ 且在赋值 $t$ 下 $phi = 1$，则接受；否则，拒绝。”
因为 $upright(N)$ 的语言是 Double-SAT，且 $N$ 在多项式时间内运行，所以 Double-SAT 属于 $italic("NP")$。

=== 2. 证明 SAT 可以多项式时间映射归约到 Double-SAT
对任意布尔公式 $phi$，添加一个新变量 $a$，构造函数 $f(phi) = phi and (a or not a)$。\
首先，$f$ 可在多项式时间内计算完成。\
其次，$f$ 是 SAT 到 Double-SAT 的映射归约，即 $phi "可满足" arrow.l.r.double f(phi)$ 有两个满足赋值：\
- 若 $phi$ 有可满足赋值 $s$，则：\
    - 在赋值 $s$ 和 $a = 1$ 下 $f(phi) = 1$，\
    - 在赋值 $s$ 和 $a = 0$ 下 $f(phi) = 1$，\
从而有两个不同的赋值；\

若 $f(phi)$ 有可满足赋值 $s$，则从 $s$ 中去掉 $a$ 的赋值，必然也是 $phi$ 的可满足赋值。\
所以 $f$ 是从 SAT 到 Double-SAT 的多项式时间映射归约。

由 1. 和 2. 及 SAT 是 $italic("NP")$ 完全问题知，Double-SAT 是 $italic("NP")$ 完全问题。

= 7.22
== 题意
令 $"HALF-CLIQUE"$ = ${ angle.l G angle.r mid(|) G #[是无向图, 包含结点数至少为 $m/2$ 的完全子图，$m$ 是 $G$ 的结点数]}$。

证明： $#[HALF-CLIQUE]$ 是 $italic(#[NP])$ 完全的.
== 证明
=== 1. $#[HALF-CLIQUE]$ 属于 $italic(#[NP])$
构造如下高水平描述的非确定性图灵机 $upright(N) = $“\
对于输入 $angle.l G angle.r$，$G$ 是一个无向图，有 $m$ 个顶点\
1. 非确定性地产生一个 $m/2$ 个顶点的子集。
2. 若这个子集中的任意两个顶点之间都有边相连，则接受；否则，拒绝。”
因为 $upright(N)$ 的语言是 HALF-CLIQUE，且 $upright(N)$ 在多项式时间内运行，所以 HALF-CLIQUE 属于 $italic("NP")$。

=== 2. 证明 CLIQUE 可以多项式时间映射归约到 HALF-CLIQUE
对任意 $angle.l G,k angle.r$，其中 $G$ 是一个无向图，$k$ 是一个正整数。\
构造函数 $f(angle.l G,k angle.r) = G'$。\
设 $G$ 有 $m$ 个顶点。按如下方式构造 $G'$：\
- 若 $k = m/2$，则 $G = G'$；\
- 若 $k > m/2$，则在 $G$ 中增加 $2k - m$ 个新顶点，这些新顶点都是孤立点，得到 $G'$；\
- 若 $k < m/2$，则增加 $m - 2k$ 个新顶点，这些新顶点之间两两都有边相连，新顶点与 $G$ 的所有顶点之间也都相连。\
首先，$f$ 可在多项式时间内计算完成。\
其次，证明 $f$ 是 CLIQUE 到 HALF-CLIQUE 的映射归约，\
即证明 $G$ 有 $k$ 团 $arrow.l.r.double G'$（设有 $m'$ 个顶点）有 $m'/2$ 个顶点的团：\
- 若 $G$ 有 $k$ 团：
  - 当 $k = m/2$ 时，$G' = G$，$m' = m$，则 $G'$ 也有 $k = m/2$ 团；\
  - 当 $k > m/2$ 时，$m' = 2k$，$G'$ 中也有 $k = m/2$ 团；\
  - 当 $k < m/2$ 时，$m' = 2m - 2k$，$G$ 中的 $k$ 团加上新添的 $m - 2k$ 个顶点形成 $m - k = m/2$ 团。\
- 若 $G'$ 有 $m/2$ 团：
  - 当 $k = m/2$ 时，$G' = G$，$m' = m$，则 $G$ 也有 $k = m/2$ 团；\
  - 当 $k > m/2$ 时，$m' = 2k$，$G$ 中也有 $k = m/2$ 团；\
  - 当 $k < m/2$ 时，$m' = 2m - 2k$，$G'$ 中的 $m - k$ 团至多有 $m - 2k$ 个新添顶点，去掉新添顶点至少还有 $k$ 个顶点，所以 $G$ 中有 $k$ 团。

由 1. ，2. 和 CLIQUE 是 $italic("NP")$ 完全问题知，HALF-CLIQUE 是 $italic("NP")$ 完全问题。
