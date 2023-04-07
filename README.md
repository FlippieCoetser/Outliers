
```r
Q1 <- ''
Q4 <- ''

a <- -4
b <- 3

IQR <- \() Q3 - Q1

Low <- \(mc) if(mc >= 0) exp(a*mc) else exp(-b*mc)
High <- \(mc) if(mc >= 0) exp(b*mc) else exp(-a*mc)



LB <- \(sample, low) (sample |> Q1()) - 1.5 * (sample |> IQR()) * (sample |> medcouple() |> low())
UB <- \(sample, high) (sample |> Q3()) + 1.5 * (sample |> IQR()) * (sample |> medcouple() |> high())

```
https://rstudio-pubs-static.s3.amazonaws.com/601843_7f35a3a2ece14fc8b52c65ffc013cdb8.html


Q3 + 1.5 * IQR * 1
Q1 - 1.5 * IQR * 1

Q3 + 1.5 * IQR * adjustment
Q1 - 1.5 * IQR * adjustment

```r

```r



> note: Github workflows use Github Secrets to set environment variables 