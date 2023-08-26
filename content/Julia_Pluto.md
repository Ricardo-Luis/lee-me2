---
title: "Julia e Pluto.jl"
tags: ["welcome"]
order: 1
layout: "md.jlmd"
---

# A linguagem de programação Julia 
[Julia](https://en.wikipedia.org/wiki/Julia_(programming_language)) é uma linguagem de programação de [alto nível](https://en.wikipedia.org/wiki/High-level_programming_language), [dinâmica](https://en.wikipedia.org/wiki/Dynamic_programming_language) e de elevado desempenho adequada para [computação científica](https://pt.wikipedia.org/wiki/Computa%C3%A7%C3%A3o_cient%C3%ADfica). Apresenta ótimas características para a construção de modelos matemáticos e de técnicas de simulação numérica, permitindo analisar e resolver problemas científicos e de engenharia, através do computador.

Julia foi lançada em 2012 mantendo-se como uma linguagem de programação gratuita, multi-plataforma e *open source*.

# Pluto.jl
O [Pluto.jl](https://plutojl.org/) é uma biblioteca Julia que proporciona um ambiente de desenvolvimento integrado para a realização de documentos computacionais (*notebooks*). 
Um *notebook* Pluto possibilita o ensino e aprendizagem de um modo interativo com o utilizador, através da linguagem de programação Julia.

## *Notebooks* reativos e reproduzíveis
Pluto é um ambiente de computação interativo para linguagem de programação Julia que utiliza navegador *web* (recomendado: Mozilla Firefox ou Google Chrome). 
Ele permite combinar o código Julia e os resultados computacionais com texto, expressões matemáticas, imagens, etc., de uma forma interligada e interativa com o utilizador. 
Os *notebooks* Pluto são reativos, pois a atualização de uma parte do código reexecuta automaticamente todas as partes afetadas por essa alteração. 
Ou seja, o Pluto reconhece as dependências entre as células, nas parcelas de código Julia. Assim, sempre que uma célula é alterada, todas as células que desta dependem são automaticamente atualizadas (como numa folha de cálculo: MS Excel, Google Sheets, ...). Isto torna o *notebook* interativo com o utilizador.

Os notebooks Pluto são reproduzíveis, pois o Pluto regista automaticamente as bibliotecas que estão em uso no notebook e gerencia automaticamente o ambiente de trabalho. 
Assim, para garantir a reprodutibilidade, as informações relativas às bibliotecas utilizadas são armazenadas no arquivo do seu notebook. 
Quando outra pessoa abrir seu notebook com o Pluto, exatamente o mesmo ambiente de trabalho é recreado e as mesmas bibliotecas funcionarão em qualquer outro computador.


# Notebooks de Máquinas Elétricas II
A escolha do Pluto.jl como ambiente de programação reativo para Julia, para a elaboração de *notebooks* de apoio a Máquinas Elétricas II, possibilita a implementação de boas práticas de [Ciência Aberta](https://www.ciencia-aberta.pt/). O Julia com o Pluto.jl permitem disponibilizar [recursos educacionais abertos](https://en.wikipedia.org/wiki/Open_educational_resources), através da realização de materiais de ensino-aprendizagem. Também no âmbito da investigação e desenvolvimento, estas ferramentas permitem aplicar os princípios [FAIR](https://openscience.eu/):

- **F**indable
- **A**ccessible
- **I**nteroperable
- **R**eusable

Assim, os *notebooks* reativos com Julia/Pluto podem fomentar a transparência, reprodutibilidade, reutilização e inovação em ciência/engenharia.


## "Time to first plot"
Julia é uma linguagem compilada *just-in-time* (JIT). Isso significa que o compilador irá gerar código binário conforme necessário. Assim, quando abrir/executar o *notebook* pela primeira vez, verificará que tem de aguardar algum tempo pela compilação do código Julia, dependendo da complexidade do mesmo e da capacidade de processamento do seu computador. Por exemplo, a biblioteca `Plots.jl` para realização de gráficos tem uma dimensão considerável e exige tempo de compilação. Esta latência na compilação de um programa Julia é conhecida por ["time to first plot"_](https://lwn.net/Articles/856819/), que teve melhorias significativas nas versões 1.6 e 1.9 do Julia. Após a 1ª execução, apenas as alterações que realize (no código, nos dados, por interação) serão compiladas, pelo que verificará, a partir daí o [elevado desempenho](https://julialang.org/benchmarks/) da linguagem Julia.

Assim, como sugestão, após abrir um dos *notebooks* de Máquinas Elétricas II no seu Julia/Pluto, pode fazer uma primeira leitura desse *notebook* na versão estática do mesmo, disponibilizada neste *website*, até a 1ª compilação/execução terminar, para então depois poder utilizá-lo.

No final de cada *notebook* é indicado o tempo da 1ª compilação, acompanhado das informações sobre a frequência de processamento do CPU e a capacidade de memória RAM do computador em que foi testado, como referência.


# Leitura/informação complementar:

## Sobre _notebooks_ Pluto:

- Fons van der Plas, Mikołaj Bochenski, [Interactive notebooks Pluto.jl](https://youtu.be/IAF8DjrQSSk), vídeo de apresentação do Pluto, conferência JuliaCon 2020. Duração: 24min.
- Fons van der Plas, [🎈 Pluto.jl — one year later](https://youtu.be/HiI4jgDyDhY), vídeo da conferência JuliaCon 2021. Duração: 27min.
- Fons van der Plas, [🎈Pluto.jl – reactive and reproducible notebooks for Julia](https://www.youtube.com/watch?v=Rg3r3gG4nQo), vídeo de apresentação do Pluto, conferência JupyterCon 2023. Duração: 29min.
- Connor Burns, [A Guide to Building Reactive Notebooks for Scientific Computing With Julia and Pluto.jl](https://medium.com/swlh/a-guide-to-building-reactive-notebooks-for-scientific-computing-with-julia-and-pluto-jl-1a2c0c455d51), artigo de opinião, Medium, Dec. 2020.


## Sobre programação Julia:

- Jeff Bezanson, Stefan Karpinski, Viral B. Shah, Alan Edelman, [Why We Created Julia](https://julialang.org/blog/2012/02/why-we-created-julia/), Massachusetts Institute of Technology, Feb. 2012.
- Gabriel Gauci Maistre, [10 Reasons Why You Should Learn Julia](https://blog.goodaudience.com/10-reasons-why-you-should-learn-julia-d786ac29c6ca), artigo de opinião, Good Audience, Sep. 2018.
- Abel Soares Siqueira, Gustavo Sarturi, João Okimoto, Kally Chung, [Introdução à programação em Julia](https://juliaintro.github.io/JuliaIntroBR.jl/), tradução do livro de: Allen Downey, Ben Lauwens, [Think Julia: How to Think Like a Computer Scientist](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html), O’Reilly Media, 2018. 
