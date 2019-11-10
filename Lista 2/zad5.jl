# Aleksandra Malinowska 244925

#funkcja przeprowadzająca 40 iteracji wyrazenia
# type - typ arytmetyki
function experiment(type)
    #dane początkowe
    p = type(0.01) 
    r = 3

    println("Standard exp type ", type)
    for i in 1:40
        p = p + r * p * (one(type) - p)
        println(p)
    end
    println("======================\n")
end

#funkcja przeprowadzająca 40 iteracji wyrazenia z obcięciem po 10 iteracji
function experimentMod()
    #dane początkowe
    p = Float32(0.01)
    r = 3

    println("Modified exp")
    for i in 1:10
        p = p + r * p * (one(Float32) - p)
        println(p)
    end
    p = trunc(p, digits=3) #obcięcie do 3 miejsc po przecinku
    for i in 11:40
        p = p + r * p * (one(Float32) - p)
        println(p)
    end
    println("======================\n")
end

experiment(Float32);
experimentMod();
experiment(Float64);