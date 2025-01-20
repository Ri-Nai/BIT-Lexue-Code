#import "../template.typ": *

#show: apply_styles.with()
#header([图灵机作业])

= 3.2
对于识别${w|w=u\#u, u in {0,1}^*}$的图灵机 $M$ (见下图), 在下列输入串上, 给出 $M$ 所进入的格局序列.

补充说明: 没有画出的箭头指向拒绝状态（本人认为转移函数的结果是向右移动）。

#figure(
  image("imgs/图灵机3-1.png"),
  caption: "图3.1",
)

== c. 1\#\#1
$
  q_1 1 \# \# 1 arrow.r^(1 arrow.r x, R)
  x q_3 \# \# 1 arrow.r^(\# arrow.r R)
  x \# q_5 \# 1 arrow.r^\# x \# \# q_#text(red)[reject] 1
$

== d. 10\#11

$
  q_1 1 0 \# 1 1 arrow.r^(1 arrow.r x, R)
  x q_3 0 \# 1 1 arrow.r^(0 arrow.r R)
  x 0 q_3 \# 1 1 arrow.r^(\# arrow.r R)\
  x 0 \# q_5 1 1 arrow.r^(1 arrow.r x, L)
  x 0 q_6 \# x 1 arrow.r^(\# arrow.r L)
  x q_7 0 \# x 1 arrow.r^(0 arrow.r L)\
  q_7 x 0 \# x 1 arrow.r^(x arrow.r R)
  x q_1 0 \# x 1 arrow.r^(0 arrow.r x, R)
  x x q_2 \# x 1 arrow.r^(\# arrow.r R)\
  x x \# x q_4 1 arrow.r^(x arrow.r R)
  x x \# x 1 q_#text(red)[reject]
$

== e. 10\#10

$
  q_1 1 0 \# 1 0 arrow.r^(1 arrow.r x, R)
  x q_3 0 \# 1 0 arrow.r^(0 arrow.r R)
  x 0 q_3 \# 1 0 arrow.r^(\# arrow.r R)\
  x 0 \# q_5 1 0 arrow.r^(1 arrow.r x, L)
  x 0 q_6 \# x 0 arrow.r^(\# arrow.r L)
  x q_7 0 \# x 0 arrow.r^(0 arrow.r L)\
  q_7 x 0 \# x 0 arrow.r^(x arrow.r R)
  x q_1 0 \# x 0 arrow.r^(0 arrow.r x, R)
  x x q_2 \# x 0 arrow.r^(\# arrow.r R)\
  x x \# x q_4 0 arrow.r^(x arrow.r x, L)
  x x \# q_6 x x arrow.r^(x arrow.r L)
  x x q_6 \# x x arrow.r^(\# arrow.r L)\
  x q_7 x \# x x arrow.r^(x arrow.r R)
  x x q_1 \# x x arrow.r^(\# arrow.r R)
  x x \# q_8 x x arrow.r^(x arrow.r R)\
  x x \# x q_8 x arrow.r^(x arrow.r R)
  x x \# x x q_8 union.sq arrow.r^(union.sq arrow.r R)
  x x \# x x union.sq q_#text(green)[accept] union.sq
$

= 3.8
下面的语言都是字母表${0,1}$上的语言, 以实现水平的描述给出判定这些语言的图灵机:

== b. ${w | w #[所包含的0的个数是1的2倍]}$
#set enum(numbering: "(1)")
+ 从左到右扫描纸带，直到找到第一个出现的 $1$ 或扫描到了空白符。\
  - 若扫描到了空白符，扫描向左扫描纸带直到最左端，若在扫描过程中出现了 $0$ 则#text(red)[拒绝]；否则#text(green)[接受]。
+ 将该 $1$ 替换为 $x$，回到纸带左端。
+ 从左到右扫描输入串，直到找到前两个出现的 $0$ 或扫描到了空白符。\
  - 若扫描到了空白符，#text(red)[拒绝]。
+ 在扫描过程中将扫描到的两个 $0$ 替换为 $x$，回到纸带左端。转(1)

== c. ${w | w #[所包含的0的个数不是1的2倍]}$
+ 从左到右扫描纸带，直到找到第一个出现的 $1$ 或扫描到了空白符。\
  - 若扫描到了空白符，扫描向左扫描纸带直到最左端，若在扫描过程中出现了 $0$ 则#text(green)[接受]；否则#text(red)[拒绝]。
+ 将该 $1$ 替换为 $x$，回到纸带左端。
+ 从左到右扫描输入串，直到找到前两个出现的 $0$ 或扫描到了空白符。\
  - 若扫描到了空白符，#text(green)[接受]。
+ 在扫描过程中将扫描到的两个 $0$ 替换为 $x$，回到纸带左端。转(1)

上述方法*不需要*特判空串，在 (2) 操作会自动判定空串。

= 3.15
证明图灵*可判定*语言类在*连接*运算 $circle.small$ 下封闭.

== 证明
即证明 $L_1$ 被图灵机 $M_1$ 判定，$L_2$ 被图灵机 $M_2$ 判定，存在图灵机 $M$ 判定 $L = L_1 circle.small L_2 = {x y | x in L_1, y in L_2}$。

$M$ 的工作原理如下：
+ 对输入的字符串 $w$ ， 设定 $w = x y$ ， 其中 $x$ 是 $w$ 的前缀，$y$ 是 $w$ 的后缀。 对每一个可能的划分 $w = x y$ （即从 $w$ 的第一个字符到最后一个字符的每一个位置都可以作为划分的位置）进行：
  - 将 $x$ 输入 $M_1$
  - 将 $y$ 输入 $M_2$
+ 若存在某个划分使得 $M_1$ 和 $M_2$ 都接受，则 $M$ 接受 $w$ ；否则 $M$ 拒绝 $w$ 。

因为 $L_1$ 和 $L_2$ 都是图灵可判定的，而且这个算法会对每一个可能的划分都进行尝试，所以 $M$ 会在有限步内判定 $w$ 是否在 $L$ 中，所以 $L$ 是图灵可判定的。

= 3.16
证明图灵*可识别*语言类在*交*运算 $sect$ 下封闭.

== 证明
即证明 $L_1$ 被图灵机 $M_1$ 识别，$L_2$ 被图灵机 $M_2$ 识别，存在图灵机 $M$ 识别 $L = L_1 sect L_2 = {x | x in L_1, x in L_2}$。

多纸带图灵机 $M$ 的工作原理如下：
+ 给定输入字符串 $w$ ， 并行运行 $M_1$ 和 $M_2$：
  - 在两个纸带上同时写入 $w$ 。
  - 在一个纸带上模拟 $M_1$ 的运行，另一个纸带上模拟 $M_2$ 的运行。
+ 若 $M_1$ 和 $M_2$ 同时接受 $w$ ，则 $M$ 接受 $w$ ；否则 $M$ 拒绝 $w$ 。

因为 $M_1$ 和 $M_2$ 都是图灵可识别的，而且这个算法会同时运行 $M_1$ 和 $M_2$ ，所以 $M$ 会在有限步内识别 $w$ 是否在 $L$ 中，所以 $L$ 是图灵可识别的。

= 3.28
设多项式 $p(x) = c_1 x^n + c_2 x^(n-1) + dots + c_n x + c_(n + 1)$ 有根 $x_0$ ， $c_"max"$ 是 $c_1, c_2, dots, c_(n + 1)$ 的最大值。 证明：
$
  lr(|x_0|) <= (n + 1)c_"max" / (lr(|c_1|))
$

== 证明
设 $p(x_0) = 0$ ，则有：
$
  c_1 x_0^n + c_2 x_0^(n-1) + dots + c_n x_0 + c_(n + 1) = 0
$

$
  c_1 x_0^n &= -c_2 x_0^(n-1) - dots - c_n x_0 - c_(n + 1)\
  lr(|c_1 x_0^n|) &= lr(|c_2 x_0^(n-1) + dots + c_n x_0 + c_(n + 1)|)\
  lr(|c_1|) lr(|x_0|)^n &= lr(|c_2 x_0^(n-1) + dots + c_n x_0 + c_(n + 1)|)\
  lr(|c_1|) lr(|x_0|)^n &<= lr(|c_2 x_0^(n-1)|) + lr(|c_3 x_0^(n-2)|) + dots + lr(|c_n x_0|) + lr(|c_(n + 1)|)\
  lr(|c_1|) lr(|x_0|)^n &<= lr(|c_2|) lr(|x_0|)^(n-1) + lr(|c_3|) lr(|x_0|)^(n-2) + dots + lr(|c_n|) lr(|x_0|) + lr(|c_(n + 1)|)\
  lr(|c_1|) lr(|x_0|) &<= lr(|c_2|) + lr(|c_3|) lr(|x_0|)^(-1) + dots + lr(|c_n|) lr(|x_0|)^(-n - 2) + lr(|c_(n + 1)|) lr(|x_0|)^(-n-1)\
  lr(|c_1|) lr(|x_0|) &<= lr(|c_max|)(1 + lr(|x_0|)^(-1) + dots + lr(|x_0|)^(-n - 2) + lr(|x_0|)^(-n-1))\
$
有
$
  当 lr(|x_0|) <= 1 时，& quad lr(|x_0|) <= 1 < (n + 1) < (n + 1) c_max / (lr(|c_1|))\
  当 lr(|x_0|) > 1 时，& quad lr(|x_0|) < c_max / lr(|c_1|) (1 + lr(|x_0|)^(-1) + dots + lr(|x_0|)^(-n - 2) + lr(|x_0|)^(-n-1)) < n dot c_max / lr(|c_1|) < (n + 1) c_max / lr(|c_1|)
$
