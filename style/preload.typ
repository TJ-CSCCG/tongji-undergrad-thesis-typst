#let 宋体 = ("Times New Roman", "SimSong")
#let 黑体 = ("Times New Roman", "SimHei")
#let 仿宋 = ("Times New Roman", "FangSong")
#let 楷体 = ("Times New Roman", "Kaiti")
#let 初号 = 42.15749pt
#let 小初号 = 36.135pt
#let 一号 = 26.09749pt
#let 小一号 = 24.09pt
#let 二号 = 22.08249pt
#let 小二号 = 18.06749pt
#let 三号 = 16.06pt
#let 小三号 = 15.05624pt
#let 四号 = 14.05249pt
#let 小四号 = 12.045pt
#let 五号 = 10.53937pt
#let 小五号 = 9.03374pt
#let 六号 = 7.52812pt
#let 小六号 = 6.52437pt

#let ii = math.class("normal", $mono(i)$)
#let jj = math.class("normal", $mono(j)$)
#let ee = math.class("normal", $mono(e)$)

#let environment(
  name: "",
  caption: "",
  number: (),
  supplement: "",
  body
) = locate(loc => {
  figure(
    body,
    caption: caption,
    numbering: (_) => {
      let chapter = counter(heading).at(loc).at(0)
      let idx = counter(name + str(chapter)).at(loc).at(0)
      number(chapter, idx)
    },
    supplement: supplement,
    kind: name,
  )
})

#let equation = environment.with(
  name: "equation",
  number: (chapter, idx) => 
    "(" + str(chapter) + "-" + str(idx)+ ")",
  supplement: "公式"
)