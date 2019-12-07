# Aleksandra Malinowska 244925

using Plots

#funkcja interpolujaca funkcje f(x) wielomianem w(x) oraz rysujaca f(x) i w(x)
# f - funkcja f(x)
# a - poczatek przedzialu interpolacji
# b - koniec przedzialu interpolacji
# n - stopien wielomianu interpolacyjnego
function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    nodes = n + 1   #ilosc wezlow
    x = Vector{Float64}(undef, nodes)   #wektor wezlow
    f_x = Vector{Float64}(undef, nodes) #wektor wartosci funkcji w wezlach
    c = Vector{Float64}(undef, nodes)   #wektor ilorazow roznicowych
    h = (b - a) / n #odleglosc miedzy wezlami
    
    for i = 1:nodes
        x[i] = a + (i - 1) * h
        f_x[i] = f(x[i])
    end
    c = ilorazyRoznicowe(x, f_x)

    #obliczanie wartosci potrzebnych do rysowania wykresu

    nodes = nodes * 15  #wezly potrzebne do wykresu
    plot_x = Vector{Float64}(undef, nodes)  #wektor argumentow wykresu
    plot_f_x = Vector{Float64}(undef, nodes)    #wektor wartosci f(x) na wykresie
    plot_w_x = Vector{Float64}(undef, nodes)    #wektor wartosci w(x) na wykresie
    h = (b - a) / (nodes - 1)   #odleglosc miedzy argumentami na wykresie

    for i = 1:nodes
        plot_x[i] = a + (i - 1) * h
        plot_f_x[i] = f(plot_x[i])
        plot_w_x[i] = warNewton(x, c, plot_x[i])
    end
    title = string("Interpolacja ", f, "(x) dla n=", n) #tytul wykresu oraz pliku
    drawPlot(plot_x, plot_f_x, plot_w_x, title)

end

#funkcja rysujaca wykres
# args - wektor arguemntow, dla ktorych narysowany bedzie wykres
# seriesA - wektor wartosci serii A
# seriesB - wektor wartosci serii B
# title - tytul wykresu oraz pliku .png
function drawPlot(args::Vector{Float64}, seriesA::Vector{Float64}, seriesB::Vector{Float64}, title) 
    data = [seriesA seriesB]
    labels = ["f(x)" "w(x)"]
    markercolors = [:green :red]
    plot_title = title
    plot(args, data, label = labels, color = markercolors, linewidth = 1.0, title = plot_title)
    png(title)
end