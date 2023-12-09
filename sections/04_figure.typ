#import "../style/elements.typ": *

= 浮动体 <float>

在本节（@float）中，我们将介绍浮动体的概念、分类及其在论文中的使用。

浮动体包括图片、表格和代码等，它们的共同特点是可以自由浮动在页面中，不会影响正文的排版。浮动的意思是，最终排版的图形位置不一定与源文件中的位置对应，这也是新手在使用 #LaTeX 和Typst时可能会遇到的问题。
浮动体的正确使用可以提高论文的可读性和美观程度，但也需要注意不要过度使用或使其影响正文的连贯性。

在Typst中，浮动体以 #raw("#figure()", lang: "typ") 的形式实现。不同类型的浮动体都是在此基础上进行扩展的。#raw("#figure()", lang: "typ") 的基础语法如@lst:floatcode
所示。

#figure(
  ```typ
        #figure(
          <content>,
          <placement>,
          <caption>,
          <kind>,
          <supplement>,
        )
        ```,
  caption: [Typst的#raw("#figure()", lang: "typ") 参数列表],
  placement: none,
  kind: "raw",
  supplement: "代码",
) <floatcode>

其中，`content` 是浮动体的具体内容，如图片、表格、代码等；`placement` 是浮动体的位置：`none` 表示不浮动，`auto`
表示自动浮动，`top` 表示浮动到页面顶部，`bottom` 表示浮动到页面底部；`caption` 是浮动体的标题；`kind`
是浮动体的类型，用于计数和索引；`supplement` 是浮动体的类型的中文名称。

== 插图

插图是论文中最常见的浮动体，它可以是矢量图（SVG）或位图（PNG、JPG、GIF等）。在Typst中，插图以 #raw("#image()", lang: "typ") 的形式实现，这个函数最重要的参数是
`path`，它指定了插图的源文件路径；具体的文档参见#link("https://typst.app/docs/reference/visualize/image/")[#emph[插图]]。

=== 单个插图

#table(columns: (1fr, 1fr), [
  #set align(center)
  #strong[代码]
], [
  #set align(center)
  #strong[渲染结果]
], ```typ
  #figure(
    image(example-image, width: 70%),
    caption: [单个插图示例],
  )
  ```, [
  #figure(image(example-image, width: 70%), caption: [单个插图示例])
])

=== 多个插图

要同时展示多个插图，我们可以把一个 #raw("#grid()", lang: "typ") 作为 #raw("#figure()", lang: "typ") 的
`content` 参数，也可以把多个 #raw("#figure()", lang: "typ") 作为 #raw("#grid()", lang: "typ") 的
`content` 参数。前者只能指定一个标题和编号，后者可以为每个插图指定不同的标题和编号。

下面，我们以 $2 times 2$ 的网格为例，展示多个插图的使用方法。

==== 单个标题和编号

#table(columns: (1fr, 1fr), [
  #set align(center)
  #strong[代码]
], [
  #set align(center)
  #strong[渲染结果]
], ```typ
#figure(grid(
  columns: 2,
  rows: 2,
  gutter: 5pt,
  image(example-image),
  image(example-image),
  image(example-image),
  image(example-image),
), caption: [多个插图示例1]) <multifigure1>
```, [
  #figure(grid(
    columns: 2,
    rows: 2,
    gutter: 5pt,
    image(example-image),
    image(example-image),
    image(example-image),
    image(example-image),
  ), caption: [多个插图示例1]) <multifigure1>
])

==== 多个标题和编号

#table(columns: (1fr, 1fr), [
  #set align(center)
  #strong[代码]
], [
  #set align(center)
  #strong[渲染结果]
], ```typ
#figure(grid(
  columns: 2,
  rows: 2,
  gutter: 5pt,
  [#figure(image(example-image), caption: [示例2]) <multifigure2>],
  [#figure(image(example-image), caption: [示例3]) <multifigure3>],
  [#figure(image(example-image), caption: [示例4]) <multifigure4>],
  [#figure(image(example-image), caption: [示例5]) <multifigure5>],
))
```, [
  #figure(grid(
    columns: 2,
    rows: 2,
    gutter: 5pt,
    [#figure(image(example-image), caption: [示例2]) <multifigure2>],
    [#figure(image(example-image), caption: [示例3]) <multifigure3>],
    [#figure(image(example-image), caption: [示例4]) <multifigure4>],
    [#figure(image(example-image), caption: [示例5]) <multifigure5>],
  ))
])

== 表格

表格是论文中常见的浮动体，它可以是简单的表格，也可以是复杂的表格。编排表格时应简单明了、表达一致，内容明晰易懂，表文呼应，内容一致。在Typst中，表格以 #raw("#table()", lang: "typ") 的形式实现。