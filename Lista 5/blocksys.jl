#Aleksandra Malinowska 244925


module blocksys
    include("zad1.jl")
    include("zad2.jl")
    include("zad3.jl")
    include("matrixgen.jl")

    using SparseArrays, LinearAlgebra, .matrixgen

    export eliminacjaGaussa, eliminacjaGaussaZWyborem, rozwiazUkladGauss, rozwiazUkladGaussZWyborem, rozkladLU, rozkladLUZWyborem, rozwiazUkladLU, rozwiazUkladLUZWyborem, pobierzMacierz, generujWektorB, pobierzMacierzIWektor, zapiszDoPliku

    function pobierzMacierz(filepath::String)
        local data = C_NULL

        open(filepath, "r") do file
            sizes = split(readline(file), " ")
            n = parse(Int64, sizes[1])
            l = parse(Int64, sizes[2])

            A::SparseMatrixCSC{Float64, Int64} = spzeros(Float64, n, n)

            for line in eachline(file)
                data = split(line, " ")
                i = parse(Int64, data[1])
                j = parse(Int64, data[2])
                value = parse(Float64, data[3])

                A[i, j] = value
            end

            data = (A, n, l)
        end
        return data
    end
    
    
    function pobierzWektor(filepath::String)
        open(filepath) do file
            n = parse(Int64, readline(file))
            b = Vector{Float64}(undef, n)
            i = 1
            while !eof(file)
                b[i] = parse(Float64, readline(file))
                i += 1
            end
            return b
        end
    end
    
    
    
    function generujWektorB(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)
     b = Vector{Float64}(undef, n)

        for i = 1:n
            b[i] = Float64(0.0)
            start = max(1, i - (l + 1))
            last  = min(n, i + (l + 1))

            for j = start:last
                b[i] += A[i, j]
            end
        end

        return b
    end

    function pobierzMacierzIWektor(matrixFilepath::String, vectorFilepath::String)
        A, n, l = pobierzMacierz(matrixFilepath)
        b = pobierzWektor(vectorFilepath)
        return A, b, n, l
    end

    function pobierzMacierzIWektor(matrixFilepath::String, n::Int64, l::Int64, cond::Float64)
        blockmat(n, l, cond, matrixFilepath)
        A, n, l = pobierzMacierz(matrixFilepath)
        b = generujWektorB(A, n, l)
        return A, b, n, l
    end

    function zapiszDoPliku(filepath::String, x::Vector{Float64}, n::Int64, is_b_gen::Bool)
        open(filepath, "w") do file
            if is_b_gen 
                x_initial = ones(n)
                error = zero(Float64)
                error = norm(x_initial - x) / norm(x)
                println(file, error)
            end
    
            for i = 1:n
                println(file, x[i])
            end
        end
    end
     
    
end