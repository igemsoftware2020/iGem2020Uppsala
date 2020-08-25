# fake data

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
k2 = 30
k3 = 0.5
kX = 2
k4 = 2
k5 = 0.2


# InitVar
dimer = 5
dimepromoter = 50
mRNA = 0
Protein = 0

# Event definitions
Event: reset1, _TIME_ >= 300, 0.0
{
dimer = 1000
}
