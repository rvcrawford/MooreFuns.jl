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

function accession_df(x::accession_template)
    df = DataFrame(accession = x.accession, species = x.species)
    to_add = DataFrame(population_name = missing, organization_name = missing, synonym = missing)
    hcat(df, to_add)
end

# define a path to our data directory
datapath = joinpath(@__DIR__, "..", "data")

# load in our testing set
test_df = CSV.read(joinpath( datapath, "test.csv"), DataFrames.DataFrame)

# load in our brassica
brassica_df = CSV.read(joinpath( datapath, "24NYBR.csv"), DataFrames.DataFrame)

# load in our trial df
bb_col_names_df = CSV.read(joinpath( datapath, "bb_trial_col_names.csv"), missingstring = "NA", DataFrames.DataFrame)


# export greet_your_package_name
