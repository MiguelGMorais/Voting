module Types
    using Random
    export Voter, Candidate, ElectionModel

    mutable struct Voter
        id::Int                 # Identity
        ideology::Float64       # Component: Ideological Position in [-1, 1]
        voting_cost::Float64    # Component: Costing of voting
        
    end

    mutable struct Candidate
        id::Int                 # Identity
        platform::Float64       # Component: Announced Ideological Platform in [-1, 1]
        votes_received::Int     # Component: Number of Votes Received
        
    end

    struct ElectionModel
        num_voters::Int          # Number of Voters
        voters::Vector{Voter}    # Vector of Voters
        candidates::Vector{Candidate}  # Vector of Candidates
        rng::AbstractRNG        # Random Number Generator
    end
end # module Types