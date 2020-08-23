# REPLHistory.jl

Gain access to the Julia REPL history.

Example:
```
julia> using Pkg; pkg"add REPLHistory"           
                                                            
julia> a = rand(3)                                          
                                                            
3-element Array{Float64,1}:                                 
 0.7650591549676755                                         
 0.37080326489156024                                        
 0.2852039006568494                                         
                                                            
shell> pwd                                                  
                                                            
/c/Users/PetrKrysl/Documents/Work-in-progress/Experiments   
                                                            
julia> b = deepcopy(a)                                      
                                                            
3-element Array{Float64,1}:                                 
 0.7650591549676755                                         
 0.37080326489156024                                        
 0.2852039006568494                                         
                                                            
julia> b[1] = 0                                             
                                                            
0                                                           
                                                            
julia> @show b                                              
b = [0.0, 0.37080326489156024, 0.2852039006568494]          
3-element Array{Float64,1}:                                 
 0.0                                                        
 0.37080326489156024                                        
 0.2852039006568494                                         
                                                            
julia> @history 7                                           
a = rand(3)                                                 
;pwd                                                        
b = deepcopy(a)                                             
b[1] = 0                                                    
@show b                                                     
```
