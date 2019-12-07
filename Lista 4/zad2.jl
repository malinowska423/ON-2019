# Aleksandra Malinowska 244925

#funkcja obliczajaca wartosc wielomianu w postaci Newtona w punkcie t
# x - wektor zawieracy wezly
# fx - wektor zawieracy ilorazy roznicowe
# t - punkt, dla którego obliczamy wartosc wielomianu
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    n = length(x)   #dlugosc wektora
    nt = fx[n]  #wartość wielomianu w punkcie t

    for i = n - 1:-1:1
        nt = fx[i] + (t-x[i]) * nt
    end

    return nt
end
