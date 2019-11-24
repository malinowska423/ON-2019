# Aleksandra Malinowska 244925

include("Pierwiastki.jl")

#funkcja wyświetlająca wynik metody bisekcji dla funkcji f w przedziale [a,b]
function printZerosBisect(a, b, f)
    print("[", a, ",", b, "];")
    Pierwiastki.printTuple(Pierwiastki.mbisekcji(f, a, b, delta, epsilon))
end

#funkcja wyświetlająca wynik metody bisekcji dla funkcji f, jej pochodnej df oraz punktu początkowego x0
function printZerosNewton(f, df, x0)
    print(x0, ";")
    Pierwiastki.printTuple(Pierwiastki.mstycznych(f, df, x0, delta, epsilon, maxit))
end

#funkcja wyświetlająca wynik metody siecznych dla funkcji f dla punktów początkowych x0 i x1
function printZerosSecant(f, x0, x1)
    print(x0, ";", x1, ";")
    Pierwiastki.printTuple(Pierwiastki.msiecznych(f, x0, x1, delta, epsilon, maxit))
end


f1(x) = exp.(1.0 - x) - 1.0
f2(x) = x * exp.(-x)
delta = Float64(1.0 / 10.0^5)
epsilon = delta
maxit = 1000

println("==================== METODA BISEKCJI =======================")

println("Przedział;x;f(x);Iteracje;Błąd")
println("f_1")
intervals = [(0.8, 1.2), (-1.7, 2.4), (0.9, 10.0), (-50.1113, 2.884)]
for iv in intervals
    printZerosBisect(iv[1], iv[2], f1)
end

println("f_2")
intervals = [(-1.0, 1.0), (-0.1, 10.0), (-2.0, 5.0), (-17.323, 24.675)]
for iv in intervals
    printZerosBisect(iv[1], iv[2], f2)
end


println("==================== METODA NEWTONA =======================")

df1(x) = -exp.(1.0 - x)
println("x_0;x;f(x);Iteracje;Błąd")
println("f_1")
starts = [-1.0, 0.0, 1.1, 2.0, 6.0, 8.0, 15.00]
for s in starts
    printZerosNewton(f1, df1, s)
end

df2(x) = -exp.(-x) * (x - 1.0)
println("f_2")
starts = [-1.0, -0.4, 0.0, 1.0, 6.0, 8.0, 15.00]
for s in starts
    printZerosNewton(f2, df2, s)
end

println("==================== METODA SIECZNYCH =======================")

println("x_0;x_1;x;f(x);Iteracje;Błąd")
println("f_1")
starts = [(-2.0, -1.0), (-1.3, -0.8), (0.1, 1.3), (-2.0, 6.0), (-100.0, -10.0)]
for s in starts
    printZerosSecant(f1, s[1], s[2])
end

println("f_2")
for s in starts
    printZerosSecant(f2, s[1], s[2])
end