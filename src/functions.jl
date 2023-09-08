function greet_your_package_name()
    println("Hello MooreFuns")
end

struct accession_template
    accession::String
    species::String
end

ccb_dict = Dict{String,String}("wp"=> "Pisum sativum", 
"hv" => "Vicia villosa",
"cc" => "Trifolium incarnatum",
"cr" => "Secale cereale"
)

# export greet_your_package_name
