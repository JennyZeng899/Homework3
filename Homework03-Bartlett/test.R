testprior <- set_prior("beta(0,0.75)", class = "b") + 
  set_prior("beta(7, 2.6)", class = "Intercept") + 
  set_prior("exponential(1)", class = "sigma")

test1 <- brm(
  formula = Evans_model,
  data = Evans_data,
  family = bernoulli(),
  seed = 200323,
  file = "test1"
)

test2 <- brm(
  formula = Evans_model,
  data = Evans_data,
  family = cumulative("probit"),
  seed = 200323,
  file = "test2"
)

test3 <- brm(
  formula = Evans_model,
  data = Evans_data,
  family = acat("probit"),
  seed = 200323,
  file = "test3"
)
pp_check(test3, 
         ndraws = 100) 