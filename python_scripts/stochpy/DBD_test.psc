# simulated data

R_dimer_syn:
    $pool > dimer
    kd
R_dimer_deg:
    dimer > $pool
    kdimerdeg*dimer
R_dimera_deg:
    dimeractive > $pool
    kdimerdeg*dimeractive
R_dimer_active:
    dimer > dimeractive
    kActivate*dimer  
R_dimer_reverse: 
    dimeractive > dimer
    kreverse*dimeractive
R_dimer_pro:
    dimer > dimepromoter
    k2*dimer
R_dimerpro_act:
    dimepromoter > mRNA
    k3*dimepromoter
R_mRNA_syn:
    dimepromoter > mRNA + dimepromoter
    k4*(dimepromoter/(dimepromoter+kX))
R_mRNA_deg:
    mRNA > $pool
    kmRNAdeg*mRNA
R_Prot_syn:
    mRNA > Protein + mRNA
    k5*mRNA
R_Prot_deg:
    Protein > $pool
    kProteindeg*Protein
R_MatureProtein_syn:
    Protein > MatureProtein
    km*Protein


# InitPar
kd = 6
kdimerdeg = 1/20
kActivate = 5
kreverse = 0.5
k2 = 60
k3 = 0.3
k4 = 0.20834
k5 = 0.0136
kX = 2
kmRNAdeg = 0.001
kProteindeg = 0.0001
km = 0.1


# InitVar
dimer = 5
dimeractive = 1
dimepromoter = 50
mRNA = 0.5
Protein = 0.5
MatureProtein = 0.5

# Event definitions
Event: reset1, _TIME_ >= 300, 0.0
{
dimer = 1000
}
