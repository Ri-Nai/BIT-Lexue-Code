#import "../template.typ": *

#show: apply_styles.with()
#header([可计算性作业])

= 4.1
== 题意
对于上图所示的$upright(#[DFA])$ $upright(M)$, 回答下列问题，并说明理由
#draw_graph(
  {
    node((0, 0), $q_1$, name: <1>, extrude: (0, -4))
    node((2, 0), $q_2$, name: <2>)
    node((2, 2), $q_3$, name: <3>)

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <1>, "-|>", bend: 120deg)[0]
    edge(<1>, <2>, "-|>")[1]
    edge(<2>, <3>, "-|>", bend: -20deg)[0, 1]
    edge(<3>, <2>, "-|>", bend: -20deg)[1]
    edge(<3>, <1>, "-|>", label-side: left)[0]
  },
  caption: "1-1.  " + $M_2$,
)
=== a. $angle.l upright(M), 0100 angle.r$ 是否属于 $A_(#[DFA])$？
*属于*\
理由如下：\
状态转移序列为$q_1 arrow.r^0 q_1 arrow.r^1 q_2 arrow.r^0 q_3 arrow.r^0 q_1$，最终状态$q_1 in F$。
=== b. $angle.l upright(M), 011 angle.r$ 是否属于 $A_(#[DFA])$？
*不属于*\
理由如下：\
状态转移序列为$q_1 arrow.r^0 q_1 arrow.r^1 q_2 arrow.r^1 q_3$，最终状态$q_3 in.not F$。
=== c. $angle.l upright(M) angle.r$ 是否属于 $A_(#[DFA])$？
*不属于*\
理由如下：\
$angle.l upright(M) angle.r$ 不符合 $A_(#[DFA])$ 的编码格式。
=== d. $angle.l upright(M) angle.r$ 是否属于 $E
_(#[DFA])$？
*不属于*\
理由如下：\
由 a. 可知，$upright(M)$ 的语言非空，所以 $angle.l upright(M) angle.r$ 不属于 $E_(#[DFA])$。
=== e. $angle.l upright(M), upright(M) angle.r$ 是否属于 $italic(#[EQ])_(#[DFA])$？
*属于*\
理由如下：\
$upright(M)$ 的语言和自身相等，所以 $angle.l upright(M), upright(M) angle.r$ 属于 $italic(#[EQ])_(#[DFA])$。

= 4.2
== 题意
考虑一个 $#[DFA]$ 和一个正则表达式是否等价的问题。\
将这个问题描述为一个语言并证明它是可判定的。\

== 解答
我们可以将这个问题描述为一个语言 $ italic(#[EQ])_(#[DFA], #[$upright(R)$]) = {angle.l upright(M), upright(R) angle.r mid(|) #[M是一个DFA，R是一个正则表达式，L(M) = L(R)]} $
构造如下高水平描述的图灵机 $upright(H)$ = “\
对输入 $angle.l upright(M), upright(R) angle.r$，其中 $upright(M)$ 是一个 $#[DFA]$，$upright(R)$ 是一个正则表达式：\
1. 将 $upright(R)$ 转化为等价的 $#[NFA]$ $upright(N)$。
2. 将 $upright(N)$ 转化为等价的 $#[DFA]$ $upright(M')$。
3. 将 $upright(M)$ 和 $upright(M')$ 作为输入，运行 $upright(M)$ 和 $upright(M')$ 是否等价的图灵机 $italic(#[EQ])_(#[DFA])$。
4. 如果 $italic(#[EQ])_(#[DFA])$ 接受，则接受；否则拒绝。”

由于 $italic(#[EQ])_(#[DFA])$ 是可判定的，所以 $italic(#[EQ])_(#[DFA], #[$upright(R)$])$ 是可判定的。

= 4.3
== 题意
设 $italic(#[ALL])_(#[DFA]) = {angle.l upright(A) angle.r mid(|) upright(A) #[是一个识别 $Σ^\*$ 的 $upright(#[DFA])$]}$。\
证明 $italic(#[ALL])_(#[DFA])$ 可判定。

== 证明
若 $upright(A)$ 是一个识别 $Σ^\*$ 的 $upright(#[DFA])$，则所有的输入都会被接受，故：\

构造如下高水平描述的图灵机 $upright(H)$ = “\
对输入 $angle.l upright(A) angle.r$，其中 $upright(A)$ 是一个 $#[DFA]$：\
1. 标记所有可达的状态。
2. 检查是否所有可达的状态都在 $F$ 中。
3. 如果是，则接受；否则拒绝。”

$upright(H)$ 是一个可判定的图灵机，所以 $italic(#[ALL])_(#[DFA])$ 是可判定的。

= 4.15
== 题意
$A = {angle.l R angle.r mid(|) #[其所描述的语言至少有一个串 $w$ 以 $111$ 为子串]}$。\
证明 $A$ 是可判定的。

== 证明
构造如下高水平描述的图灵机 $upright(H)$ = “\
对输入 $angle.l R angle.r$，其中 $R$ 是一个正则表达式：\
1. 将 $R$ 转化为等价的 $#[NFA]$ $upright(N)$。
2. 构造语言为 $L(upright(M)) = {w mid(|) #[$w$ 以 $111$ 为子串]}$ 的 $upright(#[DFA])$ $upright(M)$。
3. 构造 $upright(#[NFA]) upright(M')$，使得 $L(upright(M')) = L(upright(N)) sect L(upright(M))$。
4. 标记 $upright(M')$ 中的所有可达状态。
5. 检查是否存在一个可达状态 $q$，使得 $q in F$。
6. 如果是，则接受；否则拒绝。”

$upright(H)$ 是一个可判定的图灵机，所以 $A$ 是可判定的。

