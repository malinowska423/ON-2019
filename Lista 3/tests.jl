# Aleksandra Malinowska 244925

include("Pierwiastki.jl")


f1(x) = x^2 -5*x + 6
pf1(x) = 2*x - 5

f2(x) = 5*x^3 
pf2(x) = 15*x^2

f3(x) = -x^4 + 2
pf3(x) = -4*x^3

delta = 0.5 * (1.0/10.0^5)
epsilon = delta
maxit = 50

# testy metody bisekcji

println("==================== METODA BISEKCJI =======================")
a = 1.5
b = 2.5
Pierwiastki.printTuple(Pierwiastki.mbisekcji(f1, a, b, delta, epsilon))
a = 2.5
b = 3.5
Pierwiastki.printTuple(Pierwiastki.mbisekcji(f1, a, b, delta, epsilon))
a = -1.0
b = 3.0
Pierwiastki.printTuple(Pierwiastki.mbisekcji(f2, a, b, delta, epsilon))
a = 5.0
b = 10.0
Pierwiastki.printTuple(Pierwiastki.mbisekcji(f2, a, b, delta, epsilon))
a = 0.5
b = 4.0
Pierwiastki.printTuple(Pierwiastki.mbisekcji(f3, a, b, delta, epsilon))
a = 5.0
b = 10.0
Pierwiastki.printTuple(Pierwiastki.mbisekcji(f3, a, b, delta, epsilon))


#testy metody Newtona

println("==================== METODA NEWTONA =======================")
x0 = 1.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f1, pf1, x0, delta, epsilon, maxit))
x0 = 10000000000000000.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f1, pf1, x0, delta, epsilon, maxit))
x0 = 0.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f1, pf1, x0, delta, epsilon, maxit))
x0 = 1.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f2, pf1, x0, delta, epsilon, maxit))
x0 = 10000000000000000.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f2, pf1, x0, delta, epsilon, maxit))
x0 = 0.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f2, pf1, x0, delta, epsilon, maxit))
x0 = 1.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f3, pf1, x0, delta, epsilon, maxit))
x0 = 10000000000000000.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f3, pf1, x0, delta, epsilon, maxit))
x0 = 0.0
Pierwiastki.printTuple(Pierwiastki.mstycznych(f3, pf1, x0, delta, epsilon, maxit))

#testy metody siecznych

println("==================== METODA SIECZNYCH =======================")
x0 = 0.0
x1 = 3.0
Pierwiastki.printTuple(Pierwiastki.msiecznych(f1, x0, x1, delta, epsilon, maxit))
x0 = -0.5
x1 = 0.5
Pierwiastki.printTuple(Pierwiastki.msiecznych(f1, x0, x1, delta, epsilon, maxit))
x0 = 0.0
x1 = 3.0
Pierwiastki.printTuple(Pierwiastki.msiecznych(f2, x0, x1, delta, epsilon, maxit))
x0 = 100000000.0
x1 = 100000000000.0
Pierwiastki.printTuple(Pierwiastki.msiecznych(f2, x0, x1, delta, epsilon, maxit))
x0 = 0.0
x1 = 3.0
Pierwiastki.printTuple(Pierwiastki.msiecznych(f3, x0, x1, delta, epsilon, maxit))
x0 = 100000000.0
x1 = 100000000000.0
Pierwiastki.printTuple(Pierwiastki.msiecznych(f3, x0, x1, delta, epsilon, maxit))