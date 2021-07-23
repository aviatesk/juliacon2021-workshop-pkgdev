# Julia2021 Workshop – Package development: improving engineering quality & latency

- Presenters: [Tim Holy](https://github.com/timholy), [Shuhei Kadowaki](https://github.com/aviatesk)
- YouTube link: <https://www.youtube.com/watch?v=wXRMwJdEjX4>
- pretalx link: <https://pretalx.com/juliacon2021/talk/VY9UVX/>

## Abstract

Julia holds immense promise for a composable package ecosystem. Potential obstacles to achieving this promise include missing methods for unanticipated types, unwitting type-piracy, poor performance due to inference failures, method ambiguities, and latency due to long compilation times and/or invalidation of previously-compiled code.

This workshop will tutor developers on the use of some of the tools available for improving package quality and reducing latency. We will begin by summarizing the factors that influence dispatch, inference, latency, and invalidation, and how monitoring inference provides a framework for detecting problems before or as they arise. We will then tutor attendees in the use of tools like [MethodAnalysis](https://github.com/timholy/MethodAnalysis.jl), [JET](https://github.com/aviatesk/JET.jl), [Cthulhu](https://github.com/JuliaDebug/Cthulhu.jl), and [SnoopCompile](https://github.com/timholy/SnoopCompile.jl) to discover, analyze, and fix detected problems in package implementation. We will also show how in addition to improving robustness, such steps can often streamline design and reduce latency.

This workshop is aimed at experienced Julia developers.

## Prerequisites

For this workshop, **we recommend you use Julia v1.7 or higher**.
You can download [a prebuilt v1.7 binary](https://julialang.org/downloads/#upcoming_release) or [an nightly build](https://julialang.org/downloads/nightlies/). You can also use Julia [built from the latest source](https://github.com/JuliaLang/julia#building-julia).

If you've installed an appropriate Julia version, clone this repository and install the required packages with the following commands:
```julia
julia> pwd()    # check whether you're in this folder (if not, navigate here with `cd`)
"/home/user/path/to/juliacon2021-workshop-pkgdev"

julia> using Pkg

julia> Pkg.activate(@__DIR__)

julia> Pkg.instantiate()
```

Now you can run the workshop notebooks with:
```julia
julia> using IJulia

# # install Jupyter kernel if not exist
# julia> IJulia.installkernel(KERNEL_NAME)

julia> IJulia.notebook(; dir=@__DIR__)
```

## Workshop Outline

- (Tim, 25min) [Introduction: a tutorial on Julia internals](./Introduction.ipynb) (methods, types, MethodInstances & specialization, dispatch, backedges, invalidation, precompilation).  Includes a few demos of [MethodAnalysis.jl](https://github.com/timholy/MethodAnalysis.jl)
- Break: 5min
- (Shuhei, 45min) [JET.jl Workshop](./JET.ipynb): Explanations of the basic ideas of [JET.jl](https://github.com/aviatesk/JET.jl), and demos of its usages
- Break: 10min
- (Tim, 30min) [SnoopCompile workshop 1](./SnoopCompileBasics.ipynb): inference-profiling, profile-guided despecialization, precompilation
- Break: 5min
- (Tim, 15min): [Lowered & typed code](./LoweredTypedCode.ipynb)
- (Shuhei, 30min) [Cthulhu.jl](https://github.com/JuliaDebug/Cthulhu.jl)
- (Tim, 15min): SnoopCompile & Cthulhu integration
