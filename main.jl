# Package imports
using Random, LinearAlgebra, Statistics

#kkkkk ninguém vai me ver aqui 

# Module includes
include("types.jl")
include("initialization.jl")
include("dynamics.jl")

#Modules Access
using .Types
using .Initialization
using .Dynamics

# Main Execution

function electoral_run(
                        num_voters::Int = 1000,
                        num_candidates::Int = 2,
                        num_steps::Int = 24,
                        learning_rate::Float64 = 0.1;
                        rng_seed::Int = rand(Int))

    println("Initializing the model...")
    println("Number of Voters: $num_voters")
    println("Number of Candidates: $num_candidates")
    
    model = initialize_model(num_voters, num_candidates, rng_seed)


    # Store data
    platform_history = Dict(candidate.id => Float64[] for candidate in model.candidates)
    votes_history = Dict(candidate.id => Int[] for candidate in model.candidates)

    for step in 1:num_steps
        voting_step!(model)
        platform_update!(model, learning_rate)

        for candidate in model.candidates
            push!(platform_history[candidate.id], candidate.platform)
            push!(votes_history[candidate.id], candidate.votes_received)
        end
        
    end

    return model, platform_history, votes_history

end

# Run the electoral simulation
final_model, platform_history, votes_history = electoral_run()