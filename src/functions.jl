import DataFrames
import CSV

# define a path to our data directory
datapath = joinpath(@__DIR__, "..", "data")

# load in our testing set
test_df = CSV.read(joinpath( datapath, "test.csv"), DataFrames.DataFrame)

# load in our brassica
brassica_df = CSV.read(joinpath( datapath, "24NYBR.csv"), DataFrames.DataFrame)

# load in our trial df
bb_col_names_df = CSV.read(joinpath( datapath, "bb_trial_col_names.csv"), missingstring = "NA", DataFrames.DataFrame)




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
    to_add = DataFrames.DataFrame(population_name = missing, organization_name = missing, synonym = missing)
    if typeof(x)==Vector{accession_template} 
        df = DataFrames.DataFrame(x)
        DataFrames.crossjoin(df, to_add)
    else
        d_vec = accession_template[]
        push!(d_vec, x)
        df = DataFrames.DataFrame(d_vec)
        DataFrames.crossjoin(df, to_add)
    end
end


function make_grid(n_row::Int, n_col::Int)
    row_df = DataFrames.DataFrame(row_number = 1:n_row)
    col_df = DataFrames.DataFrame(col_number = 1:n_col)
    cross_df = DataFrames.crossjoin(row_df, col_df)
    cross_df.plot_number = cross_df.row_number .* 100 .+ cross_df.col_number
    return cross_df
end

# create missings dataframe
function make_ccb_missings()
    missings = bb_col_names_df[ismissing.(bb_col_names_df.example_value), :]
# unstack the above
    wide_missings = DataFrames.unstack(missings, :i_th, :name, :example_value)
    DataFrames.select!(wide_missings, DataFrames.Not(:i_th))
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


# export greet_your_package_name
