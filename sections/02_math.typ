#import "/style/preload.typ": *

= 数学 <math>

在本节（@math）中，我们展示各种数学符号和环境的使用。

== 数学符号和公式

按照国标 GB/T 3102.11—1993《物理科学和技术中使用的数学符号》，
微分符号 $dif$ 应使用直立体。除此之外，数学常数也应使用直立体：

- 微分符号 $dif$：#raw("$dif$", lang: "typ")
- 圆周率 $pi$：#raw("$pi$", lang: "typ")
- 自然对数的底 $ee$：#raw("$ee$", lang: "typ")
- 虚数单位 $ii$, $jj$：#raw("$ii$, $jj$", lang: "typ")

公式应另起一行居中排版。公式后应注明编号，按章顺序编排，编号右端对齐。
#equation($
  frac(dif^2, dif t^2) x(t)+omega^2x(t)=sin(t) \
  frac(diff^2u, diff t^2)=frac(diff^2u, diff x^2)+frac(diff^2u, diff y^2)
$)

公式末尾是需要添加标点符号的，至于用逗号还是句号，取决于公式下面一句是接着公式说的，还是另起一句。
begin{equation}
  $
    sum_(n=1)^(infinity)frac(cos(n x), n^2)=frac(pi^2, 6)-frac(x^2, 4)
  $
end{equation}

公式较长时最好在等号“$=$”处转行。
begin{align}
$
        & I(X_1;X_2)-I(X_1;X_2|X_3)     \ 
  =     & H(X_2)-H(X_2|X_3)             \
  =     & H(X_2,X_3)-H(X_3)-H(X_2|X_3)  \
  =     & I(X_2;X_3)-I(X_2;X_3|X_1)     \
  =     & I(X_2;X_3,X_1)                \
  gt.eq & 0
$
end{align}

如果在等号处转行难以实现，也可在 $+$、$-$、$times$、$div$ 运算符号处转行，转行时运算符号仅书写于转行式前，不重复书写。
begin{multline}
$
  frac{1}{2} Delta (f_{i j} f^{i j}) =
  2 (sum_{i<j} chi_{i j}(sigma_{i} - sigma_{j})^{2}
  + f^{i j} nabla_{j} nabla_{i} (Delta f)  + nabla_{k} f_{i j} nabla^{k} f^{i j} +
  f^{i j} f^{k} [2nabla_{i}R_{j k}- nabla_{k} R_{i j} ] ) 
  - 3H^{2}[1+frac{dot{phi}}{2H^2}] - frac{dot{phi}^{2}}{2} - frac{k}{a^{2}}phi^{2} - frac{1}{2}(frac{diff phi}{diff t})^{2} + frac{a^2}{2}(frac{diff phi}{diff x})^{2}
  + frac{1}{4}lambda phi^{4} + frac{beta}{3}phi^{3} 
  -frac{1}{2}mu^{2}phi^{2}(ln{phi^{2}} - c)
  + frac{e^{2}}{2}(frac{diff A_{mu}}{diff t})^{2} - frac{e^{2}}{2}(frac{diff A_{mu}}{diff x})^{2}
  - e^{2}phi^{2}A_{mu}A^{mu} + frac{1}{4}F_{mu nu}F^{mu nu}.
$
end{multline}

== 定理环境

定理环境是数学领域中常用的一种环境类型，用于表述和证明各种数学定理、推论、引理等。在 LaTeX 中，我们可以通过定义定理环境来方便地排版定理等内容，使其在文档中具有更加统一的风格和格式。

在本节中，我们展示了一些常用的定理环境，包括定理、推论、引理、命题、猜想、假设、定义、例、注等。这些环境的具体样式可以通过修改定理环境的定义进行自定义。此外，我们还展示了定理证明环境，用于证明各种定理和结论。在定理证明环境中，我们可以使用各种数学符号和公式，方便地展示证明过程，使读者更加易于理解。

请注意，下面的文字均由ChatGPT生成。我们不保证它们的正确性。

begin{thm}
  对于任意正整数 $n$，存在无穷多个素数。
end{thm}

begin{proof}
  我们采用反证法。假设存在一个最大的素数 $p$，那么任何大于 $p$ 的正整数 $n$ 都可以表示为 $p$ 和某个正整数 $k$ 的积，即 $n = p k$。但是根据这个假设，$p$ 已经是最大的素数了，所以 $k$ 不可能再包含其他的素数。这意味着我们可以将所有大于 $p$ 的正整数分成两个不相交的集合，一个是由 $p$ 的倍数组成的集合，另一个是由剩下的数组成的集合。而根据素数的定义，这两个集合中至少有一个是不存在素数的。然而，由于 $p$ 是最大的素数，所以它肯定不在由 $p$ 的倍数组成的集合中。这就产生了矛盾，因此假设不成立，定理得证。
end{proof}

begin{cor}
  如果 $a$ 和 $b$ 是正实数，则 $a+b >= 2sqrt{a b}$。
end{cor}

begin{proof}
  我们可以使用平均数不小于几何平均数这个不等式来证明。具体地，我们有：
  begin{align*}
    sqrt{ab}              & leq frac{a+b}{2} 
    Rightarrow 2sqrt{ab} & leq a+b
  end{align*}
  因此，$a+b >= 2sqrt{a b}$，定理成立。
end{proof}

begin{lem}
  设 $f$ 是一个在 $[a,b]$ 上的可微函数，则 $f$ 在 $[a,b]$ 上一定有一点使得 $f'(x) = frac{f(b)-f(a)}{b-a}$。
end{lem}

begin{proof}
  我们定义一个新的函数 $g(x) = f(x) - frac{f(b)-f(a)}{b-a} dot (x-a)$。这个函数满足 $g(a) = f(a)$，$g(b) = f(b)$，且 $g'(x) = f'(x) - frac{f(b)-f(a)}{b-a}$。如果我们能够找到一个点 $c in (a,b)$，使得 $g(c) = 0$，那么根据罗尔定理，$g'(x)$ 必然在 $[a,b]$ 中的某个点为 $0$，即存在 $x_0 in (a,b)$，使得 $f'(x_0) = frac{f(b)-f(a)}{b-a}$。因此，我们只需要证明 $g(a)$ 和 $g(b)$ 异号即可。由于 $f$ 在 $[a,b]$ 上连续，根据介值定理，存在一个点 $c in [a,b]$，使得 $f(c) = frac{f(b)+f(a)}{2}$。那么，我们有：
  begin{align*}
  $
    g(a) & = f(a) - frac{f(b)-f(a)}{b-a} dot (a-a) 
         & = f(a)                                     
         & < frac{f(b)+f(a)}{2}                      
         & = f(c)                                     
         & > frac{f(b)-f(a)}{b-a} dot (c-a)        
         & = f(a) - frac{f(b)-f(a)}{b-a} dot (b-a) 
         & = g(b)
  $
  end{align*}
  因此，$g(a)$ 和 $g(b)$ 异号，定理得证。
end{proof}

begin{prop}
  设 $f$ 和 $g$ 是两个单调递增的函数，则 $f+g$ 也是一个单调递增函数。
end{prop}

begin{proof}
  我们需要证明对于任意的 $x,y in bb(R)$，如果 $x < y$，则 $f(x)+g(x) < f(y)+g(y)$。由于 $f$ 和 $g$ 都是单调递增的，所以有 $f(x) < f(y)$ 和 $g(x) < g(y)$，于是 $f(x)+g(x) < f(y)+g(x) < f(y)+g(y)$。因此，$f+g$ 是单调递增的，定理得证。
end{proof}

begin{conj}
  存在无穷多个双素数，即形如 $p(p+2)$ 的素数。
end{conj}

begin{proof}
  我们采用反证法。假设存在一个最大的双素数 $p(p+2)$，那么任何大于 $p(p+2)$ 的正整数 $n$ 都可以表示为 $p(p+2)$ 和某个正整数 $k$ 的积，即 $n = p(p+2)k$。但是根据这个假设，$p(p+2)$ 已经是最大的双素数了，所以 $k$ 不可能再包含其他的双素数。这意味着我们可以将所有大于 $p(p+2)$ 的正整数分成两个不相交的集合，一个是由 $p(p+2)$ 的倍数组成的集合，另一个是由剩下的数组成的集合。而根据双素数的定义，这两个集合中至少有一个是不存在双素数的。然而，由于 $p(p+2)$ 是最大的双素数，所以它肯定不在由 $p(p+2)$ 的倍数组成的集合中。这就产生了矛盾，因此假设不成立，定理得证。
end{proof}

begin{assume}
  假设 $A$ 和 $B$ 是两个集合，则它们的笛卡尔积 $A times B$ 的基数为 $|A| dot |B|$。
end{assume}

begin{proof}
  我们需要证明 $|A times B| = |A| dot |B|$。我们可以使用等势关系来证明，即构造一个双射 $f: A times B -> {1,2,dots,|A| dot |B|}$。具体地，我们可以按照以下方式定义 $f$：
  begin{equation}
  $
    f(a,b)=(a-1)dot |B|+b
  $
  end{equation}
  其中 $a in A$，$b in B$。显然，$f$ 是一个双射，因为每个元素 $(a,b)$ 都对应着唯一的自然数 $(a-1) dot |B| + b$，而每个自然数也都可以唯一地表示为 $(a-1) dot |B| + b$ 的形式。因此，$A times B$ 和 ${1,2,dots,|A| dot |B|}$ 等势，即它们有相同的基数，定理得证。
end{proof}

begin{dfn}
  一个有向无环图是拓扑排序的，当且仅当它的所有顶点都可以按照某个顺序进行编号，使得对于任意一条有向边 $(u,v)$，$u$ 的编号都小于 $v$ 的编号。
end{dfn}

begin{exmp}
  考虑一个任务调度问题，其中有 $n$ 个任务需要按照一定的顺序执行。如果任务之间存在依赖关系，即某些任务必须在其他任务执行完毕之后才能开始执行，那么我们可以将这些任务和它们之间的依赖关系表示成一个有向无环图，并通过拓扑排序来确定任务的执行顺序。
end{exmp}

begin{rem}
  在数学中，定义和定理是数学推理的基础，而引理和命题则通常作为定理证明的中间步骤。而且在数学研究中，猜想和猜测往往需要大量的证明和反证，才能得到确定的结论。
end{rem}

begin{proof}
  设 $n$ 是任意正整数，则存在一个双射 $f: {1,2,dots,n} -> {n,n-1,dots,1}$，即将 ${1,2,dots,n}$ 中的元素按照相反的顺序重新编号，使得 $f(i) = n-i+1$。因此，我们有：
  begin{align*}
    $sum_{i=1}^n i & = 1 + 2 + dots + (n-1) + n           
                   & = f(1) + f(2) + dots + f(n-1) + f(n) 
                   & = (n+1) dot frac{n}{2}              
                   & = frac{n(n+1)}{2}
    $
  end{align*}
  因此，定理成立。
end{proof}