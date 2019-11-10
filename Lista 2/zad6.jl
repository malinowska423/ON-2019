# Aleksandra Malinowska 244925

#funkcja przeprowadzająca 40 iteracji wyrazenia
# c - stała
# x_0 - początkowy x
function experiment(c, x_0)
    println("x_0=", x_0)
    println("c=", c)
    prev = x_0
    for i in 1:40
        x = prev^(2.0) + c
        println(x)
        prev = x
    end
    println("===========================\n")
end

experiment(-2.0, 1.0)
experiment(-2.0, 2.0)
experiment(-2.0, 1.99999999999999)
experiment(-1.0, 1.0)
experiment(-1.0, -1.0)
experiment(-1.0, 0.75)
experiment(-1, 0.25)