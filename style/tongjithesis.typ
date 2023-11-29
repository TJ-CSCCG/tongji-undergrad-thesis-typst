#import "utils.typ": *

#let config(
  doc
) = {

  set text(font-size.at("5"), font: font-family.song, lang: "zh", region: "cn")
  set par(justify: true, first-line-indent: 2em, leading: 0.9em)
  show par: set block(spacing: 0.9em)

  set math.equation(numbering: "(1)")  // not implemented yet: (1.1)

  show strong: it => text(font: font-family.hei, weight: "bold", it.body)
  show emph: it => text(font: font-family.kai, style: "italic", it.body)
  show raw: set text(font: font-family.code)
  show math.equation: set text(font: font-family.math)
  show raw.where(block: true): block.with(
    fill: luma(250),
    inset: 10pt,
    radius: 4pt,
  )
  
  set underline(offset: 3pt, stroke: 0.6pt)

  set page(
    paper: "a4",
    binding: left,
    header: {
      set text(font: font-family.song, font-size.at("-4"))
      grid(
        columns: (0.5em, 1fr, auto, 0.5em),
        [],
        image("../figures/tongji.svg", height: 1cm),
        block(
          height: 0.7cm,
          [#set align(right); 毕业设计（论文）]
        ),
        [],
      )
      v(-0.5em)
      line(length: 100%, stroke: 1.8pt)
      draw-binding()
    },
   header-ascent:20%,
    margin: (
    top: 4.2cm,
    bottom: 2.7cm,
    left: 3.3cm,
    right: 1.8cm,
  ),
  footer: locate(loc => {
      line(stroke: 1.8pt, length: 100%)
      set align(right)
      set text(font: font-family.song, size: font-size.at("4"))
      v(-0.6em)
      [
        共#h(1em)
        #counter(page).final(loc).at(0)#h(1em)
        页#h(1em)
        第#h(1em)
        #counter(page).at(loc).at(0)
        #h(1em)页
      ]
    }),
  )

  set heading(numbering: (..nums) => 
                          if nums.pos().len() <= 3  {
                            nums.pos().map(str).join(".") + "  "
                          } else if nums.pos().len() == 4 {"ABCDEFGHIJKLMNOPQRSTUVWXYZ".at(nums.pos().at(-1) - 1) + ". "
                          } else if nums.pos().len() == 5 {"abcdefghijklmnopqrstuvwxyz".at(nums.pos().at(-1) - 1) + ". "
                          }
                        )

  show heading: it =>  {
    if it.level == 1 {
      set align(center)
      set text(font:font-family.hei, size: font-size.at("4"), weight: "bold")
      it
      v(1em)
    } else if it.level == 2 {
      set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
      it
      v(1em)
    } else if it.level == 3 {
      set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
      it
      v(1em)
    } else if it.level == 4 {
      set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
      v(-0.5em)
      grid(
        columns: (2em, 1fr),
        [],
        it,
      )
      v(0.5em)
    } else if it.level == 5 {
      set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
      v(-0.5em)
      grid(
        columns: (2em, 1fr),
        [],
        it,
      )
      v(0.5em)
    }
  } + empty_par()

  

  show list: it => it + empty_par()
  show enum: it => it + empty_par()
  show figure: it => it + empty_par()
  
  doc
}