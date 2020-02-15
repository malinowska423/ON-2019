# Aleksandra Malinowska 244925

include("Interpolacja.jl")

#funkcja testujaca
function test(val1, val2)
    println(val1, "\t?\t", val2, " = ", val1 .== val2)
end

# #testy funkcji z zadania 1
# x1 = [3.0, 1.0, 5.0, 6.0]
# f1 = [1.0, -3.0, 2.0, 4.0]
# expected_output_1 = [1.0, 2.0, -3.0 / 8.0, Float64(7.0 / 40.0)]

# x2 = [-1.0, 0.0, 1.0, 2.0, 3.0]
# f2 = [2.0, 1.0, 2.0, -7.0, 10.0]
# expected_output_2 = [2.0, -1.0, 1.0, -2.0, 2.0]

# test(Interpolacja.ilorazyRoznicowe(x1, f1), expected_output_1)
# test(Interpolacja.ilorazyRoznicowe(x2, f2), expected_output_2)


# #testy funkcji z zadania 2
# fx2 = Interpolacja.ilorazyRoznicowe(x2, f2)

# test(Interpolacja.warNewton(x2, fx2, 2.0), -7.0)
# test(Interpolacja.warNewton(x2, fx2, 10.0), 13961.0)
# test(Interpolacja.warNewton(x2, fx2, 5.0), 506.0)
# test(Interpolacja.warNewton(x2, fx2, -3.0), 298.0)

# #testy funkcji z zadania 3
# expected_output_3 = [1.0, 6.0, -1.0, -6.0, 2.0]
# test(Interpolacja.naturalna(x2, fx2), expected_output_3)


x_i = [-1.0, 0.0, 1.0, 2.0]
f_i = [-1.0, 0.0, -1.0, 2.0]

c = Interpolacja.ilorazyRoznicowe(x_i, f_i)
w_i = Vector{Float64}(undef, 4)
for i = 1:4
    w_i[i] = Interpolacja.warNewton(x_i, c, x_i[i])
end

println(w_i)
println(Interpolacja.naturalna(w_i, c))