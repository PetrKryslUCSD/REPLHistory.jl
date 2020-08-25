module REPLHistory

using InteractiveUtils
using REPL

export history

function history(n = 5) 
    out = ""
    n = n - 1
    list = []; 
    for l in reverse(readlines(REPL.find_hist_file()))[2:end]
        l = strip(l)
        if n != 0
            (l[1] != '#') && (n = n - 1)
            push!(list, l); 
        else
            break
        end
    end
    next = ""
    for l in reverse(list)
        l = next * l
        if l == "# mode: shell"
            next = ";" 
        else
            printit = false
            if (l[1] != '#')
                printit = true
            end
            printit && (out = out * l * "\n")
            next = "" 
        end
    end
    return out
end

end



# https://github.com/PetrKryslUCSD/REPLHistory.jl.git