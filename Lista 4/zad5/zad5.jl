# Aleksandra Malinowska 244925

include("./../Interpolacja.jl")

#wywolanie dla danych z podpunktu a)
f(x) = exp.(x)
a = Float64(0.0)
b = Float64(1.0)
for i in [5,10,15]
    Interpolacja.rysujNnfx(f, a, b, i)
end

#wywolanie dla danych z podpunktu b)
g(x) = (x^2) * sin.(x) 
a = Float64(-1.0)
b = Float64(1.0)
for i in [5,10,15]
    Interpolacja.rysujNnfx(f, a, b, i)
end
