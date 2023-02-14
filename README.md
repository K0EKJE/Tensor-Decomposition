# Tensor-Decomposition and its Application

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
- Taking the Frobenius norm of difference of approximated tensor and original tensor over the norm of original tensor as ratio of maintained information, Tucker decomposition model with a $R$ value of 20 gives $ratio = 0.9941$, a $R$ value of 20 gives $ratio = 0.9984$, and a $R$ value of 60 gives $ratio = 0.9995$. 
- Overall, CP decomposition performs well extracting and visualizing different modes in a tensor by analyzing the decomposed matrices separately, and it can successfully extract the extra factor when a new one is added to the original data. But for a higher order tensor CP decomposition shows a much worse result compared with Tucker decomposition no matter in terms of loss or running time. 


## References used in the paper (final draft in progress)
[1] Andersson, Claus A, and Rasmus Bro. “The N-Way Toolbox for MATLAB.” Chemometrics and Intelligent Laboratory Systems, vol. 52, no. 1, 2000, pp. 1–4.

[2] Carroll, J. Douglas and Jih Jie Chang. “Analysis of individual differences in multidimensional scaling via an n-way generalization of “Eckart-Young” decomposition.” Psychometrika 35 1970, pp. 283-319.

[3] B. Chen, A. Petropolu, and L. De Lathauwer. "Blind identification of convolutive MIM systems with 3 sources and 2 sensors." Applied Signal Processing} 2002, pp. 487–496. 

[4] Rahmani, Dhouha, and Haïfa Nakouri. “Robust Handwritten Digit Classification Using Tensors Decomposition.” Mining Intelligence and Knowledge Exploration 2020, pp. 260–269. 

[5] Kolda, Tamara. “Multilinear Operators for Higher-Order Decompositions.” 2006.


[6] Brunton, Steven L., and J. Nathan Kutz. “Singular Value Decomposition (SVD).” Data-Driven Science and Engineering Machine Learning, Dynamical Systems, and Control. Cambridge University Press 2022, pp. 41–46. 

[7] Kolda, Tamara G., and Brett W. Bader. “Tensor Decompositions and Applications.” SIAM Review, vol. 51, no. 3, 2009, pp. 455–500. 
Andersson, Claus A, and Rasmus Bro. “The N-Way Toolbox for MATLAB.” Chemometrics and Intelligent Laboratory Systems, vol. 52, no. 1, 2000, pp. 1–4.. 
