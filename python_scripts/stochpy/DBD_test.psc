# simulated data

R_dimer_syn:
    $pool > dimer
    kd
R_dimer_deg:
    dimer > $pool
    kdimerdeg*dimer
R_dimer_rev:
    dimer > $pool
    kd_rev
R_dimer_pro:
    dimer > dimepromoter
    k2*dimer
R_dimer_inact:
    dimepromoter > mRNA
    k3*dimepromoter
R_mRNA_syn:
    mRNA > mRNA + Protein
    k4*mRNA
R_mRNA_deg:
    mRNA > $pool
    kmRNAdeg*mRNA
R_Prot_syn:
    Protein > matureProtein
    k5*Protein
R_Prot_deg:
    matureProtein > $pool
    kProteindeg*matureProtein

# InitPar
kd = 6
kd_rev = 1/kd
k2 = 60
k3 = 0.3
k4 = 0.20834
k5 = 0.0136
kdimerdeg = 1/20
kmRNAdeg = 1.36094
kProteindeg = 1/90



# InitVar
dimer = 5
dimepromoter = 50
mRNA = 0
Protein = 0
matureProtein = 0

# Event definitions
Event: reset1, _TIME_ >= 300, 0.0
{
dimer = 1000
}
