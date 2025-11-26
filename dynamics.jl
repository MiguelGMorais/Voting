module Dynamics

    using Random
    using Statistics

    using ..Types
    using ..Initialization

    export voting_step!, platform_update!

    function voting_step!(model::ElectionModel)
        # Reset votes received
        for candidate in model.candidates
            candidate.votes_received = 0
        end

        # Each voter votes for the closest candidate
        for voter in model.voters
            best_utility = -Inf
            best_candidate = nothing

            #vote
            for candidate in model.candidates
                distance = abs(voter.ideology - candidate.platform)

                utility = -distance

                if utility > best_utility
                    best_utility = utility
                    best_candidate = candidate
                end
            end

            if best_candidate !== nothing
                best_candidate.votes_received += 1
            end

        end # voters choice loop

    end


    function platform_update!(model::ElectionModel, learning_rate::Float64)
        mean_ideology = mean(voter.ideology for voter in model.voters)

        for candidate in model.candidates
            direction = mean_ideology - candidate.platform
            candidate.platform += learning_rate * direction
            candidate.platform = clamp(candidate.platform, -1.0, 1.0)
        end
    end

end # module Dynamics