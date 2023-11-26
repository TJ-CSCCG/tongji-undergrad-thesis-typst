#import "preload.typ": *

#let empty_par() = {
  v(-1.2em)
  box()
}

#let draw_glutter() = {
  let i = 0
  set text(font: 宋体, size: 五号)
  while i < 33 {
    place(dx: -1.8cm, dy: 5.3cm + 0.6cm * i,
      if i == 10 
        [装]
      else if i == 16
        [订]
      else if i == 22
        [线]
      else 
        [#h(0.5em)|])
    i += 1
  }
}

#let make_cover(cover) = align(center)[
  #image("../figures/tongji.jpg", height: 2.25cm)
  #text("TONGJI UNIVERSITY", font: 黑体, size: 小二号, weight: "bold")
    
  #v(30pt)
    
  #text("毕业设计（论文）", font: 黑体, size: 小初号)
    
  #v(60pt)

    
  #set text(font: 黑体, size: 小二号)
  #grid(
    columns: (5em, auto),
    gutter: 16pt,
    ..cover.enumerate().map(((idx, value)) => {
    set text(size: 小二号)
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
]

#let make_abstract(
  title: "",
  abstract: "",
  keywords: (),
  prompt: ()
) = {
  align(center)[
    #v(1em)
    #text(font: 黑体, size: 小二号, weight: "bold", title)
    #v(1pt)
    #text(font: 黑体, size: 四号, weight: "bold", prompt.at(0))
    #v(-0.5em)
  ]
  set par(first-line-indent: 2em)
  text(font: 宋体, abstract)

  v(5mm)
  set par(first-line-indent: 0em)
  text(weight: "bold", prompt.at(1))
  keywords.join(", ")
}

#let make_outline() = {
  show outline: set align(center)
  outline(title: "目录")
  pagebreak()
}

#let thesis(
  school: "",
  major: "",
  id: 0,
  student: "",
  teacher: "",
  title: "",
  subtitle: "",
  title_english: "",
  subtitle_english: "",
  date: datetime.today(),
  abstract: "",
  keywords: (),
  abstract_english: "",
  keywords_english: (),
  body
) = {
  set document(author: str(id) + " " + student, title: title)
  set page(
    paper: "a4",
    margin: (
      top: 4.2cm,
      bottom: 2.7cm,
      left: 3.3cm,
      right: 1.8cm
    )
  )
  set text(font: 宋体, size: 五号, lang: "zh")

  make_cover((
    "课题名称", title,
    "副标题", subtitle,
    "学院", school,
    "专业", major,
    "学生姓名", student,
    "学号", str(id),
    "指导老师", teacher,
    "日期", date.display("[year]年[month]月[day]日"),
  ))
  pagebreak()

  set page(
    numbering: "I",
    header: {
      draw_glutter()
      box(height: 1.14cm, grid(
        columns: (auto, auto), 
        box(width: 100%, {
          set align(left)
          image("../figures/tongji.jpg")
        }),
        box(width: 100%, height: 100%, {
          set align(right + horizon)
          text(font: 宋体, size: 小四号, "毕业设计（论文）")
        })
      ))
      line(stroke: 1.8pt, length: 100%)
    }
  )
  counter(page).update(1)

  make_abstract(
    title: title,
    abstract: abstract,
    keywords: keywords,
    prompt: ("摘要", "关键词: "),
  )
  pagebreak()

  make_abstract(
    title: title_english,
    abstract: abstract_english,
    keywords: keywords_english,
    prompt: ("ABSTRACT", "Key Word: "),
  )
  pagebreak()

  make_outline()
  
  set page(
    footer: locate(loc => {
      line(stroke: 1.8pt, length: 100%)
      set align(right)
      set text(font: 宋体, size: 小四号)
      [
        共#h(1em)
        #counter(page).final(loc).at(0)#h(1em)
        页#h(1em)
        第#h(1em)
        #counter(page).at(loc).at(0)
        #h(1em)页
      ]
    })
  )
  counter(page).update(1)
  show heading: it => locate(loc => {
    v(0.6em)
    if it.level == 1 {
      set align(center)
      set text(size: 小四号, font: 黑体)
      if it.numbering != none {
        numbering(it.numbering, ..counter(heading).at(loc))
      }
      h(1em)
      it.body
    }
    else {
      text(size: 五号, font: 黑体, it)
    }
    v(0.6em)
  }) + empty_par()
  show raw.where(block: true): it => {
    set block(
      inset: (
        left: 2em
      )
    )
    it
  } + empty_par()
  show list: it => it + empty_par()
  show enum: it => it + empty_par()
  show figure: it => {
    if it.kind == "equation" {
      it
      it.body
    } else {
      it
    }
  }

  set heading(numbering: "1.1")
  set list(indent: 2em)
  set text(font: 宋体, size: 五号)
  set par(first-line-indent: 2em, justify: true)
  body
}
