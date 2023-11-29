#import "utils.typ": *

#let draw-binding() = {
  place("|", dx: -1.6cm, dy: 2.3cm)
  place("|", dx: -1.6cm, dy: 2.9cm)
  place("|", dx: -1.6cm, dy: 3.5cm)
  place("|", dx: -1.6cm, dy: 4.1cm)
  place("|", dx: -1.6cm, dy: 4.7cm)
  place("|", dx: -1.6cm, dy: 5.3cm)
  place("|", dx: -1.6cm, dy: 5.9cm)
  place("|", dx: -1.6cm, dy: 6.5cm)
  place("|", dx: -1.6cm, dy: 7.1cm)
  place("|", dx: -1.6cm, dy: 7.7cm)
  place("装", dx: -1.8cm, dy: 8.3cm)
  place("|", dx: -1.6cm, dy: 8.9cm)
  place("|", dx: -1.6cm, dy: 9.5cm)
  place("|", dx: -1.6cm, dy: 10.1cm)
  place("|", dx: -1.6cm, dy: 10.7cm)
  place("|", dx: -1.6cm, dy: 11.3cm)
  place("订", dx: -1.8cm, dy: 11.9cm)
  place("|", dx: -1.6cm, dy: 12.5cm)
  place("|", dx: -1.6cm, dy: 13.1cm)
  place("|", dx: -1.6cm, dy: 13.7cm)
  place("|", dx: -1.6cm, dy: 14.3cm)
  place("|", dx: -1.6cm, dy: 14.9cm)
  place("线", dx: -1.8cm, dy: 15.5cm)
  place("|", dx: -1.6cm, dy: 16.1cm)
  place("|", dx: -1.6cm, dy: 16.7cm)
  place("|", dx: -1.6cm, dy: 17.3cm)
  place("|", dx: -1.6cm, dy: 17.9cm)
  place("|", dx: -1.6cm, dy: 18.5cm)
  place("|", dx: -1.6cm, dy: 19.1cm)
  place("|", dx: -1.6cm, dy: 19.7cm)
  place("|", dx: -1.6cm, dy: 20.3cm)
  place("|", dx: -1.6cm, dy: 20.9cm)
  place("|", dx: -1.6cm, dy: 21.5cm)
}

#let empty_par() = {
  v(-1.2em)
  box()
}

#let make_cover(cover) = align(center)[
  #image("../figures/tongji.svg", height: 2.25cm)
  #text("TONGJI UNIVERSITY", font: font-family.hei, size: font-size.at("-2"), weight: "bold")
    
  #v(30pt)
  #text("本科毕业设计（论文）", font: font-family.hei, size: font-size.at("-0"))
  #v(60pt)

  #set text(font: font-family.hei, size: font-size.at("-2"))
  #grid(
    columns: (5em, auto),
    gutter: 16pt,
    ..cover.enumerate().map(((idx, value)) => {
    set text(size: font-size.at("-2"))
    if calc.even(idx) {
      let arr = value.clusters()
      let k = (4 - arr.len()) / (arr.len() - 1)
      arr.join([#h(1em * k)])
    } else {
      block(
        width: 100%,
        inset: 4pt,
        stroke: (
          bottom: 1pt + black
        ),
        align(center, value)
      )
    }
  }))
  #pagebreak()
]

#let make_abstract(
  title: "",
  abstract: "",
  keywords: (),
  prompt: (),
  is-english: false
) = {
  align(center)[
    #v(0.5em)
    #text(font: font-family.hei, size: font-size.at("-2"), weight: "bold", title)
    #v(1em)
    #text(font: font-family.hei, size: font-size.at("4"), weight: "bold", prompt.at(0))
    #v(-0.5em)
  ]
  set par(first-line-indent: 2em)
  v(0.5em)
  text(font: font-family.song, abstract)

  v(5mm)
  set par(first-line-indent: 0em)
  text(font: font-family.xiaobiaosong, weight: "bold", prompt.at(1))
  if is-english {
    text(font: font-family.song, keywords.join(", "))
  } else {
    text(font: font-family.song, keywords.join("，"))
  }

  pagebreak()
}

#let make_outline() = {
  show outline: set align(center)
  outline(title: "目录")
  pagebreak()
}