# Aleksandra Malinowska 244925

include("Pierwiastki.jl")

f(x) = sin.(x) - (0.5 * x)^2
delta = Float64(0.5 * (1.0/10.0^5))
epsilon = delta
maxit = Int(50)

println("Metoda;x_0;f(x_0);Iteracje;Błąd")

#wyświetlanie wyników dla metody bisekcji
a = Float64(1.5)
b = Float64(2.0)
print("bisekcji;")
Pierwiastki.printTuple(Pierwiastki.mbisekcji(f, a, b, delta, epsilon))


#wyświetlanie wyników dla metody Newtona
pf(x) = cos.(x) - 0.5x
x0 = Float64(1.5)
print("Newtona;")
Pierwiastki.printTuple(Pierwiastki.mstycznych(f, pf, x0, delta, epsilon, maxit))


#wyświetlanie wyników dla metody siecznych
x0 = Float64(1.0)
x1 = Float64(2.0)
print("stycznych;")
Pierwiastki.printTuple(Pierwiastki.msiecznych(f, x0, x1, delta, epsilon, maxit))
