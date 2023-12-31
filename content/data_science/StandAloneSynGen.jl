### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> chapter = 2
#> section = 1
#> order = 1
#> title = "✏️ Alternador em regime isolado"
#> layout = "layout.jlhtml"
#> tags = ["lecture", "module3"]

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 18c20096-84c1-4ec0-bb6d-185338676ced
begin
	using PlutoUI, PlutoTeachingTools # interface, ferramentas de edição
	using Plots   						# gráficos 
	using Dierckx 						# interpolação/extrapolação de dados
end

# ╔═╡ 248787ea-0744-46de-831b-ed8854f20e18
ThreeColumn(md"`StandAloneSynGen.jl`", md"[![](https://img.shields.io/badge/GitHub_URL-notebook-C09107)](https://github.com/Ricardo-Luis/notebooks/blob/main/ME2/StandAloneSynGen.jl)", md"`Last update: 11·09·2023`")

# ╔═╡ 2caa945b-d36c-4473-900f-824e0599f140
begin
	html"""
	<style>
		main {
			margin: auto;
			max-width: 1920px;
	    	padding-left: max(100px, 10%);
	    	padding-right: max(100px, 30%);
		}
	</style>
	"""
	ChooseDisplayMode()
end;

# ╔═╡ 55e44178-ff2c-4467-b8b5-afa0d360cdcf
md"""
---
$\textbf{MÁQUINAS ELÉTRICAS SÍNCRONAS TRIFÁSICAS}$

$\text{EXERCÍCIO 1}$ 

$\textbf{Alternador síncrono de polos lisos}$

$\textbf{Análise em regime isolado}$
---
"""

# ╔═╡ 89db506b-737e-4916-a495-df388314d268
md"""
# Exercício 1. Dados:
"""

# ╔═╡ 520962f0-6513-4615-ba08-a973b851ec8f
md"""
**Um alternador síncrono trifásico, 390kVA, 1250V, 50Hz, 750rpm, ligado em
triângulo, apresenta os seguintes resultados dos ensaios em vazio e curto-circuito:**
"""

# ╔═╡ 99485bd5-46b8-425b-8974-6056c903b062
begin
	Iₑₓ = [11.5, 15.0, 20.0, 23.5, 29.0, 33.5]
	fem = [990, 1235, 1460, 1560, 1640, 1660]
	Icc = [139, 179, 242, 284, 347, 400]
	Iₑₓ, fem, Icc
end

# ╔═╡ 82ddc4f5-e411-48da-abab-cc2029ee02f0
md"""
**A resistência medida aos bornes do enrolamento do induzido é 0,144Ω. Determine:**
"""

# ╔═╡ 8da1cb6d-5f5a-49b1-9ab8-9a00d229b519
(Sₙ, Uₙ, f, n, RΩ) = (390e3, 1250, 50, 750, 0.144)

# ╔═╡ f52ee282-219a-4e7d-b1b6-faa4eff673f2


# ╔═╡ db6deedc-de66-43e6-955c-b4a949cd659f
md"""
(**Fonte:** exercício modificado do problema 9 de [^Malea2004])
"""

# ╔═╡ f3c0c91a-6728-4178-a7cd-02527d7df872


# ╔═╡ 0a44521c-58b4-47d3-968c-d345799e42bb
md"""
# a) $$R_s$$ 
**A resistência por fase do enrolamento induzido do alternador síncrono, considerando um coeficiente de correção do efeito pelicular da corrente de 1.2;**
"""

# ╔═╡ b90f442f-41aa-485b-b0f0-170e282c028c
md"""
A resistência medida aos bornes corresponde à resistência entre fases, por conseguinte, estando o estator em triângulo tém-se:
"""

# ╔═╡ 46318b60-7480-44f8-94bc-10f69a425d54
begin
	R = 3*RΩ/2
	R = round(R, digits=3)
end

# ╔═╡ 90712d40-b1a5-445e-a1da-af62ecab7e59
md"""
O efeito pelicular da corrente, faz aumentar a resistência do condutor, pois em corrente alternada, esta tende a fluir na periferia dos condutores, quanto maior for a frequência angular elétrica. A resistência do estator, $$R_s$$ vem então dado por:
"""

# ╔═╡ 638d41c0-4a34-4a30-9928-ba88507334af
begin
	Rₛ = R*1.2
	Rₛ = round(Rₛ, digits=3)
end

# ╔═╡ 9649494f-8378-459f-b079-d0566f2af8fb


# ╔═╡ b9f959bf-abc2-4cc8-9f1d-584bb4728e89
md"""
# b) Cálculo da tensão para um ponto de funcionamento
**A tensão de linha, para a corrente nominal e uma corrente de excitação de 33.5A,
considerando um factor de potência da carga de 0.9 indutivo;**
"""

# ╔═╡ 59f534f3-da67-406c-ae7f-9f3ddf13d1fe
md"""
Cálculo da corrente nonimal:
"""

# ╔═╡ 3570ce87-a57d-4abb-8477-f33957697952
begin
	Iₗ = Sₙ / (√3*Uₙ) 				# corrente de linha nominal
	Iₙ = Iₗ / (√3)	  				# corrente por fase (ligação em triângulo)
	Iₙ = round(Iₙ, digits=1)
end

# ╔═╡ 94c43668-0ddd-4550-9bca-5b05a1ede581
md"""
O ensaio de curto-circuito permite determinar a impedância equivalente da máquina. Assim, para uma corrente de excitação de 33.5A têm-se uma corrente de curto-circuito de 400A e uma força eletromotriz (FEM) correspondente de 1660V.

"""

# ╔═╡ 5e679cb2-dd7f-4cf5-8035-54ae205eba1e
md"""
Assim, partindo do esquema equivalente do alternador síncrono de pólos lisos com estator em triângulo, a impedância síncrona, $$Z_s$$, vem dada por:
"""

# ╔═╡ 5d555c37-3ea9-4315-b31f-c5ce86896160
begin
	Icc₁ = 400
	E₀ = 1660
	Zₛ = E₀ / (Icc₁/√3)
	Zₛ = round(Zₛ, digits=3)
end

# ╔═╡ 67329e1c-c84a-4a64-abdf-d086b59cee6d
begin
	Xₛ = √(Zₛ^2-Rₛ^2)
	Xₛ = round(Xₛ, digits=3)
end;

# ╔═╡ 69998624-54dc-49a6-9053-0322c72982ea
md"""
Pelo triângulo de impedâncias obtém-se a reatância síncrona, $$X_s=$$ $Xₛ Ω:
"""

# ╔═╡ a2c4ba4e-56fa-4aaa-ba4a-5b5acb3cb2d8
md"""
Cálculos auxiliares:
"""

# ╔═╡ ccec9d74-f4aa-4254-89a1-f99e2e1cf653
begin
	cosφ = 0.9 #fator de potência considerado
	φ = -acos(cosφ)
	θ = atan(Xₛ/Rₛ)
end;

# ╔═╡ 7df06422-db2c-4494-97c1-6ed2a1bc77eb
md"""
O cálculo da tensão, $$U$$, corresponde à resolução da equação vetorial por fase:
"""

# ╔═╡ 87bf1d67-5f81-496e-a6ee-821b3f3eb1b0
md"""
$$\overline{E}_0=\overline{U}+(R_s+jX_s)\overline{I}$$

em que: $$\quad R_s+jX_s=Z_s∠\theta\:$$, sendo: $$\quad Z_s=\sqrt{R_s^{2}+X_s^{2}}\quad$$ e $$\quad \theta=\arctan \frac{X_s}{R_s}$$
"""

# ╔═╡ 2385f6d9-1770-4fee-a7ab-3322f2d6e9ed
begin
	sinδ = (Zₛ/E₀) * Iₙ * sin(θ+φ)
	δ = asin(sinδ)
	U = E₀ * cos(δ) - Zₛ*Iₙ*cos(θ+φ)
	U = round(U, digits=1)
	δ = rad2deg(δ)					#δ: ângulo de carga, em graus
	δ = round(δ, digits=2)
	U, δ 
end

# ╔═╡ ce99f675-29ac-4413-94a9-febe1243e79d
md"""
Assim, a equação vetorial de $$\overline{E}_0$$ vem dada por:

$$E_0∠\delta=U∠0°+(Z_s∠\theta)(I∠\varphi)$$

Na equação vetorial acima desconhecem-se o ângulo de carga, $$\delta$$, e a tensão, $$U$$. Decompondo a equação vetorial nas suas coordenadas ortogonais (projeções dos vetores nos eixos real e imaginário), tém-se:

$$\begin{cases}
E_0\cos\delta=U+Z_sI\cos(\theta+\varphi)\\
E_0\sin\delta=Z_sI\sin(\theta+\varphi)\\
\end{cases}$$

Resolvendo, obtêm-se: $$\delta=$$ $δ ° e $$U=$$ $U V.
"""

# ╔═╡ e3a3c2f7-43f5-40ab-8693-9affc1130373


# ╔═╡ ff08e1d0-6acd-4b46-ab75-51329cb00c22
md"""
## Diagrama vetorial de tensões
"""

# ╔═╡ 57790c82-9d40-4244-8b5d-3fcf98ce12e7
md"""
Complementarmente, uma vez determinados os fasores da equação vetorial de $$\overline{E}_0$$ procede-se à representação do diagrama vetorial de tensões no plano complexo:
"""

# ╔═╡ 6d73fbfe-0cf7-4925-a814-c42438e75fe0


# ╔═╡ 96d3e48e-60bc-4c97-aac4-6517502fa936
md"""
## 💻 Efeito da corrente de carga e do fator de potência
"""

# ╔═╡ f68a29b1-64c3-466b-987b-0c66b8385af3
md"""
 $$I(\rm A):$$ $(@bind I₂ PlutoUI.Slider(0:1:1.4*Iₙ, default=Iₙ,show_value=true))
$$\quad\quad\quad \varphi(°) \to \cos \varphi$$ $(@bind phi₂ PlutoUI.Slider(-90:1:90, default=-30, show_value=true))
"""

# ╔═╡ e934fad8-c4fe-4e7f-bc64-e1c3f3e52460
md"""
!!! nota
	O estudante deverá procurar perceber as implicações no valor da tensão de saída, $$U$$, de um alternador em regime isolado, quando o valor de corrente, $$I$$, é alterado e/ou o seu fator de potência, $$\cos \varphi$$.
"""

# ╔═╡ d3581eff-e1c7-4e01-b722-3d94ff428746


# ╔═╡ 14df28f1-6cb0-4e18-b5f0-4c8f94d02a56
md"""
## Determinação de $$X_s$$ para diversos valores de $$I_{exc}$$
"""

# ╔═╡ 76b147a2-d33f-49ef-8236-444818042a12
md"""
O mesmo exercício poderia ser repetido para diferentes valores da corrente de campo. Note-se que a impedância e por conseguinte, a reatância síncrona da máquina variam em função do estado de magnetização da máquina.  

Aqui mostra-se o exemplo de cáculo da reatância síncrona, $$X_s$$, para variações sucessivas de $$2$$A na corrente de campo:
"""

# ╔═╡ f50dc850-e32d-4fb3-afd2-0217cf8df1fc
# Função de interpolação para a característica magnética:
E₀_i = Spline1D(Iₑₓ, fem);

# ╔═╡ 2dd82e2e-675f-40dd-882f-fe90db117589
# Função de interpolação da característica de curto-circuito:
Icc_i = Spline1D(Iₑₓ, Icc);

# ╔═╡ b350ee3d-7705-4712-a9bd-d16d4a83f89b
begin
	iₑₓ = 11.5:2:33.5
	E₀_iₑₓ₁ = E₀_i(iₑₓ)			# interpolação da característica magnética
	Icc_iₑₓ₁ = Icc_i(iₑₓ)     	# interpolação da característica de curto-circuito
	
	# Cálulo de Xs=f(Iex):
	Zₛ_iₑₓ₁ = E₀_iₑₓ₁./(Icc_iₑₓ₁/√3)
	Xₛ_iₑₓ₁ = .√(Zₛ_iₑₓ₁.^2 .-Rₛ^2)
	Xₛ_iₑₓ₁ = round.(Xₛ_iₑₓ₁, digits=3)
	
	# Representação gráfica de Xs:
	plot(iₑₓ, Xₛ_iₑₓ₁, xlims=(0,35),
		title="Xₛ=f(Iₑₓ)", xlabel = "Iₑₓ (A)", ylabel="Xₛ (Ω)", label=:none)
end

# ╔═╡ cd338db8-8a5b-4ebf-a93d-95b1a7433de7


# ╔═╡ ba2a8447-a8a0-4ce8-9d53-03a0369703c6
md"""
# c) Características externas
**A característica exterior do alternador síncrono trifásico, com uma corrente de excitação de 33.5A, para um fator de potência 0.9 indutivo, unitário e 0.9 capacitivo;**
"""

# ╔═╡ 8a1756c9-6d37-4541-ba8d-586e95b4feda
md"""
Para uma corrente de excitação de 33.5A, a FEM apresenta o valor de 1660V, como verificado na alínea anterior. 
"""

# ╔═╡ 9238a818-157c-4523-b6b2-139faf8ebe44
md"""
A determinação da característica externa deste alternador de polos lisos, $$U=f(I)$$ com corrente de campo e velocidade constantes,  corresponde à resolução da equação vetorial de $$\overline{E}_0$$ fazendo variar a corrente de carga, $$I$$, para um determinado fator de potência, $$\cos\varphi$$, imposto pela carga. 
"""

# ╔═╡ c53c93f9-1960-4999-a3d8-ec0c654f4275
md"""
É aqui que se tira verdadeiro partido de uma linguagem de computação científica na realização de cálculos sucessivos. Tal também é possível, recorrendo a folha de cálculo, como *MS Excel* ou *Google Sheets*, mas envolvendo algum trabalho suplementar devido à utilização de números complexos.
"""

# ╔═╡ 58011f3c-364f-42b7-a9de-17fe736f80d1
md"""
Determinação da característica externa para $$\cos\varphi=0,9(i)$$:
"""

# ╔═╡ 894c1642-9272-4624-b7a3-c8a882fbc337
begin
	I₃ = 0:1:1.5*Iₙ
	cosφ₃ = 0.9
	φ₃ = -acos(cosφ₃)
	δ₃ = asin.((Zₛ/E₀).*I₃*sin(θ+φ₃))  		# δ: ângulo de carga, radianos
	U₃ = E₀*cos.(δ₃) - Zₛ.*I₃*cos(θ+φ₃)	 	# cálculo da característica externa
end;

# ╔═╡ 079234a4-3aa6-4932-8a25-2a8c8f290368
md"""
Determinação da característica externa para $$\cos\varphi=1$$:
"""

# ╔═╡ 373a9233-e5d1-4c18-a1aa-162f3a1a00be
begin
	δ₄ = asin.((Zₛ/E₀).*I₃*sin(θ+0))  		# δ: ângulo de carga, radianos
	U₄ = E₀*cos.(δ₃) - Zₛ.*I₃*cos(θ+0) 		# cálculo da característica externa
end;

# ╔═╡ b2a13c34-84be-4c7d-bcd8-9186a4975559
md"""
Determinação da característica externa para $$\cos\varphi=0,9(c)$$:
"""

# ╔═╡ fee556d9-aa55-4187-b83c-afa2173e2adb
begin
	cosφ₅ = 0.9
	φ₅ = acos(cosφ₅)
	δ₅ = asin.((Zₛ/E₀).*I₃*sin(θ+φ₅))  		# δ: ângulo de carga, radianos
	U₅ = E₀*cos.(δ₃) - Zₛ.*I₃*cos(θ+φ₅)	 	# cálculo da característica externa
end;

# ╔═╡ 1daacb53-b03f-476d-9ab0-c1dc59356147
begin
	plot(I₃, U₃, 
		title="U =f(I)", xlabel="I(A)", ylabel="U(V)", label="cosφ=0.9(i)",
		ylims=(0,2000), framestyle=:origin, minorticks=5, legend=:bottomleft)
	plot!(I₃, U₄, label="cosφ=1")
	plot!(I₃, U₅, label="cosφ=0.9(c)")
end

# ╔═╡ 889e92f2-9104-4206-8e2e-785fc750a2c2


# ╔═╡ 33bd0f07-6c4c-4e1b-bad1-719871b4e56e
md"""
## 💻 Caract. de regulação, $$I_{exc}=f(I)$$, para um dado $$\cos\varphi$$
"""

# ╔═╡ 1e30acf6-44bd-4caa-a461-ec358da607ea
md"""
A análise dos efeitos da corrente de carga e do fator de potência, quer no diagrama vetorial de tensões do alternador síncrono de pólos lisos, quer nas características externas para diferentes $$\cos\varphi$$, permite antever a necessidade de se regular a corrente de campo, $$I_{exc}$$, regulando o fluxo magnético, e por conseguinte, a FEM, $$E_0$$, de modo a manter a tensão de saída do alternador síncrono, $$U$$, constante para qualquer carga.
"""

# ╔═╡ 1dc1c2e2-11e6-4d30-ac49-4797117a5dae
md"""
Tome-se, por exemplo, a corrente de campo em vazio de $$20$$A:
"""

# ╔═╡ 81223b60-4ca2-445e-9ce6-23261cd0e525
begin
	Iₑₓ₀ = 20
	U₀ = E₀_i(Iₑₓ₀)				# interpolação da característica magnética
	Icc_iₑₓ₀ = Icc_i(Iₑₓ₀) 		# interpolação da característica de curto-circuito
	Zₛ₀ = U₀ / (Icc_iₑₓ₀/√3) 	# cálculo de Zₛ em função da corrente de campo
	Xₛ₀ = √(Zₛ₀^2-Rₛ^2)	  		# cálculo de Xₛ em função da corrente de campo
	θ₀ = atan(Xₛ₀/Rₛ)
	Iₑₓ₀, U₀, Icc_iₑₓ₀, Xₛ₀   
end

# ╔═╡ 8436976e-60cb-4904-aeb3-c9c65562a7a6
md"""
A resolução da equação vetorial de $$\overline{E}_0$$, dada por:

$$\overline{E}_0=\overline{U}+(R_s+jX_s)\overline{I}$$

permite determinar o valor da FEM, $$E_0$$, e por consulta da característica magnética, obter a corrente de campo necessária para manter a tensão, $$U$$, constante em função da carga, $$I$$, e do fator de potência, $$\cos\varphi$$. 

Note-se, que o cálculo exato desta equação vetorial apenas é possível recorrendo a métodos de cálculo númerico iterativos (método de Euler, Runge–Kutta, entre outros), pois a reatância síncrona, $$X_s$$, depende da solução final (corrente de campo).

Por simplificação na análise, admite-se que os efeitos da variação, quer da corrente de carga, quer do fator de potência, são mais significativos que a dependência $$X_s=f(I_{exc})$$, permitindo assim um cálculo aproximado, apresentado no gráfico de característica de regulação:
"""

# ╔═╡ 95aedd7b-68fd-49fc-aa2d-ef5852d20c72
md"""
 $$\varphi(°) \to \cos \varphi$$  $(@bind phi₇ PlutoUI.Slider(-90:1:90, default=60, show_value=true))
"""

# ╔═╡ c6f94497-b544-417f-a479-f6558be1edc7


# ╔═╡ 3f3ef7e6-095f-4b87-8dd4-cb98cce33f9a
md"""
## 💻 Efeitos de $$I_{exc}$$ e cosφ em $$U=f(I)$$
"""

# ╔═╡ 7ed35606-3e63-43a8-b946-5bd7679d534a
md"""
A corrente de campo, $$I_{exc}$$, afeta a FEM e também o valor da reatância síncrona, em especial se a máquina estiver a funcionar na zona de saturação da característica magnética:
"""

# ╔═╡ 42845857-b6d5-415f-abb8-072977e8c3db
md"""
 $$I_{exc}(\rm A)$$ $(@bind Iexc PlutoUI.Slider(11.5:0.5:33.5, default=33.5,show_value=true)) $$\quad\quad\quad \varphi(°) \to \cos\varphi$$ $(@bind phi₆ PlutoUI.Slider(-90:1:90, default=30, show_value=true))
"""

# ╔═╡ 8f85182b-136d-42f2-b900-d234f2d52739
begin
	E₀_iₑₓ = E₀_i(Iexc) 			# interpolação da caract. magnética para Iexc
	Icc_iₑₓ = Icc_i(Iexc) 			# interpolação da caract. de c.c. para Iexc
	Zₛ_iₑₓ = E₀_iₑₓ/(Icc_iₑₓ/√3) 	# cálculo de Zₛ em função da corrente de campo
	Xₛ_iₑₓ = √(Zₛ_iₑₓ^2-Rₛ^2)	  	# cálculo de Xₛ em função da corrente de campo
	Xₛ_iₑₓ = round(Xₛ_iₑₓ, digits=3)
	Iexc, E₀_iₑₓ, Icc_iₑₓ, Xₛ_iₑₓ
end

# ╔═╡ cb82f279-22e4-4c36-bf5a-32b10aea7606
begin
	φ₆ = deg2rad(phi₆)
	θ₆ = atan(Xₛ_iₑₓ/Rₛ)
	δ₆ = asin.((Zₛ_iₑₓ/E₀_iₑₓ).*I₃*sin(θ₆+φ₆))
	U₆ = E₀_iₑₓ*cos.(δ₆) - Zₛ_iₑₓ.*I₃*cos(θ₆+φ₆)
	plot(I₃, U₆, 
		title="U =f(I)", xlabel = "I(A)", ylabel="U(V)", 
		ylims=(0,3000), xlims=(0,160), 
		framestyle=:origin, minorticks=5, legend=:none)
end

# ╔═╡ 8a70bab4-014b-4f85-9ecb-821f9c4ed204
md"""
!!! nota
	O estudante deverá procurar perceber as implicações qualitativas das variações da corrente de campo, $$I_{exc}$$, e do factor de potência, $$\cos \varphi$$, na característica externa de um alternador síncrono.
"""

# ╔═╡ b7d03e6c-bb80-48ee-8df4-2cac6fc3e983


# ╔═╡ fae8d4d5-a0bd-4000-94d0-e030d9ee723e
md"""
# d) Cálulo da corrente de excitação para uma dada carga
**A corrente de excitação o alternador para alimentar um motor assíncrono trifásico a uma tensão de 1kV, sabendo que o motor desenvolve uma potência de 150kW com um fator de potência de 0.832 e um rendimento de 90%.**

**Nota:** Admita que a impedância síncrona, $$Z_s$$, é igual à obtida da alínea anterior.
"""

# ╔═╡ 39b0c0d9-05e1-43eb-97e2-0ab169f9a2b0


# ╔═╡ cadba82d-785a-4306-9407-d65eca10c2b3
md"""
Considerando desprezáveis as perdas rotacionais no motor assíncrono, $$p_{rot}=0 \Rightarrow P_u=P_d$$, por conseguinte, a corrente na linha vem:

$$I_L=\frac{P_u}{η\sqrt{3} U_c \cos\varphi}$$
os vetores da corrente e da tensão por fase do alternador (estator em triângulo) vêm dados por:
$$\overline{I}=\frac{I_L}{\sqrt{3}}∠φ \quad$$ e $$\quad \overline{U}=U_c∠0°$$
"""

# ╔═╡ db9572b9-50ea-438d-a82d-6befe3aa8d59


# ╔═╡ b4c5bcd1-830b-49d5-ad25-df89de14d59a
md"""
# Bibliografia
"""

# ╔═╡ a66b3097-edb2-40e2-affa-071ea2ebb82f
md"""
[^Malea2004]:  Malea, J.M., Balaguer, E.F., Problemas resueltos de máquinas eléctricas rotativas, Publicações da Universidade de Jaume I, Espanha, 2004.
"""

# ╔═╡ bb7446cf-a972-4f68-83d6-07bc19ebc93d


# ╔═╡ 6a1038a4-81c8-450b-a91e-d0018570b760
md"""
# 📌 Números complexos em computação científica `Julia` 
"""

# ╔═╡ 7279e904-53dc-47dc-9cfd-05ca94824c31
md"""
## Fasores (notação polar): $$∠$$  
"""

# ╔═╡ 8829fefc-cd9f-47b7-9425-15cf584ebfc5
md"""
Em programação `Julia` os números complexos são apresentados na forma retangular, como por exemplo: `2+3im`, sendo `im` a representação da unidade imaginária, ou seja:  
"""

# ╔═╡ 06fef836-2c59-46d7-98dc-4b8846dab554
√(-1 + 0im) 	# para o símbolo de raíz quadrada "√", escrever: \sqrt + tecla [TAB]

# ╔═╡ 87846a7a-3926-42e0-a547-0c934ab4da25
2+3im - 3+2im

# ╔═╡ f95adced-2cf0-41c6-9448-789ca40f195b
md"""
Em engenharia eletrotécnica é usual utilizar `j` para designar a unidade imaginária. Assim pode-se redifinir:
"""

# ╔═╡ b1ced633-5f0c-4333-9788-e858cf5e0f3f
j = Base.im 		 # unidade imaginária definida na biblioteca de base do Julia

# alternativa:
# j(x) = (x)*im   # pode-se definir uma função j(x), sendo x a quantidade imaginária, mas a mesma tem de ficar entre parênteses.

# ╔═╡ 8dad7471-4cbb-4f36-a692-7dc05f7c4fcc
md"""
Por outro lado, a utilização de fasores, ou seja, a representação de números complexos na forma polar, através do símbolo `∠` para a designação do ângulo do vetor, é também comummente utilizada em eletrotecnia, não sendo uma forma nativa na linguagem `Julia` para designar números complexos.

No entanto, em `Julia` é possível atribuir a símbolos, valores ou funções. Assim, ao símbolo `∠` atribuí-se a forma polar de um número complexo na forma `módulo∠(argumento)` com o `argumento` em graus, utilizando a seguinte instrução:
"""

# ╔═╡ 2702f2c6-c0ab-4be9-a6ec-03b970994432
∠(θ) = cis(deg2rad(θ))   # para fazer o símbolo "∠", escrever: \angle + tecla [TAB]

# ╔═╡ ae01b249-cb76-43ae-9938-f489b93cc0ea
begin
	φ₁ = rad2deg(φ)
	φ₁ = round(φ₁, digits=3)
	K = 8 					# fator de escala da corrente
	I⃗ₙ = (K*Iₙ)∠(φ₁)
	U⃗ = (U)∠(0)
	RₛI⃗ₙ = (Rₛ*Iₙ)∠(φ₁)
	jXₛI⃗ₙ = (Xₛ*Iₙ)∠(φ₁+90)
	E⃗₀ = (E₀)∠(δ)
	
	plot([0, U⃗], arrow=:closed, legend=:topleft, label="U∠0°")
	
	plot!([0, I⃗ₙ], arrow=:closed, label="Iₙ∠φ")
	
	plot!([U⃗, U⃗+RₛI⃗ₙ], arrow=:closed, label="RₛIₙ∠φ")
	
	plot!([U⃗+RₛI⃗ₙ, U⃗+RₛI⃗ₙ+jXₛI⃗ₙ], arrow=:closed, label="XₛIₙ∠(φ+90°)")
	
	plot!([0, E⃗₀], arrow=:closed, label="E₀∠δ",
		  minorticks=5, ylims=(-1000,1000), xlims=(0,2000), size=(600,600))
end

# ╔═╡ 4287947f-5fcc-4400-b4ea-7ddb29d259cf
begin
	φ₂ = deg2rad(phi₂)
	sinδ₂ = (Zₛ/E₀)*I₂*sin(θ+φ₂)
	δ₂ = asin(sinδ₂)
	U₂ = E₀*cos(δ₂) - Zₛ*I₂*cos(θ+φ₂)
	δ₂ = rad2deg(δ₂)
	φ₂ = rad2deg(φ₂)
	I⃗₂ = (K*I₂)∠(φ₂)
	U⃗₂ = (U₂)∠(0)
	RₛI⃗₂ = (Rₛ*I₂)∠(φ₂)
	jXₛI⃗₂ = (Xₛ*I₂)∠(φ₂+90)
	E⃗₀₂ = (E₀)∠(δ₂)
	
	plot([0, U⃗₂], arrow=:closed, legend=:bottomright, label="U∠0°", linewidth=2)
	
	plot!([0, I⃗₂], arrow=:closed, label="I∠φ", linewidth=2)
	
	plot!([U⃗₂, U⃗₂+RₛI⃗₂], arrow=:closed, label="RₛI∠φ", linewidth=2)
	
	plot!([U⃗₂+RₛI⃗₂, U⃗₂+RₛI⃗₂+jXₛI⃗₂], arrow=:closed, label="XₛI∠(φ+90°)", linewidth=2)
	
	plot!([0, E⃗₀₂], arrow=:closed,minorticks=5, label="E₀∠δ", linewidth=2,
		  ylims=(-1500,1500), xlims=(0,3000), size=(600,600))
	
	# lugar geométrico da FEM
	δ_locus = -5:1:90
	E⃗₀_locus = (E₀)∠.(δ_locus)
	
	plot!(E⃗₀_locus, linestyle=:dash, label="locus de E₀∠δ")
	
	
	# lugar geométrico de I
	
	φ_locus = -90:1:90
	I⃗₂_locus = (K*I₂)∠.(φ_locus)
	
	plot!(I⃗₂_locus, linestyle=:dash, label="locus de I∠φ")
end

# ╔═╡ c95b31b8-bfad-47d5-a5c8-bfb5340f76e3
begin
	φ₇=deg2rad(phi₇)
	I₃_=(I₃)∠(φ₇)
	#E₀₇_=(U₀)∠(0).+(Rₛ+(Xₛ₀)im).*I₃_        # opção 1: algo não está correcto...
	#E₀₇_=(U₀)∠(0).+((Zₛ₀)∠(θ₀)).*I₃_        # opção 2: pior ainda...
	#E₀₇=abs.(E₀₇_)                          # faz parte das opções 1 e2
	
	# opção 3: passando o cálculo vectorial para escalar, determinando 1º (tan δ) para depois determinar E₀:
	tanδ₇=(Zₛ₀.*I₃*sin(θ₀+φ₇))./(U₀.+Zₛ₀.*I₃*cos(θ₀+φ₇))  
	δ₇=atan.(tanδ₇)
	if δ₇==0
		E₀₇=(U₀+Zₛ₀.*I₃*cos(θ₀+φ₇))
		else
		E₀₇=Zₛ₀.*I₃*sin(θ₀+φ₇)./sin.(δ₇)
		end
	
	# interpolação da característica magnética para E₀:
	i_E₀=Spline1D(fem, Iₑₓ, k=1, bc="extrapolate")	
	iₑₓ_E₀=i_E₀(E₀₇)
	
	# traçado da caracterítica de regulação:
	plot(I₃, iₑₓ_E₀, 
		title="Iₑₓ =f(I)",
		xlabel = "I(A)", ylabel="Iₑₓ(A)", 
		ylims=(0,40), xlims=(0,110), 
		framestyle=:origin, minorticks=5, legend=:none)
end

# ╔═╡ 1645c653-c4e6-45af-969c-440981b30bd0
begin
	(Pu, cosφₘ, η, Uₘ) = (150e3, 0.832, 0.9, 1e3)  #dados da alínea d)
	Iₗᵢₙₕₐ = Pu / (η*√3*Uₘ*cosφₘ)
	φₘ = -acos(cosφₘ)
	φₘ = rad2deg(φₘ)
	E⃗₀ₘ = (Uₘ)∠(0) + (Rₛ+Xₛ*im)*((Iₗᵢₙₕₐ/√3)∠(φₘ))
	E₀ₘ = abs(E⃗₀ₘ)								# módulo do vetor da FEM
	
	# interpolação da característica magnética para a FEM calculada:
	iₑₓ_E₀ₘ = i_E₀(E₀ₘ)
	iₑₓ_E₀ₘ = round(iₑₓ_E₀ₘ, digits=1)
end;

# ╔═╡ 94260acb-1a29-4de8-b46e-a1c440460847
md"""
Calculando a FEM por resolução da equação vetorial de $$\overline{E}_0$$, obtém-se a corrente de campo, $$I_{exc}$$, consultando a característica magnética do alternador, obtendo-se, $$I_{exc}=$$ $iₑₓ_E₀ₘ A
"""

# ╔═╡ adde59ee-56ad-4761-a0ca-784df430c824
md"""
A função `cis` corresponde à [Fórmula de Euler](https://pt.wikipedia.org/wiki/F%C3%B3rmula_de_Euler): $\quad e^{j\theta}=\cos\theta+j\sin\theta\quad$ aplicada à análise de números complexos.
"""

# ╔═╡ 2c052f02-7797-4b3e-ade2-1ffd38119bef
md"""
Assim, torna-se possível a representação de fasores.
Exemplos:
"""

# ╔═╡ 6f871dfe-8c9e-48f4-88b1-2f581d997f95
begin
	I⃗ = 24∠(60)					# para representar o símbolo de vetor: \vec + [TAB]
	I⃗ = round(I⃗, digits=1)
end

# ╔═╡ a4a8c395-ffde-46f1-997c-e92fd74e2e65
begin
	I⃗ₐ = 10∠(-45);
	Iₐ = abs(I⃗ₐ)			
	ϕₐ = angle(I⃗ₐ)
	ϕₐ = rad2deg(ϕₐ)
	I⃗ₐ, Iₐ, ϕₐ
end

# ╔═╡ 228a010d-2ddb-4766-a2b7-84e8783378b6


# ╔═╡ 872c685b-fdbb-48d9-8e96-7982a7ca1faa
md"""
## Funções trigonométricas
"""

# ╔═╡ 865f7200-9032-49c2-a31c-b717c8d44607
md"""
As funções trigonométricas em `Julia` são executadas seguindo o Sistema Internacional de Unidades, por conseguinte, os ângulos vêm na unidade radiano:
"""

# ╔═╡ 553a05a9-904a-454b-b4be-0049dcd2d04d
cosϕ₁ = 0.8

# ╔═╡ 59117354-7977-4a2d-8869-a91f7f3ae102
ϕ₁ = acos(cosϕ₁)*180/π

# ╔═╡ 390c6eb7-4013-413c-921a-bfec6b3d2728
md"""
ou alternativamente utilizando a instrução: `rad2deg`:
"""

# ╔═╡ 4f6d7663-987e-4a44-ab21-f772ae2add74
begin
	cosϕ₂ = 0.8 
	ϕ₂ = acos(cosϕ₂)
	ϕ₂ = rad2deg(ϕ₂)
end

# ╔═╡ 2c8d6083-a00e-4dba-8dfb-82d02ead0d44
md"""
O mesmo raciocínio aplica-se a outras funções trigonométricas: `sin`, `asin`, `tan`, `atan`, ...
"""

# ╔═╡ 5082e227-dc30-41ee-8010-bcacafd522a0


# ╔═╡ a0f9fb43-765a-46c6-b1fc-dc0805d4ebc1
md"""
## Plano de Argand
"""

# ╔═╡ de1ba39b-e455-4639-b619-f6c628af8a3e
md"""
A biblioteca `Julia`, [`Plots`](http://docs.juliaplots.org/latest/), que tem sido utilizada nos diversos *notebooks* para realização de gráficos, reconhece nativamente números complexos, representando-os num plano de Argand, também conhecido como plano complexo.

Assim, a utilização do plano de Argand para representação gráfica de grandezas vetoriais é realizado indicando cada vetor por um segmento de reta na forma `[origem, destino]`, em que a `origem` e `destino` são números complexos (em qualquer das suas formas: retangular, polar ou exponencial). A instrução `arrow` permite colocar o afixo do número complexo do lado desejado:
"""

# ╔═╡ 7544f034-d014-484d-90f5-9d6b4c842858
begin
	Kₐ = 1 # factor de escala para a corrente
	plot([0, Kₐ*I⃗ₐ], arrow=:closed, label="I⃗ₐ")
	plot!([0, 40∠(0)], arrow=:closed, label="U∠0°", legend=:bottomright,
		 #size=(500,500), ylims=(-40,10), xlims=(0,50) # Correcção das dimensões
	)
end

# ╔═╡ 249d4cdb-a1dd-4314-9799-63332d8b6da4


# ╔═╡ 65f2c812-bf9f-4909-8032-90e683b6a1bc
md"""
# *Notebook*
"""

# ╔═╡ 319dce21-8655-4f72-8b8d-1f5f934416b5
md"""
Documentação das bibliotecas `Julia` utilizadas:  [Dierckx](https://github.com/kbarbary/Dierckx.jl), [Plots](http://docs.juliaplots.org/latest/), [PlutoUI](https://juliahub.com/docs/PlutoUI/abXFp/0.7.6/).
"""

# ╔═╡ cb63050b-07c0-46ba-8b88-be17aeef96ac
begin
	# other stuff:
	isel_logo="https://www.isel.pt/sites/default/files/NoPath%20-%20Copy%402x_0.png"
	julia_logo="https://github.com/JuliaLang/julia-logo-graphics/blob/master/images/julia-logo-color.png?raw=true"
	version=VERSION
end;

# ╔═╡ d9457e47-a4f6-4682-ba9d-c2d86b69ae2e
ThreeColumn(md"$(Resource(isel_logo, :height => 75))", md"
$\textbf{\color{green}{Lic. em Engenharia Eletrotécnica }}$", md"$\text{ Máquinas Elétricas II}$")

# ╔═╡ f7ed2338-584e-4c61-bc3c-0f307b272fc0
md"""
*Notebook* realizado em linguagem de computação científica `Julia` versão $(version).

**_Time to first plot_**: até cerca de 1.2 min.

**Computador**: Intel® Core™ i7-7600U CPU @ 2.80GHz; 24GB RAM.
"""

# ╔═╡ 52b53482-b8e2-469f-b85a-ae06d52b66a0
md"""
!!! info
	O tópico assinado com "📌" deve ser analisado previamente para melhor compreensão dos códigos em linguagem de programação científica Julia apresentados no *notebook*.
	
	No índice deste *notebook*, os tópicos assinalados com "💻" requerem a participação do estudante.
"""

# ╔═╡ 88b36341-02ed-4043-8a9f-672340bf194f
TableOfContents(title="Índice")

# ╔═╡ 1b656b2d-5a62-44db-bb69-eeafd15f1510
md"""
---
"""

# ╔═╡ 15984de3-1e84-41c9-8193-5fa3a4cb9f1c
ThreeColumn(md"Text content: [![](https://i.creativecommons.org/l/by-sa/4.0/80x15.png)](http://creativecommons.org/licenses/by-sa/4.0/)", md"`Julia code`: [`MIT License`](https://www.tldrlegal.com/license/mit-license)", md" $$©$$ [`2023 Ricardo Luís`](https://ricardo-luis.github.io/lee-me2/)")

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Dierckx = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
Dierckx = "~0.5.3"
Plots = "~1.39.0"
PlutoTeachingTools = "~0.2.13"
PlutoUI = "~0.7.52"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.9.3"
manifest_format = "2.0"
project_hash = "66a0ce8179a1d8427232913359683f312482ff8a"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "91bd53c39b9cbfb5ef4b015e8b582d344532bd0a"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.2.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.BitFlags]]
git-tree-sha1 = "43b1a4a8f797c1cddadf60499a8a077d4af2cd2d"
uuid = "d1d4a3ce-64b1-5f1a-9ba4-7e7e69966f35"
version = "0.1.7"

[[deps.Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[deps.Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "CompilerSupportLibraries_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "4b859a208b2397a7a623a03449e4636bdb17bcf2"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+1"

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "a1296f0fe01a4c3f9bf0dc2934efbf4416f5db31"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.3.4"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "02aa26a4cf76381be7f66e020a3eddeb27b0a092"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.2"

[[deps.ColorSchemes]]
deps = ["ColorTypes", "ColorVectorSpace", "Colors", "FixedPointNumbers", "PrecompileTools", "Random"]
git-tree-sha1 = "d9a8f86737b665e15a9641ecbac64deef9ce6724"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.23.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.ColorVectorSpace]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "Requires", "Statistics", "TensorCore"]
git-tree-sha1 = "a1f44953f2382ebb937d60dafbe2deea4bd23249"
uuid = "c3611d14-8923-5661-9e6a-0046d554d3a4"
version = "0.10.0"

    [deps.ColorVectorSpace.extensions]
    SpecialFunctionsExt = "SpecialFunctions"

    [deps.ColorVectorSpace.weakdeps]
    SpecialFunctions = "276daf66-3868-5448-9aa4-cd146d93841b"

[[deps.Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "fc08e5930ee9a4e03f84bfb5211cb54e7769758a"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.10"

[[deps.Compat]]
deps = ["UUIDs"]
git-tree-sha1 = "e460f044ca8b99be31d35fe54fc33a5c33dd8ed7"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "4.9.0"
weakdeps = ["Dates", "LinearAlgebra"]

    [deps.Compat.extensions]
    CompatLinearAlgebraExt = "LinearAlgebra"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.5+0"

[[deps.ConcurrentUtilities]]
deps = ["Serialization", "Sockets"]
git-tree-sha1 = "5372dbbf8f0bdb8c700db5367132925c0771ef7e"
uuid = "f0e56b4a-5159-44fe-b623-3e5288b988bb"
version = "2.2.1"

[[deps.Contour]]
git-tree-sha1 = "d05d9e7b7aedff4e5b51a029dced05cfb6125781"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.6.2"

[[deps.DataAPI]]
git-tree-sha1 = "8da84edb865b0b5b0100c0666a9bc9a0b71c553c"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.15.0"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "3dbd312d370723b6bb43ba9d02fc36abade4518d"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.15"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
git-tree-sha1 = "9e2f36d3c96a820c678f2f1f1782582fcf685bae"
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"
version = "1.9.1"

[[deps.Dierckx]]
deps = ["Dierckx_jll"]
git-tree-sha1 = "d1ea9f433781bb6ff504f7d3cb70c4782c504a3a"
uuid = "39dd38d3-220a-591b-8e3c-4c3a8c710a94"
version = "0.5.3"

[[deps.Dierckx_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6596b96fe1caff3db36415eeb6e9d3b50bfe40ee"
uuid = "cd4c43a9-7502-52ba-aa6d-59fb2a88580b"
version = "0.1.0+0"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "2fb1e02f2b635d0845df5d7c167fec4dd739b00d"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.9.3"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.ExceptionUnwrapping]]
deps = ["Test"]
git-tree-sha1 = "e90caa41f5a86296e014e148ee061bd6c3edec96"
uuid = "460bff9d-24e4-43bc-9d9f-a8973cb893f4"
version = "0.1.9"

[[deps.Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "4558ab818dcceaab612d1bb8c19cee87eda2b83c"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.5.0+0"

[[deps.FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[deps.FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "PCRE2_jll", "Pkg", "Zlib_jll", "libaom_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "74faea50c1d007c85837327f6775bea60b5492dd"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.2+2"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Zlib_jll"]
git-tree-sha1 = "d8db6a5a2fe1381c1ea4ef2cab7c69c2de7f9ea0"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.13.1+0"

[[deps.FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[deps.GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "d972031d28c8c8d9d7b41a536ad7bb0c2579caca"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.8+0"

[[deps.GR]]
deps = ["Artifacts", "Base64", "DelimitedFiles", "Downloads", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Preferences", "Printf", "Random", "Serialization", "Sockets", "TOML", "Tar", "Test", "UUIDs", "p7zip_jll"]
git-tree-sha1 = "d73afa4a2bb9de56077242d98cf763074ab9a970"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.72.9"

[[deps.GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "FreeType2_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Qt6Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "1596bab77f4f073a14c62424283e7ebff3072eca"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.72.9+1"

[[deps.Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[deps.Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE2_jll", "Zlib_jll"]
git-tree-sha1 = "e94c92c7bf4819685eb80186d51c43e71d4afa17"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.76.5+0"

[[deps.Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[deps.Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[deps.HTTP]]
deps = ["Base64", "CodecZlib", "ConcurrentUtilities", "Dates", "ExceptionUnwrapping", "Logging", "LoggingExtras", "MbedTLS", "NetworkOptions", "OpenSSL", "Random", "SimpleBufferStream", "Sockets", "URIs", "UUIDs"]
git-tree-sha1 = "19e974eced1768fb46fd6020171f2cec06b1edb5"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "1.9.15"

[[deps.HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "129acf094d168394e80ee1dc4bc06ec835e510a3"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+1"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "d75853a0bdbfb1ac815478bacd89cd27b550ace6"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.3"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.IrrationalConstants]]
git-tree-sha1 = "630b497eafcc20001bba38a4651b327dcfc491d2"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.2.2"

[[deps.JLFzf]]
deps = ["Pipe", "REPL", "Random", "fzf_jll"]
git-tree-sha1 = "f377670cda23b6b7c1c0b3893e37451c5c1a2185"
uuid = "1019f520-868f-41f5-a6de-eb00f4b6a39c"
version = "0.1.5"

[[deps.JLLWrappers]]
deps = ["Artifacts", "Preferences"]
git-tree-sha1 = "7e5d6779a1e09a36db2a7b6cff50942a0a7d0fca"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.5.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "31e996f0a15c7b280ba9f76636b3ff9e2ae58c9a"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.4"

[[deps.JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6f2675ef130a300a112286de91973805fcc5ffbc"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.91+0"

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "81dc6aefcbe7421bd62cb6ca0e700779330acff8"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.25"

[[deps.LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[deps.LERC_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "bf36f528eec6634efc60d7ec062008f171071434"
uuid = "88015f11-f218-50d7-93a8-a6af411a945d"
version = "3.0.0+1"

[[deps.LLVMOpenMP_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f689897ccbe049adb19a065c495e75f372ecd42b"
uuid = "1d63c593-3942-5779-bab2-d838dc0a180e"
version = "15.0.4+0"

[[deps.LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "f428ae552340899a935973270b8d98e5a31c49fe"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.16.1"

    [deps.Latexify.extensions]
    DataFramesExt = "DataFrames"
    SymEngineExt = "SymEngine"

    [deps.Latexify.weakdeps]
    DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
    SymEngine = "123dc426-2d89-5057-bbad-38513e3affd8"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[deps.Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[deps.Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "6f73d1dd803986947b2c750138528a999a6c7733"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.6.0+0"

[[deps.Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[deps.Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "f9557a255370125b405568f9767d6d195822a175"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.17.0+0"

[[deps.Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[deps.Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "LERC_jll", "Libdl", "XZ_jll", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "2da088d113af58221c52828a80378e16be7d037a"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.5.1+1"

[[deps.Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.LogExpFunctions]]
deps = ["DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "7d6dd4e9212aebaeed356de34ccf262a3cd415aa"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.26"

    [deps.LogExpFunctions.extensions]
    LogExpFunctionsChainRulesCoreExt = "ChainRulesCore"
    LogExpFunctionsChangesOfVariablesExt = "ChangesOfVariables"
    LogExpFunctionsInverseFunctionsExt = "InverseFunctions"

    [deps.LogExpFunctions.weakdeps]
    ChainRulesCore = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
    ChangesOfVariables = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.LoggingExtras]]
deps = ["Dates", "Logging"]
git-tree-sha1 = "0d097476b6c381ab7906460ef1ef1638fbce1d91"
uuid = "e6f89c97-d47a-5376-807f-9c37f3926c36"
version = "1.0.2"

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "60168780555f3e663c536500aa790b6368adc02a"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.3.0"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "9ee1618cbf5240e6d4e0371d6f24065083f60c48"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.11"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "MozillaCACerts_jll", "Random", "Sockets"]
git-tree-sha1 = "03a9b9718f5682ecb107ac9f7308991db4ce395b"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.1.7"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.2+0"

[[deps.Measures]]
git-tree-sha1 = "c13304c81eec1ed3af7fc20e75fb6b26092a1102"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.2"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f66bdc5de519e8f8ae43bdc598782d35a25b1272"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.1.0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.10.11"

[[deps.NaNMath]]
deps = ["OpenLibm_jll"]
git-tree-sha1 = "0877504529a3e5c3343c6f8b4c0381e57e4387e4"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "1.0.2"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "887579a3eb005446d514ab7aeac5d1d027658b8f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+1"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.21+4"

[[deps.OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"
version = "0.8.1+0"

[[deps.OpenSSL]]
deps = ["BitFlags", "Dates", "MozillaCACerts_jll", "OpenSSL_jll", "Sockets"]
git-tree-sha1 = "51901a49222b09e3743c65b8847687ae5fc78eb2"
uuid = "4d8831e6-92b7-49fb-bdf8-b643e874388c"
version = "1.4.1"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "bbb5c2115d63c2f1451cb70e5ef75e8fe4707019"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.22+0"

[[deps.Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[deps.OrderedCollections]]
git-tree-sha1 = "2e73fe17cac3c62ad1aebe70d44c963c3cfdc3e3"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.6.2"

[[deps.PCRE2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "efcefdf7-47ab-520b-bdef-62a2eaa19f15"
version = "10.42.0+0"

[[deps.Parsers]]
deps = ["Dates", "PrecompileTools", "UUIDs"]
git-tree-sha1 = "716e24b21538abc91f6205fd1d8363f39b442851"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.7.2"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

[[deps.Pixman_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "LLVMOpenMP_jll", "Libdl"]
git-tree-sha1 = "64779bc4c9784fee475689a1752ef4d5747c5e87"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.42.2+0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "FileWatching", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.9.2"

[[deps.PlotThemes]]
deps = ["PlotUtils", "Statistics"]
git-tree-sha1 = "1f03a2d339f42dca4a4da149c7e15e9b896ad899"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "3.1.0"

[[deps.PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "PrecompileTools", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "f92e1315dadf8c46561fb9396e525f7200cdc227"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.3.5"

[[deps.Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "JLFzf", "JSON", "LaTeXStrings", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "PrecompileTools", "Preferences", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "RelocatableFolders", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun", "UnitfulLatexify", "Unzip"]
git-tree-sha1 = "ccee59c6e48e6f2edf8a5b64dc817b6729f99eb5"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.39.0"

    [deps.Plots.extensions]
    FileIOExt = "FileIO"
    GeometryBasicsExt = "GeometryBasics"
    IJuliaExt = "IJulia"
    ImageInTerminalExt = "ImageInTerminal"
    UnitfulExt = "Unitful"

    [deps.Plots.weakdeps]
    FileIO = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
    GeometryBasics = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
    IJulia = "7073ff75-c697-5162-941a-fcdaad2a7d2a"
    ImageInTerminal = "d8c32880-2388-543b-8c61-d9f865259254"
    Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "8f5fa7056e6dcfb23ac5211de38e6c03f6367794"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.6"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "LaTeXStrings", "Latexify", "Markdown", "PlutoLinks", "PlutoUI", "Random"]
git-tree-sha1 = "542de5acb35585afcf202a6d3361b430bc1c3fbd"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.13"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "e47cd150dbe0443c3a3651bc5b9cbd5576ab75b7"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.52"

[[deps.PrecompileTools]]
deps = ["Preferences"]
git-tree-sha1 = "03b4c25b43cb84cee5c90aa9b5ea0a78fd848d2f"
uuid = "aea7be01-6a6a-4083-8856-8a6e6704d82a"
version = "1.2.0"

[[deps.Preferences]]
deps = ["TOML"]
git-tree-sha1 = "7eb1686b4f04b82f96ed7a4ea5890a4f0c7a09f1"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.4.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Qt6Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "364898e8f13f7eaaceec55fd3d08680498c0aa6e"
uuid = "c0090381-4147-56d7-9ebc-da0b1113ec56"
version = "6.4.2+3"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.RecipesBase]]
deps = ["PrecompileTools"]
git-tree-sha1 = "5c3d09cc4f31f5fc6af001c250bf1278733100ff"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.3.4"

[[deps.RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "PrecompileTools", "RecipesBase"]
git-tree-sha1 = "45cf9fd0ca5839d06ef333c8201714e888486342"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.6.12"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.RelocatableFolders]]
deps = ["SHA", "Scratch"]
git-tree-sha1 = "90bc7a7c96410424509e4263e277e43250c05691"
uuid = "05181044-ff0b-4ac5-8273-598c1e38db00"
version = "1.0.0"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "1e597b93700fa4045d7189afa7c004e0584ea548"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.5.3"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Scratch]]
deps = ["Dates"]
git-tree-sha1 = "30449ee12237627992a99d5e30ae63e4d78cd24a"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.2.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[deps.SimpleBufferStream]]
git-tree-sha1 = "874e8867b33a00e784c8a7e4b60afe9e037b74e1"
uuid = "777ac1f9-54b0-4bf8-805c-2214025038e7"
version = "1.1.0"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "c60ec5c62180f27efea3ba2908480f8055e17cee"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.1.1"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.9.0"

[[deps.StatsAPI]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1ff449ad350c9c4cbc756624d6f8a8c3ef56d3ed"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.7.0"

[[deps.StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "75ebe04c5bed70b91614d684259b661c9e6274a4"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.34.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "Pkg", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "5.10.1+6"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.3"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.TensorCore]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "1feb45f88d133a655e001435632f019a9a1bcdb6"
uuid = "62fd8b95-f654-4bbd-a8a5-9c27f68ccd50"
version = "0.1.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "9a6ae7ed916312b41236fcef7e0af564ef934769"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.13"

[[deps.Tricks]]
git-tree-sha1 = "aadb748be58b492045b4f56166b5188aa63ce549"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.7"

[[deps.URIs]]
git-tree-sha1 = "b7a5e99f24892b6824a954199a45e9ffcc1c70f0"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.5.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[deps.Unitful]]
deps = ["Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "a72d22c7e13fe2de562feda8645aa134712a87ee"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.17.0"

    [deps.Unitful.extensions]
    ConstructionBaseUnitfulExt = "ConstructionBase"
    InverseFunctionsUnitfulExt = "InverseFunctions"

    [deps.Unitful.weakdeps]
    ConstructionBase = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
    InverseFunctions = "3587e190-3f89-42d0-90ee-14403ec27112"

[[deps.UnitfulLatexify]]
deps = ["LaTeXStrings", "Latexify", "Unitful"]
git-tree-sha1 = "e2d817cc500e960fdbafcf988ac8436ba3208bfd"
uuid = "45397f5d-5981-4c77-b2b3-fc36d6e9b728"
version = "1.6.3"

[[deps.Unzip]]
git-tree-sha1 = "ca0969166a028236229f63514992fc073799bb78"
uuid = "41fe7b60-77ed-43a1-b4f0-825fd5a5650d"
version = "0.2.0"

[[deps.Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "ed8d92d9774b077c53e1da50fd81a36af3744c1c"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.21.0+0"

[[deps.Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4528479aa01ee1b3b4cd0e6faef0e04cf16466da"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.25.0+0"

[[deps.XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Zlib_jll"]
git-tree-sha1 = "04a51d15436a572301b5abbb9d099713327e9fc4"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.10.4+0"

[[deps.XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[deps.XZ_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "cf2c7de82431ca6f39250d2fc4aacd0daa1675c0"
uuid = "ffd25f8a-64ca-5728-b0f7-c24cf3aae800"
version = "5.4.4+0"

[[deps.Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "afead5aba5aa507ad5a3bf01f58f82c8d1403495"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.8.6+0"

[[deps.Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "6035850dcc70518ca32f012e46015b9beeda49d8"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.11+0"

[[deps.Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[deps.Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "34d526d318358a859d7de23da945578e8e8727b7"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.4+0"

[[deps.Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[deps.Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[deps.Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[deps.Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[deps.Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[deps.Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[deps.Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "8fdda4c692503d44d04a0603d9ac0982054635f9"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.1+0"

[[deps.Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "b4bfde5d5b652e22b9c790ad00af08b6d042b97d"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.15.0+0"

[[deps.Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libX11_jll"]
git-tree-sha1 = "730eeca102434283c50ccf7d1ecdadf521a765a4"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.2+0"

[[deps.Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[deps.Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[deps.Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[deps.Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "330f955bc41bb8f5270a369c473fc4a5a4e4d3cb"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.6+0"

[[deps.Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "691634e5453ad362044e2ad653e79f3ee3bb98c3"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.39.0+0"

[[deps.Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "e92a1a012a10506618f10b7047e478403a046c77"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.5.0+0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.13+0"

[[deps.Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl"]
git-tree-sha1 = "49ce682769cd5de6c72dcf1b94ed7790cd08974c"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.5+0"

[[deps.fzf_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "868e669ccb12ba16eaf50cb2957ee2ff61261c56"
uuid = "214eeab7-80f7-51ab-84ad-2988db7cef09"
version = "0.29.0+0"

[[deps.libaom_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3a2ea60308f0996d26f1e5354e10c24e9ef905d4"
uuid = "a4ae2306-e953-59d6-aa16-d00cac43593b"
version = "3.4.0+0"

[[deps.libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+0"

[[deps.libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[deps.libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[deps.libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "b910cb81ef3fe6e78bf6acee440bda86fd6ae00c"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+1"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"

[[deps.x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[deps.x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[deps.xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "9ebfc140cc56e8c2156a15ceac2f0302e327ac0a"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "1.4.1+0"
"""

# ╔═╡ Cell order:
# ╟─248787ea-0744-46de-831b-ed8854f20e18
# ╟─2caa945b-d36c-4473-900f-824e0599f140
# ╟─d9457e47-a4f6-4682-ba9d-c2d86b69ae2e
# ╟─55e44178-ff2c-4467-b8b5-afa0d360cdcf
# ╟─89db506b-737e-4916-a495-df388314d268
# ╟─520962f0-6513-4615-ba08-a973b851ec8f
# ╠═99485bd5-46b8-425b-8974-6056c903b062
# ╟─82ddc4f5-e411-48da-abab-cc2029ee02f0
# ╠═8da1cb6d-5f5a-49b1-9ab8-9a00d229b519
# ╟─f52ee282-219a-4e7d-b1b6-faa4eff673f2
# ╟─db6deedc-de66-43e6-955c-b4a949cd659f
# ╟─f3c0c91a-6728-4178-a7cd-02527d7df872
# ╟─0a44521c-58b4-47d3-968c-d345799e42bb
# ╟─b90f442f-41aa-485b-b0f0-170e282c028c
# ╠═46318b60-7480-44f8-94bc-10f69a425d54
# ╟─90712d40-b1a5-445e-a1da-af62ecab7e59
# ╠═638d41c0-4a34-4a30-9928-ba88507334af
# ╟─9649494f-8378-459f-b079-d0566f2af8fb
# ╟─b9f959bf-abc2-4cc8-9f1d-584bb4728e89
# ╟─59f534f3-da67-406c-ae7f-9f3ddf13d1fe
# ╠═3570ce87-a57d-4abb-8477-f33957697952
# ╟─94c43668-0ddd-4550-9bca-5b05a1ede581
# ╟─5e679cb2-dd7f-4cf5-8035-54ae205eba1e
# ╠═5d555c37-3ea9-4315-b31f-c5ce86896160
# ╟─69998624-54dc-49a6-9053-0322c72982ea
# ╠═67329e1c-c84a-4a64-abdf-d086b59cee6d
# ╟─a2c4ba4e-56fa-4aaa-ba4a-5b5acb3cb2d8
# ╠═ccec9d74-f4aa-4254-89a1-f99e2e1cf653
# ╟─7df06422-db2c-4494-97c1-6ed2a1bc77eb
# ╟─87bf1d67-5f81-496e-a6ee-821b3f3eb1b0
# ╟─ce99f675-29ac-4413-94a9-febe1243e79d
# ╠═2385f6d9-1770-4fee-a7ab-3322f2d6e9ed
# ╟─e3a3c2f7-43f5-40ab-8693-9affc1130373
# ╟─ff08e1d0-6acd-4b46-ab75-51329cb00c22
# ╟─57790c82-9d40-4244-8b5d-3fcf98ce12e7
# ╠═ae01b249-cb76-43ae-9938-f489b93cc0ea
# ╟─6d73fbfe-0cf7-4925-a814-c42438e75fe0
# ╟─96d3e48e-60bc-4c97-aac4-6517502fa936
# ╟─f68a29b1-64c3-466b-987b-0c66b8385af3
# ╠═4287947f-5fcc-4400-b4ea-7ddb29d259cf
# ╟─e934fad8-c4fe-4e7f-bc64-e1c3f3e52460
# ╟─d3581eff-e1c7-4e01-b722-3d94ff428746
# ╟─14df28f1-6cb0-4e18-b5f0-4c8f94d02a56
# ╟─76b147a2-d33f-49ef-8236-444818042a12
# ╠═f50dc850-e32d-4fb3-afd2-0217cf8df1fc
# ╠═2dd82e2e-675f-40dd-882f-fe90db117589
# ╠═b350ee3d-7705-4712-a9bd-d16d4a83f89b
# ╟─cd338db8-8a5b-4ebf-a93d-95b1a7433de7
# ╟─ba2a8447-a8a0-4ce8-9d53-03a0369703c6
# ╟─8a1756c9-6d37-4541-ba8d-586e95b4feda
# ╟─9238a818-157c-4523-b6b2-139faf8ebe44
# ╟─c53c93f9-1960-4999-a3d8-ec0c654f4275
# ╟─58011f3c-364f-42b7-a9de-17fe736f80d1
# ╠═894c1642-9272-4624-b7a3-c8a882fbc337
# ╟─079234a4-3aa6-4932-8a25-2a8c8f290368
# ╠═373a9233-e5d1-4c18-a1aa-162f3a1a00be
# ╟─b2a13c34-84be-4c7d-bcd8-9186a4975559
# ╠═fee556d9-aa55-4187-b83c-afa2173e2adb
# ╟─1daacb53-b03f-476d-9ab0-c1dc59356147
# ╟─889e92f2-9104-4206-8e2e-785fc750a2c2
# ╟─33bd0f07-6c4c-4e1b-bad1-719871b4e56e
# ╟─1e30acf6-44bd-4caa-a461-ec358da607ea
# ╟─1dc1c2e2-11e6-4d30-ac49-4797117a5dae
# ╠═81223b60-4ca2-445e-9ce6-23261cd0e525
# ╟─8436976e-60cb-4904-aeb3-c9c65562a7a6
# ╟─95aedd7b-68fd-49fc-aa2d-ef5852d20c72
# ╟─c95b31b8-bfad-47d5-a5c8-bfb5340f76e3
# ╟─c6f94497-b544-417f-a479-f6558be1edc7
# ╟─3f3ef7e6-095f-4b87-8dd4-cb98cce33f9a
# ╟─7ed35606-3e63-43a8-b946-5bd7679d534a
# ╠═8f85182b-136d-42f2-b900-d234f2d52739
# ╟─42845857-b6d5-415f-abb8-072977e8c3db
# ╠═cb82f279-22e4-4c36-bf5a-32b10aea7606
# ╟─8a70bab4-014b-4f85-9ecb-821f9c4ed204
# ╟─b7d03e6c-bb80-48ee-8df4-2cac6fc3e983
# ╟─fae8d4d5-a0bd-4000-94d0-e030d9ee723e
# ╟─39b0c0d9-05e1-43eb-97e2-0ab169f9a2b0
# ╟─cadba82d-785a-4306-9407-d65eca10c2b3
# ╟─94260acb-1a29-4de8-b46e-a1c440460847
# ╠═1645c653-c4e6-45af-969c-440981b30bd0
# ╟─db9572b9-50ea-438d-a82d-6befe3aa8d59
# ╟─b4c5bcd1-830b-49d5-ad25-df89de14d59a
# ╟─a66b3097-edb2-40e2-affa-071ea2ebb82f
# ╟─bb7446cf-a972-4f68-83d6-07bc19ebc93d
# ╟─6a1038a4-81c8-450b-a91e-d0018570b760
# ╟─7279e904-53dc-47dc-9cfd-05ca94824c31
# ╟─8829fefc-cd9f-47b7-9425-15cf584ebfc5
# ╠═06fef836-2c59-46d7-98dc-4b8846dab554
# ╠═87846a7a-3926-42e0-a547-0c934ab4da25
# ╟─f95adced-2cf0-41c6-9448-789ca40f195b
# ╠═b1ced633-5f0c-4333-9788-e858cf5e0f3f
# ╟─8dad7471-4cbb-4f36-a692-7dc05f7c4fcc
# ╠═2702f2c6-c0ab-4be9-a6ec-03b970994432
# ╟─adde59ee-56ad-4761-a0ca-784df430c824
# ╟─2c052f02-7797-4b3e-ade2-1ffd38119bef
# ╠═6f871dfe-8c9e-48f4-88b1-2f581d997f95
# ╠═a4a8c395-ffde-46f1-997c-e92fd74e2e65
# ╟─228a010d-2ddb-4766-a2b7-84e8783378b6
# ╟─872c685b-fdbb-48d9-8e96-7982a7ca1faa
# ╟─865f7200-9032-49c2-a31c-b717c8d44607
# ╠═553a05a9-904a-454b-b4be-0049dcd2d04d
# ╠═59117354-7977-4a2d-8869-a91f7f3ae102
# ╟─390c6eb7-4013-413c-921a-bfec6b3d2728
# ╠═4f6d7663-987e-4a44-ab21-f772ae2add74
# ╟─2c8d6083-a00e-4dba-8dfb-82d02ead0d44
# ╟─5082e227-dc30-41ee-8010-bcacafd522a0
# ╟─a0f9fb43-765a-46c6-b1fc-dc0805d4ebc1
# ╟─de1ba39b-e455-4639-b619-f6c628af8a3e
# ╠═7544f034-d014-484d-90f5-9d6b4c842858
# ╟─249d4cdb-a1dd-4314-9799-63332d8b6da4
# ╟─65f2c812-bf9f-4909-8032-90e683b6a1bc
# ╟─319dce21-8655-4f72-8b8d-1f5f934416b5
# ╠═18c20096-84c1-4ec0-bb6d-185338676ced
# ╟─cb63050b-07c0-46ba-8b88-be17aeef96ac
# ╟─f7ed2338-584e-4c61-bc3c-0f307b272fc0
# ╟─52b53482-b8e2-469f-b85a-ae06d52b66a0
# ╠═88b36341-02ed-4043-8a9f-672340bf194f
# ╟─1b656b2d-5a62-44db-bb69-eeafd15f1510
# ╟─15984de3-1e84-41c9-8193-5fa3a4cb9f1c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
