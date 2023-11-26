#import "utils.typ": *

#let config(
  doc
) = {

  set text(font-size.at("5"), font: font-family.song, lang: "zh", region: "cn")
  set par(justify: true, first-line-indent: 2em, )

  show strong: it => text(font: font-family.hei, weight: "bold", it.body)
  show emph: it => text(font: font-family.kai, style: "italic", it.body)
  show raw: set text(font: font-family.code)
  
  set underline(offset: 3pt, stroke: 0.6pt)

  set page(
    paper: "a4",
    binding: left,
    header: {
      set text(font: font-family.song, font-size.at("-4"))
      grid(
        columns: (0.5em, 1fr, auto, 0.5em),
        [],
        image("figures/tongji.svg", height: 1cm),
        block(
          height: 0.7cm,
          [#set align(right); 毕业设计（论文）]
        ),
        [],
      )
      v(-0.5em)
      line(length: 100%, stroke: 1.8pt)
    },
   header-ascent:20%,

    margin: (
    top: 4.2cm,
    bottom: 2.7cm,
    left: 3.3cm,
    right: 1.8cm,
  ),
  footer: {
    set text(font: font-family.song, font-size.at("-4"))
    set align(right)
    line(length: 100%, stroke: 1.8pt)
    v(-0.5em)
    // [#counter(page).display(both:true, "共　1　页　第　1　页")]
    [共$quad$#locate(loc => {counter(page).final(loc).at(0)})$quad$页#counter(page).display("　第　1　页")]
  },
  background: image("figures/background.png", width: 210mm, height: 297mm),
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
    v(0.5em)
    par(leading: 1.5em)[#text(size:0.0em)[#h(0.0em)]]
  } else if it.level == 2 {
    set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
    v(0.5em)
    it
    v(0.5em)
    par(leading: 1.5em)[#text(size:0.0em)[#h(0.0em)]]
  } else if it.level == 3 {
    set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
    v(0.5em)
    it
    v(0.5em)
    par(leading: 1.5em)[#text(size:0.0em)[#h(0.0em)]]
  } else if it.level == 4 {
    set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
    it
    par(leading: 1.5em)[#text(size:0.0em)[#h(0.0em)]]
  } else if it.level == 5 {
    set text(font:font-family.hei, size: font-size.at("5"), weight: "bold")
    it
    par(leading: 1.5em)[#text(size:0.0em)[#h(0.0em)]]
  }
}
  

  // draw-binding()

  


  // let i = 
  // while i < total_pages {
  // }



  doc
}