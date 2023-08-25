Dict(
    :main => [
        "welcome" => collections["welcome"].pages,
        "Preliminaries" => collections["preliminaries"].pages,
        "2: Social Science & Data Science" => collections["module2"].pages,
        #"Module 3: Climate Science" => collections["module3"].pages,

    ],
    :about => Dict(
        :authors => [
            (name = "Ricardo Luís", url = "https://ricardo-luis.github.io/"),
            (name = "Second Instructor", url = "https://www.the-second.com")
        ],
        :title => "Máquinas Elétricas II",
        :subtitle => "Reactive notebooks",
        :term => "Fall 2023",
        :institution => "ISEL",
        :institution_url => "http://www.isel.pt",
        :institution_logo => "julia-logo-color.svg",
        :institution_logo_darkmode => "julia-logo-dark.svg"
    )
)
