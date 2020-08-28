# simulated data

R_dimer_syn:
    $pool > dimer
    kd
R_dimer_deg:
    dimer > $pool
    kdimerdeg*dimer
R_dimer_deg:
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
    kdimerization*dimer
R_dimerpro_act:
    dimepromoter > mRNA
    ktranscription*dimepromoter
R_mRNA_syn:
    dimepromoter > mRNA + dimepromoter
    k4*(dimepromoter/(dimepromoter+kX))
R_mRNA_deg:
    mRNA > $pool
    kmRNAdeg*mRNA
R_Prot_syn:
    mRNA > Protein + mRNA
    kProtsyn*mRNA
R_Prot_deg:
    Protein > $pool
    kProteindeg*Protein
R_MatureProtein_syn:
    Protein > MatureProtein
    kProtmat*Protein


# InitPar
kd = 6
kdimerdeg = 1/20
kActivate = 5
kreverse = 0.5
kdimerization = 60
ktranscription = 0.3
k4 = 0.20834
kProtsyn = 0.0136
kX = 2
kmRNAdeg = 1/10
kProteindeg = 1/90
kProtmat = 0.1


# InitVar
dimer = 50
dimeractive = 1
dimepromoter = 5
mRNA = 0.5
Protein = 0.5
MatureProtein = 0.5

# Event definitions
Event: reset1, _TIME_ >= 300, 0.0
{
dimer = 1000
}
