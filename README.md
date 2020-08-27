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
handle correctly the shell, help, and package mode. These commands when found in the history will be preceded with the comment character (`#`).

## Example 1

Execute the sequence below:
``` 
using REPLHistory
a = rand(3) 
;pwd 
print(history())
```
The results will be:
```
julia> using REPLHistory  

julia> a = rand(3)  
3-element Array{Float64,1}:
 0.3503085956446701 
 0.6651645270310433 
 0.8954025140365991 

shell> pwd
/c/Users/PKrysl/Documents/work/REPLHistory.jl  

julia> print(history())
using Pkg; Pkg.activate("."); Pkg.instantiate()
using REPLHistory
a = rand(3)
#;pwd
```

## Example 2

Execute the sequence below:
``` 
using REPLHistory
b = deepcopy(a) 
print(history(2))
b[1] = 0
@show b  
print(history())
```
The results will be:
```
julia> using REPLHistory

julia> b = deepcopy(a)  
3-element Array{Float64,1}:
 0.3503085956446701 
 0.6651645270310433 
 0.8954025140365991 

julia> print(history(2))
b = deepcopy(a)  

julia> b[1] = 0  
0

julia> @show b
b = [0.0, 0.6651645270310433, 0.8954025140365991] 
3-element Array{Float64,1}:
 0.0
 0.6651645270310433 
 0.8954025140365991 

julia> print(history()) 
b = deepcopy(a)  
print(history(2))
b[1] = 0  
@show b 
```

## Example 3

Execute the sequence below:
``` 
using REPLHistory
print(history(20))  
∇ϕ(x) = grad(x) 
ab = "ααα" 
?sin
using Pkg; Pkg.status();
print(history(4)) 
```
The results will be:
```
julia> using REPLHistory

julia> print(history(20))  
print(history()) 
using Pkg; Pkg.activate("."); Pkg.instantiate()
using REPLHistory
a = rand(3)
#;pwd  
print(history()) 
using REPLHistory
b = deepcopy(a)  
print(history(2))
b[1] = 0  
@show b
using REPLHistory
b = deepcopy(a)  
print(history(2))
b[1] = 0  
@show b
print(history()) 
using Pkg; Pkg.activate("."); Pkg.instantiate()
using REPLHistory

julia> ∇ϕ(x) = grad(x)  
∇ϕ (generic function with 1 method)  

julia> ab = "ααα"
"ααα"  

help?> sin
search: sin sinh sind sinc sinpi sincos sincosd asin using isinf asinh asind isinteger 

  sin(x)  

  Compute sine of x, where x is in radians. 

  ──────────────────────────────────────────────────────────────────────────────────────  

  sin(A::AbstractMatrix)

  Compute the matrix sine of a square matrix A.

  If A is symmetric or Hermitian, its eigendecomposition (eigen) is used to compute the
  sine. Otherwise, the sine is determined by calling exp.

  Examples
  ≡≡≡≡≡≡≡≡≡≡  

  julia> sin(fill(1.0, (2,2)))
  2×2 Array{Float64,2}: 
0.454649  0.454649
0.454649  0.454649

julia> using Pkg; Pkg.status();
Project REPLHistory v0.1.0 
Status `C:\Users\PKrysl\Documents\work\REPLHistory.jl\Project.toml`
  [b77e0a4c] InteractiveUtils 
  [44cfe95a] Pkg 
  [3fa0cd96] REPL
  [8dfed614] Test

julia> print(history(4))
ab = "ααα"
#?sin  
using Pkg; Pkg.status();

julia> 
```


## Example 4

Execute the sequence below (you will have to press BACKSPACE after `]st`):
``` 
using REPLHistory
]st
∇ϕ(x) = grad(x) 
ab = "ααα" 
?sin
using Pkg; Pkg.status();
print(history(14)) 
```
The results will be:
```
julia> using REPLHistory

(REPLHistory) pkg> st   
Project REPLHistory v0.1.0    
Status `C:\Users\PKrysl\Documents\work\REPLHistory.jl\Project.toml`     
  [b77e0a4c] InteractiveUtils 
  [44cfe95a] Pkg  
  [3fa0cd96] REPL 
  [8dfed614] Test 

julia> ∇ϕ(x) = grad(x)  
∇ϕ (generic function with 1 method) 

julia> ab = "ααα" 
"ααα" 

help?> sin  
search: sin sinh sind sinc sinpi sincos sincosd asin using isinf asinh asind isinteger    

  sin(x)    

  Compute sine of x, where x is in radians.     

  ──────────────────────────────────────────────────────────────────────────────────────  

  sin(A::AbstractMatrix)

  Compute the matrix sine of a square matrix A. 

  If A is symmetric or Hermitian, its eigendecomposition (eigen) is used to compute the   
  sine. Otherwise, the sine is determined by calling exp.   

  Examples  
  ≡≡≡≡≡≡≡≡≡≡

  julia> sin(fill(1.0, (2,2)))
  2×2 Array{Float64,2}: 
   0.454649  0.454649   
   0.454649  0.454649   

julia> using Pkg; Pkg.status();     
Project REPLHistory v0.1.0    
Status `C:\Users\PKrysl\Documents\work\REPLHistory.jl\Project.toml`     
  [b77e0a4c] InteractiveUtils 
  [44cfe95a] Pkg  
  [3fa0cd96] REPL 
  [8dfed614] Test 

julia> print(history(14))     
print(history(14))
using Pkg; Pkg.activate("."); Pkg.instantiate() 
using REPLHistory 
∇ϕ(x) = grad(x)   
ab = "ααα"  
using Pkg; Pkg.status();
using Pkg; Pkg.activate("."); Pkg.instantiate() 
using REPLHistory 
   #]st     
∇ϕ(x) = grad(x)   
ab = "ααα"  
   #?sin    
using Pkg; Pkg.status();

julia> 
```