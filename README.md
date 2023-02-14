# Tensor-Decomposition

Data visualization is commonly used to help abstract out and interpret the useful information in a dataset. But the visualization of multi-dimensional data is still difficult. Tensor decomposition is capable of breaking a multi-way tensor down to different components of low rank tensors, so the visualization of a tensor's components will be a good substitution since the important features are contained in these components. 

To illustrate the process, for the first part of the research I visualize the modes in an artificial tensor, created from two spatial-temporal functions, by PARAFAC decomposition from the N-way toolbox. More specifically, I defined the spatial-temporal functions with several exponential, Hermite, trigonometric, and hyperbolic terms. A combination of some of them will create a factor function that generates special modes along different dimensions according to input. For instance, if the factor is $sin(x)$, then it will create a cycling mode along the x axis. The summation of two or three of such factors will generate the final spatial-temporal functions; in other words, the tensor generated from the spatial-temporal functions ought to have two to three modes along each dimension. One thing to note is that since the output of the functions is a tensor, a multi-dimensional array, the inputs to the function are of same dimension as the tensor and all calculations are entry-wised. I used the meshed grid of three vectors, x, y and t, to create modes along the three axis x, y and time, where x and y represent the spacial information and t represents time. 

An example two-factor spatial temperal function is shown as below： 
$G_n(Z,X,Y,T) = F_{n}(Z) * cos(\frac{3}{2}T)+(sech (X) * tanh \left( X\right)  * e^{-0.2Y^2}) *sin(T)$

X,Y,T are meshgrids generated with three vectors x, y, t. Z is the sum of squared X and Y. n is the order of Hermite polynomial, and we may set it to be constant 2 here. The fraction $\frac{1}{100}$ is just for plotting purpose. All calculations involved are entry-wised calculations. They will generate various modes for the resulted tensor, where x, y and t will create spacial and temporal modes, respectively. An understanding of the shape and pattern of these component factor will provide context for results from tensor decomposition. 

An example output is 

![image](https://github.com/K0EKJE/Tensor-Decomposition/blob/main/example_outputs/3c8e4eee564b8d3e6ce108936c2eee4.png)

The second half of the research focuses on image compression problem with different tensor decomposition mathods and different model tank. From low rank to high rank tucker model, the reconstructed image tends to be more clear.  

![image](https://github.com/K0EKJE/Tensor-Decomposition/blob/main/example_outputs/d56cae0a9173be485dd812a0fd3f5a7.png)

Here is an example graph comparing computational cost and loss against model rank for tucker decomposition. 

![image](https://user-images.githubusercontent.com/95905185/218628603-61e6494f-13af-4fc3-90b3-aee9651cc431.png)


## Conclusion
- When working with higher order data, CP decomposition shows a linear increase in computational time as the model rank increases; while Tucker decomposition runs constantly fast. 
- The increase in the order of CP decomposition model does not ensure the decrease in data loss; instead, the loss shows an increasing trend. On the other hand, a larger rank of the core tensor results in lower loss. 
- Overall, CP decomposition performs well extracting and visualizing different modes in a tensor by analyzing the decomposed matrices separately, and it can successfully extract the extra factor when a new one is added to the original data. But for a higher order tensor CP decomposition shows a much worse result compared with Tucker decomposition no matter in terms of loss or running time. 
