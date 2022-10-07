#packages required for the project. This part of code is inactive because you have to run it only once
#using Pkg
#Pkg.add("CSV")
#Pkg.add("DataFrames")

#reading the .csv file
using DataFrames
df=DataFrames.DataFrame

using CSV
csv_reader=CSV.read("StackOverflowQuestions.csv", df)

#describe(csv_reader, :last)

#analizing data
using Statistics
println(Statistics.mean(csv_reader[!, :votes]))
println(Statistics.std(csv_reader[!, :votes]))
println(Statistics.rand(csv_reader[!, :votes], 4))

#using for-loop and string manipulations
for x in names(csv_reader)[1:end-1] 
    for y in names(csv_reader)[1:end-1] 
      println("$x + $y \t ") 
    end 
    println("--------------------------------------------") 
end

#converting dataframes and back
array_df=select(csv_reader,:votes, :date)
array=Matrix(array_df)
array_df=DataFrame(array,:auto)

#saving dataframes
CSV.write("result.csv", array_df)