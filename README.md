# REPLHistory.jl

Gain access to the Julia REPL history.

## Usage

A single function is exported for interactive use: `history`. This function
takes a single argument (with the default value of 5), the number of
interactive commands submitted to the REPL in the past to include, starting
from the latest one backwards in history. It returns the commands concatenated with newlines. This can be then printed as `print(history())`.

## Example

Execute the sequence below:
``` 
using REPLHistory
a = rand(3) 
;pwd 
print(history())
b = deepcopy(a)    
print(history(2))
b[1] = 0   
@show b  
print(history(10))   
a = rand(3)
;pwd    
b = deepcopy(a) 
b[1] = 0
@show b 
print(history(20))    
```
The results will be:
```
julia> using REPLHistory    
    
julia> a = rand(3)   
3-element Array{Float64,1}:  
 0.8248424068780429  
 0.4956312303055743  
 0.13391511546050272 

shell> pwd 
/c/Users/PKrysl/Documents/work/REPLHistory.jl

julia> print(history()) 
using Pkg; Pkg.activate("."); Pkg.instantiate()   
using REPLHistory    
a = rand(3)
;pwd 

julia> b = deepcopy(a)  
3-element Array{Float64,1}:  
 0.8248424068780429  
 0.4956312303055743  
 0.13391511546050272 

julia> print(history(2))
b = deepcopy(a) 

julia> b[1] = 0 
0    

julia> @show b  
b = [0.0, 0.4956312303055743, 0.13391511546050272]
3-element Array{Float64,1}:  
 0.0 
 0.4956312303055743  
 0.13391511546050272 

julia> print(history(10))    
using Pkg; Pkg.activate("."); Pkg.instantiate()   
using REPLHistory    
a = rand(3)
;pwd 
print(history())
b = deepcopy(a) 
print(history(2))    
b[1] = 0   
@show b    

julia> a = rand(3)   
3-element Array{Float64,1}:  
 0.8970943418570541  
 0.39013199187719416 
 0.40778370172694367 

shell> pwd 
/c/Users/PKrysl/Documents/work/REPLHistory.jl

julia> b = deepcopy(a)  
3-element Array{Float64,1}:  
 0.8970943418570541  
 0.39013199187719416 
 0.40778370172694367 

julia> b[1] = 0 
0    

julia> @show b  
b = [0.0, 0.39013199187719416, 0.40778370172694367]    
3-element Array{Float64,1}:  
 0.0 
 0.39013199187719416 
 0.40778370172694367 

julia> print(history(20))    
b = deepcopy(a) 
b[1] = 0   
@show b    
using Pkg; Pkg.activate("."); Pkg.instantiate()   
using REPLHistory    
a = rand(3)
;pwd 
print(history())
b = deepcopy(a) 
print(history(2))    
b[1] = 0   
@show b    
print(history(10))   
a = rand(3)
;pwd 
b = deepcopy(a) 
b[1] = 0   
@show b    

julia> 
```