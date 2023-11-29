#let font-size = (
  "0": 42pt,   // 初号
  "-0": 36pt,  // 小初
  "1": 26pt,   // 一号
  "-1": 24pt,  // 小一
  "2": 22pt,   // 二号
  "-2": 18pt,  // 小二
  "3": 16pt,   // 三号
  "-3": 15pt,  // 小三
  "4": 14pt,   // 四号
  "-4": 12pt,  // 小四
  "5": 10.5pt, // 五号
  "-5": 9pt,   // 小五
  "6": 7.5pt,  // 六号
  "-6": 6.5pt, // 小六
  "7": 5.5pt,  // 七号
  "-7": 5pt,   // 小七
)

#let times-new-roman = "Times New Roman"
#let normal-font = "TeX Gyre Termes"
#let math-font = "TeX Gyre Termes Math"
#let mono-font = "Fira Code"

#let font-family = (
  fangsong: (normal-font, "FZFangSong-Z02"),
  song: (normal-font, "FZShuSong-Z01"),
  hei: (normal-font, "FZHei-B01"),
  kai: (normal-font, "FZKai-Z03"),
  xiaobiaosong: (normal-font, "FZXiaoBiaoSong-B05"),
  xihei: (normal-font, "FZXiHeiI-Z08"),
  code: (mono-font, "FZKai-Z03"),
  math: (math-font, "FZKai-Z03"),
)

#let ii = math.class("normal", $mono(i)$)
#let jj = math.class("normal", $mono(j)$)
#let ee = math.class("normal", $mono(e)$)

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