#import "../fonts/font-def.typ": *

#let master-report-cover(
  author: [],
  student-id: [],
  major: [],
  suporvisor: [],
  college: [],
  subject: [],
  title: [],
  asymmetric_margin: false,
) = {
  set page(
    margin: if asymmetric_margin {
      (left: 2.7cm, right: 1.1cm, top: 1.6cm, bottom: 1.5cm)
    } else {
      (x: 3.18cm, y: 2.54cm)
    }
  )

  set text(size: 10.5pt)
  set align(center)
  v(5em)
  image("../assets/image97.png",height: 2.84cm)
  set text(size: 14pt)
  v(1em)
  text(size: 22pt, font: ("Times New Roman", "SimHei"), tracking: 2pt)[*#subject*]

  set text(size: 14pt, font: "STZhongsong")
  v(1em)
//   strong(title)
  text(size: 22pt, font: "STZhongsong", tracking: 2pt)[*#title*]
  text(size: 25pt)[#v(3em)]

  set text(size: 15pt, font: ("Times New Roman", "SimSun"))

  show table.cell: it => {
      v(15pt)
      strong(it)
  }
  set table(
    stroke: (x, y) => {
      if x == 1 {
        (bottom: 1pt)
      }
    }
  )
  table(
    columns: (7em, 6cm),
    [学 #h(1fr) 号], student-id,
    [姓 #h(1fr) 名], author,
    [专 #h(1fr) 业], major,
  )
  v(113.4pt)
}

#let _master_report_set_paper_page_header(it) = {
  set page(
    header: [
      #set par(spacing: 5pt)
      #align(center)[*北京理工大学计算机学院*]
      #line(length: 100%, stroke: 0.5pt)
    ],
  )
  it
}

#let master-report-last-page(date) = {
  pagebreak()
  set page(
    header: [],
    footer: [],
    numbering: none
  )

  v(500pt)
  set text(size: 14pt, font: ("Times New Roman", "SimSun"))

  show table.cell: it => {
      v(15pt)
      set align()
      strong(it)
  }
  set table(
    stroke: (x, y) => {
      if x == 1 {
        (bottom: 1pt)
      }
    }
  )
  table(
    columns: (5.5cm, 5.1cm),
    [研#h(1fr)究#h(1fr)生#h(1fr)签#h(1fr)字], [],
    [指#h(1fr)导#h(1fr)教#h(1fr)师#h(1fr)签#h(1fr)字], [],
    [院#h(1fr)（#h(1fr)系#h(1fr)、#h(1fr)所#h(1fr)）#h(1fr)领#h(1fr)导#h(1fr)签#h(1fr)字], [],
  )

  v(30pt)
  set align(right)
  set text(size: 14pt, font: ("Times New Roman", "SimSun"))
  strong(date.display("[year]  年  [month padding:none]  月  [day padding:none]  日"))
}
