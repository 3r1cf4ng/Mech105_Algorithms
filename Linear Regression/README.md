# Linear Regression
This function takes a collection of data to make a line of best fit for the given data. The algorithm calculates and identifies what is an outlier using quartiles, and removes them. The data is then sorted by the order of y values. Then the linear regression is computed for the sorted and filtered data set, also providing the R squared value.
### Inputs
* x - x values of the data set
* y - y values of the data set
### Outputs
* fX - the sorted and filtered x values of the data set
* fY - the sorted and filtered y values of the data set
* slope - the slope of the linear regression line (m of f(x)=mx+b)
* intercept - the intercept of the linear regression line (b of f(x)=mx+b)
* Rsquared - the value that explains the spread of the data about the linear regression line
