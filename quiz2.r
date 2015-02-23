# Question 1
Consider the following data with x as the predictor and y as as the outcome.

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62) 
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36) 
Give a P-value for the two sided hypothesis test of whether β1 from a linear regression model is 0 or not.

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y~x)
summary(fit)
# Answer: 0.05296

# Question 2

Consider the previous problem, give the estimate of the residual standard deviation.
# Answer: 0.223

# Question 3
In the mtcars data set, fit a linear regression model of weight (predictor) on mpg (outcome). 
Get a 95% confidence interval for the expected mpg at the average weight. What is the lower endpoint?

# Use lm(mpg ~ wt) on the data(mtcars) and get the coefficients.
data(mtcars)
fit <- lm(mpg~wt, data=mtcars)
summary(fit)
mean_weight <- data.frame(wt = c(mean(mtcars$wt)))
predict(fit, mean_weight, interval='confidence')
# Answer: 18.99098

# Question 4
Refer to the previous question. Read the help file for mtcars. What is the weight coefficient interpreted as?

# wt is Weight (lb/1000)
help(mtcars)
# Answer: The estimated expected change in mpg per 1,000 lb increase in weight.

# Question 5
Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (1,000 lbs). 
A new car is coming weighing 3000 pounds. Construct a 95% prediction interval for its mpg. What is the upper endpoint?

# The new data point is a car weighing 3000 lbs. The model variable is per 1000 lbs so divide.
# The prediction interval of the mean weight outcome.
data(mtcars)
fit <- lm(mpg~wt, data=mtcars)
summary(fit)
new_weight <- data.frame(wt = c(3000/1000))
predict(fit, new_weight, interval='prediction')
# Answer: 27.57355

# Question 6
Consider again the mtcars data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A “short” ton is defined as 2,000 lbs. 
Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint.

# The new data point is a car weighing one short ton lbs. A short ton is defined as 2 000 lbs.
# This is the confidence interval around the weight coefficient and we must divide by two to
# rescale the weight values and slope cofficient.
data(mtcars)
y <- mtcars$mpg
x <- mtcars$wt / 2
fit <- lm(y~x)
summary(fit)
confint(fit)
# Answer: -12.97262

# Question 7
If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient?

# If my X from a linear regression is measured in centimeters and 
# I convert it to meters what would happen to the slope coefficient?
# Multiply by 1m / 100 cm to convet the units which means the slope 
# coefficient is multiplied by 100.

# Question 8
I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=β0+β1X+ϵ to obtain β^0 and β^1. 
What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+c for some constant, c?

# beta_zero_hat - c*beta_one_hat as the slope does not change with a shift in X values.

# Question 9
Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. 
About what is the ratio of the the sum of the squared errors, ∑ni=1(Yi−Y^i)2 when comparing a model with just an intercept (denominator) to the model with the intercept and slope (numerator)?
# Use lm to fit two linear models one with intercept and weight, and the other just with the 
# intercept.
# Then use the resid.lm function and sum the squares and compute the ratio.
data(mtcars)
fit_with <- lm(mpg~wt+1, data=mtcars)
fit_without <- lm(mpg~1, data=mtcars)
ratio_of_residuals <- sum(resid(fit_with)^2)/sum(resid(fit_without)^2)
ratio_of_residuals
# Answer: 0.2471672

# Question 10
Do the residuals always have to sum to 0 in linear regression?
# If an intercept is included, then they will sum to 0.
