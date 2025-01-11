#import "template.typ": *

#show: apply_styles.with()
#header([有限自动机作业])

= 1.1
下图给出了两台 $"DFA"$ $"M"_1$ 和$"M"_2$的状态图。
#draw_graph(
  {
    node((0deg, 0), $q_1$, name: <1>)
    node((0deg, 2), $q_2$, name: <2>, extrude: (0, -4))
    node((60deg, 2), $q_3$, name: <3>)

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <1>, "-|>", bend: 120deg)[b]
    edge(<1>, <2>, "-|>")[a]
    edge(<2>, <3>, "-|>", bend: -20deg)[a, b]
    edge(<3>, <2>, "-|>", bend: -20deg)[a]
    edge(<3>, <1>, "-|>", label-side: left)[a]
  },
  caption: "1-1.  " + $M_1$,
)

#draw_graph(
  {
    node((0, 0), $q_1$, name: <1>, extrude: (0, -4))
    node((2, 0), $q_2$, name: <2>)
    node((0, 2), $q_3$, name: <3>)
    node((2, 2), $q_4$, name: <4>, extrude: (0, -4))

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <1>, "-|>", bend: 120deg)[a]
    edge(<1>, <2>, "-|>")[b]

    edge(<2>, <3>, "-|>", bend: 20deg)[a]
    edge(<2>, <4>, "-|>", label-side: left)[b]

    edge(<3>, <2>, "-|>", bend: 20deg)[a]
    edge(<3>, <1>, "-|>", label-side: left)[b]

    edge(<4>, <3>, "-|>", label-side: left)[a]
    edge(<4>, <4>, "-|>", bend: 120deg, loop-angle: -90deg)[b]
  },
  caption: "1-1.  " + $M_2$,
)

回答下述关于这两台机器的问题。
== a. 它们的起始状态是什么?
$M_1$: $q_0_1=q_1$\
$M_2$: $q_0_2=q_1$
== b. 它们的接受状态集是什么?
$M_1$: $F_1=\{q_2\}$\
$M_2$: $F_2=\{q_1, q_4\}$
== c. 对输入aabb，它们经过的状态序列是什么?
$M_1$: $q_1 arrow.r^a q_2 arrow.r^a q_3 arrow.r^b q_1 arrow.r^b q_1$\
$M_2$: $q_1 arrow.r^a q_1 arrow.r^a q_1 arrow.r^b q_2 arrow.r^b q_4$
== d. 它们接受字符串aabb吗?
$M_1$: $q_1 in.not F_1$，不接受\
$M_2$: $q_4 in F_2$，接受
== e. 它们接受字符串ε吗?
$M_1$: $q_1 in.not F_1$，不接受\
$M_2$: $q_1 in F_2$，接受

= 1.6

画出识别下述语言的DFA状态图\
字母表为 ${0,1}$\

${ w | w "的长度不小于" 3 ",并且第3个符号为0"}$


#draw_graph(
  {
    node((0, 0), $q_1$, name: <1>)
    node((1, 0), $q_2$, name: <2>)
    node((2, 0), $q_3$, name: <3>)
    node((3, -0.5), $q_4$, name: <4>, extrude: (0, -4))
    node((3, 0.5), $q_5$, name: <5>)
    node((0, 0.5), $epsilon$, stroke: none)
    node((1, 0.5), $(0 union 1)$, stroke: none)
    node((2, 0.5), $(0 union 1)^2$, stroke: none)
    node((3, -1), $(0 union 1)^2 1(0 union 1)^*$, stroke: none)
    node((3, 1), $(0 union 1)^2 0(0 union 1)^*$, stroke: none)

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <2>, "-|>", bend: 20deg)[0]
    edge(<1>, <2>, "-|>", bend: -20deg)[1]
    edge(<2>, <3>, "-|>", bend: 20deg)[0]
    edge(<2>, <3>, "-|>", bend: -20deg)[1]
    edge(<3>, <4>, "-|>")[1]
    edge(<3>, <5>, "-|>")[0]
    edge(<5>, <5>, "-|>", bend: -130deg, loop-angle: 180deg)[0, 1]
    edge(<4>, <4>, "-|>", bend: -130deg, loop-angle: 180deg)[0, 1]
  },
  caption: "1-6.  " + $w | w "的长度不小于" 3 ",并且第3个符号为0"$,
)
= 1.7
给出下述语言的NFA，并且符合规定的状态数\
字母表为${0,1}$\
语言$0^*1^*0^*0$, 3个状态。
#draw_graph(
  {
    node((0, 0), $q_1$, name: <1>)
    node((1, 0), $q_2$, name: <2>)
    node((2, 0), $q_3$, name: <3>, extrude: (0, -4), shape: circle)

    node((0, 0.5), $0^*$, stroke: none)
    node((1, 0.5), $0^*1^*$, stroke: none)
    node((2, 0.5), $0^*1^*00^*=0^*1^*0^*0$, stroke: none)

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <1>, "-|>", bend: 130deg, loop-angle: 90deg)[0]
    edge(<1>, <2>, "-|>")[$epsilon$]
    edge(<2>, <2>, "-|>", bend: 130deg, loop-angle: 90deg)[1]
    edge(<2>, <3>, "-|>")[0]
    edge(<3>, <3>, "-|>", bend: 130deg, loop-angle: 90deg)[0]
  },
  caption: "1-7.  " + $0^*1^*0^*0$,
)
= 1.16
将如下图的非确定有限自动机转换成等价的确定有限自动机
#draw_graph(
  {
    node((0deg, 0), $1$, name: <1>)
    node((0deg, 2), $2$, name: <2>, extrude: (0, -4))
    node((60deg, 2), $3$, name: <3>)

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <2>, "-|>", bend: 20deg)[$epsilon$]
    edge(<2>, <1>, "-|>", bend: 20deg)[a]
    edge(<3>, <2>, "-|>", label-side: right)[a, b]
    edge(<1>, <3>, "-|>", label-side: right)[a]
    edge(<3>, <3>, "-|>", bend: 120deg, loop-angle: -90deg)[b]
  },
  caption: "1-16.  " + $"NFA"$,
)

#align(
  center,
  figure(
    table(
      columns: 3,
      [状态], [a], [b],
      [1, #text(red)[2]], [1, #text(red)[2], 3], [$emptyset.rev$],
      [1, #text(red)[2], 3], [1, #text(red)[2], 3], [#text(red)[2], 3],
      [#text(red)[2], 3], [1, #text(red)[2]], [#text(red)[2], 3],
    ),
  ),
)

#draw_graph(
  {
    node((0, 0), $q_1$, name: <1>, extrude: (0, -4))
    node((0, 0.4), ${1, #text(red)[2]}$, stroke: none)
    node((1, 0), $q_2$, name: <2>, extrude: (0, -4))
    node((1, 0.4), ${1, #text(red)[2], 3}$, stroke: none)

    node((1, -1), $q_3$, name: <3>, extrude: (0, -4))
    node((1, -1.4), ${#text(red)[2], 3}$, stroke: none)

    node((0, -1), $q_4$, name: <4>)
    node((0, -1.4), $emptyset.rev$, stroke: none)

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <4>, "-|>")[b]
    edge(<1>, <2>, "-|>", label-side: right)[a]

    edge(<2>, <2>, "-|>", bend: 120deg, loop-angle: 0deg)[a]
    edge(<2>, <3>, "-|>")[b]

    edge(<3>, <3>, "-|>", bend: 120deg, loop-angle: 0deg)[b]
    edge(<3>, <1>, "-|>")[a]
  },
  caption: "1-16.  " + $"DFA"$,
)

= 1.21
将如下图的有限自动机转换成等价的正则表达式.

#draw_graph(
  {
    node((0, 0), $q_1$, name: <1>)
    node((0, 1), $q_2$, name: <2>, extrude: (0, -4))

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <1>, "-|>", bend: 120deg)[a]
    edge(<1>, <2>, "-|>", bend: 20deg)[b]
    edge(<2>, <2>, "-|>", bend: 120deg, loop-angle: -90deg)[a]
    edge(<2>, <1>, "-|>", bend: 20deg)[b]
  },
  caption: "1-21.  " + $"DFA"$,
)

#draw_graph(
  {
    node((0, 0), $q_1$, name: <1-1>)
    node((0, 1), $q_2$, name: <1-2>, extrude: (0, -4))

    edge((-0.7, 0), <1-1>, "-|>")
    edge(<1-1>, <1-1>, "-|>", bend: 120deg)[a]
    edge(<1-1>, <1-2>, "-|>", bend: 20deg)[b]
    edge(<1-2>, <1-2>, "-|>", bend: 120deg, loop-angle: -90deg)[a]
    edge(<1-2>, <1-1>, "-|>", bend: 20deg)[b]

    node(enclose: (<1-1>, <1-2>), name: <gragh-1>, inset: 3em)

    node((4, 0), $q_1$, name: <2-1>)
    node((4, 1), $q_2$, name: <2-2>)

    node((3, 0), $s$, name: <2-s>)
    node((3, 1), $a$, name: <2-a>, extrude: (0, -4))

    edge((2.3, 0), <2-s>, "-|>")

    edge(<2-s>, <2-1>, "-|>")[$epsilon$]
    edge(<2-1>, <2-1>, "-|>", bend: 120deg)[a]
    edge(<2-1>, <2-2>, "-|>", bend: 20deg)[b]
    edge(<2-2>, <2-2>, "-|>", bend: 120deg, loop-angle: -90deg)[a]
    edge(<2-2>, <2-1>, "-|>", bend: 20deg)[b]
    edge(<2-2>, <2-a>, "-|>")[$epsilon$]

    node(enclose: (<2-1>, <2-2>, <2-s>, <2-a>), name: <gragh-2>, inset: 3em)

    edge(<gragh-1>, <gragh-2>, "-|>", label-side: right)
  },
  caption: "1-21.  " + $"DFA"$ + "增加初末状态",
)

#figure(
  image("imgs/有限自动机1-21.jpg"),
  caption: "消除中间状态",
)
得最终的正则表达式为 $ a^*b(a union (b a^*b))^* $

= 1.22

在某些程序设计语言中，注释出现在两个分隔符之间，如`\#`和`#/`。\
设C是所有有效注释串形成的语言。C中的成员必须以`/#`开始，`#/`结束，并且在开始和结束之间没有`#/`。\
为简便起见，所有注释都由符号a和b写成; 因此C的字母表$S={a, b, \/, \#}$.

== a. 给出识别C的DFA.
#draw_graph(
  {
    node((0, 0), $q_1$, name: <1>)
    node((1, 0), $q_2$, name: <2>)
    node((2, 0), $q_3$, name: <3>)
    node((3, 0), $q_4$, name: <4>)
    node((4, 0), $q_5$, name: <5>, extrude: (0, -4))
    node((2, 3), $q_6$, name: <6>)

    edge((-0.7, 0), <1>, "-|>")
    edge(<1>, <2>, "-|>")[/]
    edge(<2>, <3>, "-|>")[\#]
    edge(<3>, <4>, "-|>")[\#]
    edge(<4>, <5>, "-|>")[/]
    edge(<6>, <6>, "-|>", bend: 120deg, loop-angle: -90deg)[a, b, /, \#]

    edge(<1>, <6>, "-|>", bend: -60deg)[a, b, \#]
    edge(<2>, <6>, "-|>", bend: -20deg)[a, b, /]
    edge(<5>, <6>, "-|>", bend: 60deg)[a, b, /, \#]

    edge(<3>, <3>, "-|>", bend: 120deg, loop-angle: -90deg)[a, b, /]
    edge(<4>, <3>, "-|>", bend: 130deg, loop-angle: -90deg)[a, b]
    edge(<4>, <4>, "-|>", bend: 120deg, loop-angle: -90deg)[\#]
  },
  caption: "1-22.  " + $"DFA"$,
)
== b. 给出产生C的正则表达式.
绘制出如 @1-22 的 $"GNFA"$，先消去 $q_1$ 再消去 $q_2$，得到最终的正则表达式为
$ \/\# (a union b union \/)^* \# (\# union ((a union b)(a union b)^* \#) )^* \/ $
即
$ \/\# (a union b union \/)^* \# (\# union ((a union b)^+ \#) )^* \/ $
#figure(
  image("imgs/有限自动机1-22.jpg", height: 32.88634188%),
  caption: "计算过程\n本图中的" + $q_1 arrow.r^\/ q_1$ + "忘记加了，上面的答案里补上了",
)<1-22>

= 1.29
使用泵引理证明下述语言不是正则的。

$ A = {w w w | w in {a, b}^*} $

== 泵引理：
设$L$是一个正则语言，那么存在一个整数$p$，使得对于$L$中的任何一个长度大于等于$p$的字符串$w$，都可以写成 $x y z$ 的形式，满足以下条件：
1. 对于任意非负整数 $i$，字符串 $x y^i z$ 也在L中
2. $|y|$ > 0
3. $|x y| <= p$

== 证明：

假设 $A$ 是正则的，那么存在一个整数 $p$，使得对于 $A$ 中的任何一个长度大于等于 $p$ 的字符串 $w$，都可以写成 $x y z$ 的形式，满足上述三个条件。\
$
  forall p > 0, space 取 space s = a^p b a^p b a^p b, s in A \
  设 space s = x y z ,quad |x| < |x y| <= p \
  则 space x = a^k, quad y = a^l, quad 0<= k <= p - 1, quad k + l <= p \
  取 space i = 0, space 则 space x y^0 z = a^(p - l) b a^p b a^p b in.not A \
  则 space x y^0 z "不在" A "中，与泵引理矛盾，所以 A 不是正则的。"
$

