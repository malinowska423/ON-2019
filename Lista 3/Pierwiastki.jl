# Aleksandra Malinowska 244925

module Pierwiastki
    include("./zad1.jl")
    include("./zad2.jl")
    include("./zad3.jl")

    function printTuple((a,b,c,d)) 
        println(a,";",b,";",c,";",d)
    end
    export mbisekcji, mstycznych, msiecznych, printTuple
end
