module MooreFuns

# Write your package code here.
export greet_your_package_name
include("functions.jl")

function hello_world()
    println("hello world")
end

export hello_world

end
