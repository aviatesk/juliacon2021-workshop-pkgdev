# Julia2021 Workshop – Package development: improving engineering quality & latency

- Presenters: [Tim Holy](https://github.com/timholy), [Shuhei Kadowaki](https://github.com/aviatesk)
- YouTube Link: <https://www.youtube.com/watch?v=wXRMwJdEjX4>
- pretalx Link: <https://pretalx.com/juliacon2021/talk/VY9UVX/>

## Abstract

Julia holds immense promise for a composable package ecosystem. Potential obstacles to achieving this promise include missing methods for unanticipated types, unwitting type-piracy, poor performance due to inference failures, method ambiguities, and latency due to long compilation times and/or invalidation of previously-compiled code.

This workshop will tutor developers on the use of some recently-developed tools for detecting, diagnosing, and fixing such problems.

This workshop will tutor developers on the use of some of the tools available for improving package quality and reducing latency. We will begin by summarizing the factors that influence dispatch, inference, latency, and invalidation, and how monitoring inference provides a framework for detecting problems before or as they arise. We will then tutor attendees in the use of tools like MethodAnalysis, JET, Cthulhu, and SnoopCompile to discover, analyze, and fix detected problems in package implementation. We will also show how in addition to improving robustness, such steps can often streamline design and reduce latency.

This workshop is aimed at experienced Julia developers. Registrants are encouraged to submit nominations prior to the workshop for packages to use as demonstrations of these tools.

## Prerequisites

For this workshop, **we recommend you use Julia v1.7 or higher**.
You can download [a prebuilt v1.7 binary](https://julialang.org/downloads/#upcoming_release) or [an nightly build](https://julialang.org/downloads/nightlies/). You can also use Julia [built from the latest source](https://github.com/JuliaLang/julia#building-julia).

If you've installed an appropriate Julia version, install the required packages with the following command:
```julia
julia> using Pkg

julia> Pkg.activate(@__DIR__)

julia> Pkg.instantiate()
```

Then you can run the workshop notebooks with:
```julia
julia> using IJulia

# # install Jupyter kernel if not exist
# julia> IJulia.installkernel(KERNEL_NAME)

julia> IJulia.notebook(; dir=@__DIR__)
```

## Workshop Outline

- (Tim) [Introduction](./Introduction.ipynb) (~15min presentation, 10min exercises & questions): methods, types, method instances & specialization, and MethodAnalysis.jl.
- Break: 5min
- (Shuhei) JET (~45min for both description and participant exercises)
- Break: 10min
- (Tim) Lowered & typed code (20 min)
- (Shuhei) Cthulhu: overview and exercises (15 min for overview, 15 min for exercises and questions)
- (Tim) SnoopCompile: inference-profiling, profile-guided despecialization, backedges, precompilation (45min interspersed descriptions, exercises, & questions)
