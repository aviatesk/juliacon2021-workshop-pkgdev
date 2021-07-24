using SnoopCompile
using StaticArrays
using PyPlot: PyPlot, plt
PyPlot.pygui(true)               # force plotting in an interactive window
using LinearAlgebra
using Profile

function build_matrices_static(rowrange, colrange, k::Integer)
    return [((m, n) = (rand(rowrange), rand(colrange)); SMatrix{m,n}(randn(m, n))) for _ = 1:k]
end

function build_matrices_dynamic(rowrange, colrange, k::Integer)
    return [((m, n) = (rand(rowrange), rand(colrange)); randn(m, n)) for _ = 1:k]
end

tinfbd = @snoopi_deep build_matrices_dynamic(1:8, 1:8, 200)
tinfbs = @snoopi_deep build_matrices_static(1:8, 1:8, 200)
md = build_matrices_dynamic(1:200, 1:200, 200)
ms = build_matrices_static(1:8, 1:8, 200)

tinffd = @snoopi_deep svd.(md)
tinffs = @snoopi_deep svd.(ms)

@profile svd.(md)
profd = Profile.fetch()
Profile.clear()
@profile svd.(ms)
profs = Profile.fetch()

mrefd, axd = pgdsgui(tinffd, profd)
axd.set_title("Array")
mrefs, axs = pgdsgui(tinffs, profs)
axs.set_title("StaticArrays")
