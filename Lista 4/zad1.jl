# Aleksandra Malinowska 244925

#funkcja obliczajaca ilorazy roznicowe
# x - wektor zawierajacy wezly
# f - wektor zawierajacy wartosci funkcji w wezlach
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    n = length(f) #dlugosc wektora
    d = Vector{Float64}(undef, n)   #wektor zawierajacy ilorazy roznicowe

    for i in 1:n
        d[i] = f[i]
    end

    for i = 2:n
        for j = n:-1:i
            d[j] = (d[j] - d[j - 1]) / (x[j] - x[j - i + 1])
        end
    end

    return d
end