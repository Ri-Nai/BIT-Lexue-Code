#import "@preview/fletcher:0.5.3" as fletcher: diagram, node, edge

#let under-heavy-line(it) = {
  underline(
    underline(it, stroke: yellow.lighten(50%) + 0.5em, evade: false, background: true, offset: -0.5pt),
    stroke: blue.lighten(50%) + 0.2em,
    evade: true,
    background: true,
    offset: 4pt,
  )
}

#let draw_graph(it, caption: "") = {
  align(
    center,
    figure(
      diagram(
        node-stroke: 0.5pt,
        node-shape: circle,
        it,
      ),
      ..if caption != "" { (caption: caption) } else { () },
    ),
  )
}
#align(
  center,
  text(30pt)[
    *有限自动机作业*
  ],
)
#let class_name(class, name, font: "Noto Sans SC") = {
  text(
    18pt,
    stroke: 0.06em,
    font: font,
    grid(
      columns: (1fr, 3fr),
      row-gutter: 0.3em,
      class + "：", align(center)[#name],
      [], line(length: 95%),
    ),
  )
}
#grid(
  columns: (3fr, 3fr),
  class_name("姓名", "叶子宁"), class_name("学号", "1120231313"),
)
#let apply_styles(body) = {
  set text(font: "Noto Serif SC")
  show raw: set text(font: "Jetbrains Mono", weight: 700)
  show heading.where(level: 1): it => {
    set text(stroke: 0.04em, size: 1.3em, weight: 600, font: "Noto Sans SC")
    it
    v(-1em)
    line(length: 100%)
  }
  body
}
#let header(title) = {
  align(
    center,
    text(30pt)[
      *#title*
    ],
  )
  grid(
    columns: (3fr, 3fr),
    class_name("姓名", "叶子宁"), class_name("学号", "1120231313"),
  )
}
