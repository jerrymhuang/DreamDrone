data {
    int<lower=1> N;
    array[N] real<lower=0> y;
    array[N] int<lower=1, upper=2> condition;
    array[N] int<lower=0, upper=1> choice;
}

parameters {
    real<lower=0> v;
    real<lower=0> a;
    real<lower=0, upper=1> beta;
    real<lower=0> tau;
}

model {
    // Priors
    // Picking bounded and informative priors
    a ~ gamma(3, 1);
    beta ~ beta(2, 2);
    tau ~ gamma(2, 1);
    v ~ gamma(3, 1);


    // Likelihood
    for (n in 1:N) {
        // Condition 1
        if (condition[n] == 1) {
            if (choice[n] == 1) {
                // Your code here
                y[n] ~ wiener(a, tau, beta, v);
            }
            else {
                // Your code here
                y[n] ~ wiener(a, tau, 1 - beta, -v);
            }
        }
        // Condition 2
        if (condition[n] == 2) {
            if (choice[n] == 1) {
                // Your code here
                y[n] ~ wiener(a, tau, beta, v);
            }
            else {
                // Your code here
                y[n] ~ wiener(a, tau, 1 - beta, -v);
            }
        }
    }
}