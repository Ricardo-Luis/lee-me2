### A Pluto.jl notebook ###
# v0.19.14

#> [frontmatter]
#> chapter = 0
#> section = 2
#> order = 2
#> title = " 🎈 Basic Julia"
#> layout = "layout.jlhtml"
#> description = ""
#> tags = ["preliminaries"]

using Markdown
using InteractiveUtils

# ╔═╡ 0d3aec92-edeb-11ea-3adb-cd0dc17cbdab
md"# Get started with Julia - live

Before being able to run this notebook successfully locally, you will need to [set up Julia and Pluto.](/Spring21/installation/)
"


# ╔═╡ 3b038ee0-edeb-11ea-0977-97cc30d1c6ff
md"## Variables

We can define a variable using `=` (assignment). Then we can use its value in other expressions:
"

# ╔═╡ 3e8e0ea0-edeb-11ea-22e0-c58f7c2168ce
x = 3


# ╔═╡ 59b66862-edeb-11ea-2d62-71dcc79dbfab
y = 2x

# ╔═╡ 5e062a24-edeb-11ea-256a-d938f77d7815
md"By default Julia displays the output of the last operation. (You can suppress the output by adding `;` (a semicolon) at the end.)
"

# ╔═╡ 7e46f0e8-edeb-11ea-1092-4b5e8acd9ee0
md"We can ask what type a variable has using `typeof`:"

# ╔═╡ 8a695b86-edeb-11ea-08cc-17263bec09df
typeof(y)

# ╔═╡ 8e2dd3be-edeb-11ea-0703-354fb31c12f5
md"## Functions"

# ╔═╡ 96b5a28c-edeb-11ea-11c0-597615962f54
md"We can use a short-form, one-line function definition for simple functions:"

# ╔═╡ a7453572-edeb-11ea-1e27-9f710fd856a6
f(x) = 2 + x

# ╔═╡ b341db4e-edeb-11ea-078b-b71ac00089d7
md"Typing the function's name gives information about the function. To call it we must use parentheses:"

# ╔═╡ 23f9afd4-eded-11ea-202a-9f0f1f91e5ad
f

# ╔═╡ cc1f6872-edeb-11ea-33e9-6976fd9b107a
f(10)

# ╔═╡ ce9667c2-edeb-11ea-2665-d789032abd11
md"For longer functions we use the following syntax with the `function` keyword and `end`:"

# ╔═╡ d73d3400-edeb-11ea-2dea-95e8c4a6563b
function g(x, y)
	z = x + y
	return z^2
end

# ╔═╡ e04ccf10-edeb-11ea-36d1-d11969e4b2f2
g(1, 2)

# ╔═╡ e297c5cc-edeb-11ea-3bdd-090f415685ab
md"## For loops"

# ╔═╡ ec751446-edeb-11ea-31ba-2372e7c71b42
md"Use `for` to loop through a pre-determined set of values:"

# ╔═╡ fe3fa290-edeb-11ea-121e-7114e5c573c1
let s = 0
	
	for i in 1:10
		s += i    # Equivalent to s = s + i
	end
	
	s
end

# ╔═╡ 394b0ec8-eded-11ea-31fb-27392068ef8f
md"Here, `1:10` is a **range** representing the numbers from 1 to 10:"

# ╔═╡ 4dc00908-eded-11ea-25c5-0f7b2b7e18f9
typeof(1:10)

# ╔═╡ 6c44abb4-edec-11ea-16bd-557800b5f9d2
md"Above we used a `let` block to define a new local variable `s`. 
But blocks of code like this are usually better inside functions, so that they can be reused. For example, we could rewrite the above as follows:
"

# ╔═╡ 683af3e2-eded-11ea-25a5-0d90bf099d98
function mysum(n)
	s = 0
	
	for i in 1:n
		s += i    
	end
	
	return s
end

# ╔═╡ 76764ea2-eded-11ea-1aa6-296f3421de1c
mysum(100)

# ╔═╡ 93a231f4-edec-11ea-3b39-299b3be2da78
md"## Conditionals: `if`"

# ╔═╡ 82e63a24-eded-11ea-3887-15d6bfabea4b
md"We can evaluate whether a condition is true or not by simply writing the condition:"

# ╔═╡ 9b339b2a-eded-11ea-10d7-8fc9a907c892
a = 3

# ╔═╡ 9535eb40-eded-11ea-1651-e33c9c23dbfb
a < 5

# ╔═╡ a16299a2-eded-11ea-2b56-93eb7a1010a7
md"We see that conditions have a Boolean (`true` or `false`) value. 

We can then use `if` to control what we do based on that value:"

# ╔═╡ bc6b124e-eded-11ea-0290-b3760cb81024
if a < 5
	"small"
	
else
	"big"
	
end

# ╔═╡ cfb21014-eded-11ea-1261-3bc30952a88e
md"""Note that the `if` also returns the last value that was evaluated, in this case the string `"small"` or `"big"`, Since Pluto is reactive, changing the definition of `a` above will automatically cause this to be reevaluated!"""

# ╔═╡ ffee7d80-eded-11ea-26b1-1331df204c67
md"## Arrays"

# ╔═╡ cae4137e-edee-11ea-14af-59a32227de1b
md"### 1D arrays (`Vector`s)"

# ╔═╡ 714f4fca-edee-11ea-3410-c9ab8825d836
md"We can make a `Vector` (1-dimensional, or 1D array) using square brackets:"

# ╔═╡ 82cc2a0e-edee-11ea-11b7-fbaa5ad7b556
v = [1, 2, 3]

# ╔═╡ 85916c18-edee-11ea-0738-5f5d78875b86
typeof(v)

# ╔═╡ 881b7d0c-edee-11ea-0b4a-4bd7d5be2c77
md"The `1` in the type shows that this is a 1D array.

We access elements also using square brackets:"

# ╔═╡ a298e8ae-edee-11ea-3613-0dd4bae70c26
v[2]

# ╔═╡ a5ebddd6-edee-11ea-2234-55453ea59c5a
v[2] = 10

# ╔═╡ a9b48e54-edee-11ea-1333-a96181de0185
md"Note that Pluto does not automatically update cells when you modify elements of an array, but the value does change."

# ╔═╡ 68c4ead2-edef-11ea-124a-03c2d7dd6a1b
md"A nice way to create `Vector`s following a certain pattern is to use an **array comprehension**:"

# ╔═╡ 84129294-edef-11ea-0c77-ffa2b9592a26
v2 = [i^2 for i in 1:10]

# ╔═╡ d364fa16-edee-11ea-2050-0f6cb70e1bcf
md"## 2D arrays (matrices)"

# ╔═╡ db99ae9a-edee-11ea-393e-9de420a545a1
md"We can make small matrices (2D arrays) with square brackets too:"

# ╔═╡ 04f175f2-edef-11ea-0882-712548ebb7a3
M = [1 2
	 3 4]

# ╔═╡ 0a8ac112-edef-11ea-1e99-cf7c7808c4f5
typeof(M)

# ╔═╡ 1295f48a-edef-11ea-22a5-61e8a2e1d005
md"The `2` in the type confirms that this is a 2D array."

# ╔═╡ 3e1fdaa8-edef-11ea-2f03-eb41b2b9ea0f
md"This won't work for larger matrices, though. For that we can use e.g."

# ╔═╡ 48f3deca-edef-11ea-2c18-e7419c9030a0
zeros(5, 5)

# ╔═╡ a8f26af8-edef-11ea-2fc7-2b776f515aea
md"Note that `zeros` gives `Float64`s by default. We can also specify a type for the elements:"

# ╔═╡ b595373e-edef-11ea-03e2-6599ef14af20
zeros(Int, 4, 5)

# ╔═╡ 4cb33c04-edef-11ea-2b35-1139c246c331
md"We can then fill in the values we want by manipulating the elements, e.g. with a `for` loop."

# ╔═╡ 54e47e9e-edef-11ea-2d75-b5f550902528
md"A nice alternative syntax to create matrices following a certain pattern is an array comprehension with a *double* `for` loop:"

# ╔═╡ 6348edce-edef-11ea-1ab4-019514eb414f
[i + j for i in 1:5, j in 1:6]

# ╔═╡ Cell order:
# ╟─0d3aec92-edeb-11ea-3adb-cd0dc17cbdab
# ╟─3b038ee0-edeb-11ea-0977-97cc30d1c6ff
# ╠═3e8e0ea0-edeb-11ea-22e0-c58f7c2168ce
# ╠═59b66862-edeb-11ea-2d62-71dcc79dbfab
# ╟─5e062a24-edeb-11ea-256a-d938f77d7815
# ╟─7e46f0e8-edeb-11ea-1092-4b5e8acd9ee0
# ╠═8a695b86-edeb-11ea-08cc-17263bec09df
# ╟─8e2dd3be-edeb-11ea-0703-354fb31c12f5
# ╟─96b5a28c-edeb-11ea-11c0-597615962f54
# ╠═a7453572-edeb-11ea-1e27-9f710fd856a6
# ╟─b341db4e-edeb-11ea-078b-b71ac00089d7
# ╠═23f9afd4-eded-11ea-202a-9f0f1f91e5ad
# ╠═cc1f6872-edeb-11ea-33e9-6976fd9b107a
# ╟─ce9667c2-edeb-11ea-2665-d789032abd11
# ╠═d73d3400-edeb-11ea-2dea-95e8c4a6563b
# ╠═e04ccf10-edeb-11ea-36d1-d11969e4b2f2
# ╟─e297c5cc-edeb-11ea-3bdd-090f415685ab
# ╟─ec751446-edeb-11ea-31ba-2372e7c71b42
# ╠═fe3fa290-edeb-11ea-121e-7114e5c573c1
# ╟─394b0ec8-eded-11ea-31fb-27392068ef8f
# ╠═4dc00908-eded-11ea-25c5-0f7b2b7e18f9
# ╟─6c44abb4-edec-11ea-16bd-557800b5f9d2
# ╠═683af3e2-eded-11ea-25a5-0d90bf099d98
# ╠═76764ea2-eded-11ea-1aa6-296f3421de1c
# ╟─93a231f4-edec-11ea-3b39-299b3be2da78
# ╟─82e63a24-eded-11ea-3887-15d6bfabea4b
# ╠═9b339b2a-eded-11ea-10d7-8fc9a907c892
# ╠═9535eb40-eded-11ea-1651-e33c9c23dbfb
# ╟─a16299a2-eded-11ea-2b56-93eb7a1010a7
# ╠═bc6b124e-eded-11ea-0290-b3760cb81024
# ╟─cfb21014-eded-11ea-1261-3bc30952a88e
# ╟─ffee7d80-eded-11ea-26b1-1331df204c67
# ╟─cae4137e-edee-11ea-14af-59a32227de1b
# ╟─714f4fca-edee-11ea-3410-c9ab8825d836
# ╠═82cc2a0e-edee-11ea-11b7-fbaa5ad7b556
# ╠═85916c18-edee-11ea-0738-5f5d78875b86
# ╟─881b7d0c-edee-11ea-0b4a-4bd7d5be2c77
# ╠═a298e8ae-edee-11ea-3613-0dd4bae70c26
# ╠═a5ebddd6-edee-11ea-2234-55453ea59c5a
# ╟─a9b48e54-edee-11ea-1333-a96181de0185
# ╟─68c4ead2-edef-11ea-124a-03c2d7dd6a1b
# ╠═84129294-edef-11ea-0c77-ffa2b9592a26
# ╟─d364fa16-edee-11ea-2050-0f6cb70e1bcf
# ╟─db99ae9a-edee-11ea-393e-9de420a545a1
# ╠═04f175f2-edef-11ea-0882-712548ebb7a3
# ╠═0a8ac112-edef-11ea-1e99-cf7c7808c4f5
# ╟─1295f48a-edef-11ea-22a5-61e8a2e1d005
# ╟─3e1fdaa8-edef-11ea-2f03-eb41b2b9ea0f
# ╠═48f3deca-edef-11ea-2c18-e7419c9030a0
# ╟─a8f26af8-edef-11ea-2fc7-2b776f515aea
# ╠═b595373e-edef-11ea-03e2-6599ef14af20
# ╟─4cb33c04-edef-11ea-2b35-1139c246c331
# ╟─54e47e9e-edef-11ea-2d75-b5f550902528
# ╠═6348edce-edef-11ea-1ab4-019514eb414f
