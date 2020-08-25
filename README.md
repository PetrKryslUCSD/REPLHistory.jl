# REPLHistory.jl

Gain access to the Julia REPL history.

## Usage

A single function is exported for interactive use: `history`. This function
takes a single argument (with the default value of 5), the number of
interactive commands submitted to the REPL in the past to include, starting
from the latest one backwards in history. It returns the commands concatenated with newlines. This can be then printed as `print(history())`.

### Warning

The idea is that the history print out will be immediately executable again:
just copy and paste into the REPL. However, it is impossible at the moment
handle correctly the package mode. The package mode is persistent: this means a
single `]` command puts us into the package mode, so if this is followed by
anything else both package mode commands, they will be interpreted
incorrectly.

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
∇ϕ(x) = grad(x) 
ab = "ααα"    
?sin
pkg"add REPL"
print(history(20)) 
```
The results will be:
```
julia> using REPLHistory        
          
julia> a = rand(3)   
3-element Array{Float64,1}:     
 0.01055106134438355 
 0.10007414910998613 
 0.5861347393256893  
          
shell> pwd
/c/Users/PKrysl/Documents/work/REPLHistory.jl         
          
julia> print(history())         
using Pkg; Pkg.activate("."); Pkg.instantiate()       
using REPLHistory    
a = rand(3)          
;pwd      
          
julia> b = deepcopy(a)          
3-element Array{Float64,1}:     
 0.01055106134438355 
 0.10007414910998613 
 0.5861347393256893  
          
julia> print(history(2))        
b = deepcopy(a)      
          
julia> b[1] = 0      
0         
          
julia> @show b       
b = [0.0, 0.10007414910998613, 0.5861347393256893]    
3-element Array{Float64,1}:     
 0.0      
 0.10007414910998613 
 0.5861347393256893  
          
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
 0.8665087392935031  
 0.11199225659344902 
 0.29069812542350637 
          
shell> pwd
/c/Users/PKrysl/Documents/work/REPLHistory.jl         
          
julia> b = deepcopy(a)          
3-element Array{Float64,1}:     
 0.8665087392935031  
 0.11199225659344902 
 0.29069812542350637 
          
julia> b[1] = 0      
0         
          
julia> @show b       
b = [0.0, 0.11199225659344902, 0.29069812542350637]   
3-element Array{Float64,1}:     
 0.0      
 0.11199225659344902 
 0.29069812542350637 
          
julia> print(history(20))       
sin       
]st       
]pkg"add REPL"       
]print(history(20))  
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
          
julia> ∇ϕ(x) = grad(x)          
∇ϕ (generic function with 1 method)        
          
julia> ab = "ααα"    
"ααα"     
          
help?> sin
search: sin sinh sind sinc sinpi sincos sincosd asin using isinf asinh asind isinteger isinteractive thisind sign signed Signed signbit significand islink occursin isfinite   
          
  sin(x)  
          
  Compute sine of x, where x is in radians.
          
  ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────  
          
  sin(A::AbstractMatrix)        
          
  Compute the matrix sine of a square matrix A.       
          
  If A is symmetric or Hermitian, its eigendecomposition (eigen) is used to compute the sine. Otherwise, the sine is determined by calling exp.          
          
  Examples
  ≡≡≡≡≡≡≡≡≡≡         
          
  julia> sin(fill(1.0, (2,2)))  
  2×2 Array{Float64,2}:         
   0.454649  0.454649
   0.454649  0.454649
          
julia> pkg"add REPL" 
No Changes to `C:\Users\PKrysl\Documents\work\REPLHistory.jl\Manifest.toml` 
          
julia> print(history(20))       
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
∇ϕ(x) = grad(x)      
ab = "ααα"
?sin      
pkg"add REPL"        
          
julia> 
```