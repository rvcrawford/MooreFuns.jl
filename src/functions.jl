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

# define a path to our data directory
datapath = joinpath(@__DIR__, "..", "data")

# load in our testing set
test_df = CSV.read(joinpath( datapath, "test.csv"), DataFrames.DataFrame)

brassica_df = CSV.read(joinpath( datapath, "24NYBR.csv"), DataFrames.DataFrame)


# export greet_your_package_name
