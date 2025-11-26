module Initialization

    using Random

    using ..Types

    export initialize_model, initialize_voters

    function initialize_voters(num_voters::Int, rng::AbstractRNG)::Vector{Voter}
        voters = Voter[]

        #Empirical Parameters
        ideology_average = 0.0
        ideology_stddev = 0.3

        for i in 1:num_voters

            #ideology Component
            ideology_raw = randn(rng) * ideology_stddev + ideology_average
            ideology = clamp(ideology_raw, -1.0, 1.0)
            push!(voters, Voter(i, ideology))
        end

        return voters
    end # function initialize_voters

    function initialize_candidates(num_candidates::Int, rng::AbstractRNG)::Vector{Candidate}
        candidates = Candidate[]

        #Empirical Parameters
        platform_average = 0.0
        platform_stddev = 0.4

        for i in 1:num_candidates

            #platform Component
            platform_raw = randn(rng) * platform_stddev + platform_average
            platform = clamp(platform_raw, -1.0, 1.0)
            push!(candidates, Candidate(i, platform, 0))
        end

        return candidates
    end # function initialize_candidates


    function initialize_model(num_voters::Int, num_candidates::Int, rng_seed::Int=42)::ElectionModel
        rng = MersenneTwister(rng_seed)

        voters = initialize_voters(num_voters, rng)
        candidates = initialize_candidates(num_candidates, rng)

        return ElectionModel(num_voters, voters, candidates, rng)
    end
    

end # module Initialization