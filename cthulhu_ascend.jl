using SnoopCompile

struct AlignedText{J}   # J is justification (:left, :center, or :right)
    text::String
end

sametexts(str1, str2, str3) = [AlignedText{:left}(str1), AlignedText{:left}(str2), AlignedText{:left}(str3)]

tinf = @snoopi_deep sametexts("Dispatch", "is", "fun")

threetexts(str1, str2, str3) = [AlignedText{:left}(str1), AlignedText{:center}(str2), AlignedText{:right}(str3)]

tinf = @snoopi_deep threetexts("Dispatch", "is", "fun")

# Things to try:
# itrigs = inference_triggers(tinf)
# suggest.(itrigs)
# ascend(itrigs[2])
# using MethodAnalysis
# methodinstances(Base.vect)
# Improve the container type in `threetexts`

align(io::IO, txt::AlignedText{:left}, w) = println(io, txt.text)
align(io::IO, txt::AlignedText{:right}, w) = println(io, lpad(txt.text, w))
function align(io::IO, txt::AlignedText{:center}, w)
    Δw = w - length(txt.text)
    Δw2 = Δw ÷ 2
    println(io, rpad(lpad(txt.text, Δw2), Δw - Δw2))
end
# align(io::IO, txt::AlignedText{:other}, w) = error("undefined")


function alignpairs(string_justifies; w=40)
    txts = AlignedText[]
    for (txt, j) in string_justifies
        push!(txts, AlignedText{j}(txt))
    end
    txts = unique(txts)
    io = IOBuffer()
    for txt in txts
        align(io, txt, w)
    end
    return String(take!(io))
end

# tinf = @snoopi_deep alignpairs(["left" => :left, "middle" => :center])