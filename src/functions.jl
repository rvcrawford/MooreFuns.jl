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

# makes a dataframe including the
function accession_df(x::accession_template)
    df = DataFrames.DataFrame(x)
    to_add = DataFrames.DataFrame(population_name = missing, organization_name = missing, synonym = missing)
    to_add2 = repeat(to_add, DataFrames.nrow(df))
    hcat(df, to_add2)
end


function make_grid(n_row::Int, n_col::Int)
    row_df = DataFrames.DataFrame(row_number = 1:n_row)
    col_df = DataFrames.DataFrame(col_number = 1:n_col)
    cross_df = DataFrames.crossjoin(row_df, col_df)
    cross_df.plot_number = cross_df.row_number .* 100 .+ cross_df.col_number
end


ccb_trial_header = DataFrames.DataFrame(trial_name = String[],
breeding_program = String[],
location = String[],
year = Int64[],
design_type = String[],
description = String[]
)



    # cross_df.accession_name = accession_name
    # cross_df.block_number = repeat(1:4,inner = 15)

# define a path to our data directory
datapath = joinpath(@__DIR__, "..", "data")

# load in our testing set
test_df = CSV.read(joinpath( datapath, "test.csv"), DataFrames.DataFrame)

# load in our brassica
brassica_df = CSV.read(joinpath( datapath, "24NYBR.csv"), DataFrames.DataFrame)

# load in our trial df
bb_col_names_df = CSV.read(joinpath( datapath, "bb_trial_col_names.csv"), missingstring = "NA", DataFrames.DataFrame)


# export greet_your_package_name
