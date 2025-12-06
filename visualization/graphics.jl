module Graphics
    using Plots

    export plot_votes, plot_platforms

    
    function plot_votes(votes_history::Dict{Int, Vector{Int}})
        plt = plot( title = "Votes per Step",
                    xlabel = "Step",
                    ylabel = "Number of Votes")

        for (candidate_id, votes) in votes_history
            plot!(plt, votes, label = "Candidate $candidate_id")
        end

        display(plt)
    end # plot_votes

    function plot_platforms(platform_history::Dict{Int, Vector{Float64}})
        plt = plot( title = "Platform Convergence",
                    xlabel = "Step",
                    ylabel = "Plaftorm")
        
        for (candidate_id, platforms) in platform_history
            plot!(plt, platforms, label = "Candidate $candidate_id")
        end

        display(plt)
    end # plot_platforms

end