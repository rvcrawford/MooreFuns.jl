import DataFrames
import CSV


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

function make_accession(accession::String, species_abb::String)
    species = ccb_dict[species_abb]
    accession_template(accession, species)
end

datapath = joinpath(@__DIR__, "..", "data")
test_df = CSV.read(joinpath( datapath, "test.csv"),DataFrame)


# export greet_your_package_name
