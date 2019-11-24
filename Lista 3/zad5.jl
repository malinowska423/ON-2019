# Aleksandra Malinowska 244925

include("Pierwiastki.jl")

delta = Float64(1.0 / 10.0^4)
epsilon = delta
f(x) = 3 * x - exp.(x)

#funkcja wyświetlająca wynik metody bisekcji dla danego przedziału [a,b]
function printZerosBisect(a,b)
    print("[", a,",", b, "];")
    Pierwiastki.printTuple(Pierwiastki.mbisekcji(f, a, b, delta, epsilon))
end

println("Przedział;x;f(x);Iteracje")
printZerosBisect(Float64(0.4), Float64(0.8))
printZerosBisect(Float64(1.4), Float64(1.6))