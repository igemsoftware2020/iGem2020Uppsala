+# fake data

R_dimer_syn:
    $pool > dimer
    kd
R_dimer_pro:
    dimer > dimepromoter
    k2*dimer 
R_dimer_inact: 
    dimepromoter > dimer
    k3*dimepromoter
R_mRNA_syn:
    dimepromoter > mRNA + dimepromoter
    k4*(dimepromoter/(dimepromoter+kX))
R_Prot_syn:
    mRNA > Protein + mRNA
    k5*mRNA

# InitPar
kd = 5
k2 = 60
k3 = 0.5
kX = 2
k4 = 1.36094
k5 = 0.0136
mu = 1/86.56

# InitVar
dimer = 2
dimepromoter = 10
mRNA = 10
Protein = 375





