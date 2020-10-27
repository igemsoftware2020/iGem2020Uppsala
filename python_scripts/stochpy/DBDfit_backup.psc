# simulated data

R_dimer_syn:
    $pool > dimer
    kdimerization
R_dimer_deg:
    dimer > $pool
    kdimerdeg*dimer
R_dimer_active:
    dimer > dimeractive
    kActivate*dimer
R_dimer_reverse:
    dimeractive > dimer
    kreverse*dimeractive
R_dimer_pro_syn:
    dimeractive > dimerpromoter
    kDNAbinding*dimeractive
R_mRNA_syn:
    dimerpromoter > mRNA
    kmRNA_syn*dimerpromoter
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
R_MatureProtein_deg:
    MatureProtein > $pool
    kProtmat_deg*Protein

# InitPar
kdimerization = 0.00006
kdimerdeg = 1/2000
kActivate = 0.0005
kreverse = 0.00025
kDNAbinding = 0.0006

kmRNA_syn = 0.0003
kmRNAdeg = 1/1000

kProtsyn = 0.0136 # from literature
kProteindeg = 1/90
kProtmat = 0.316 #from literature
kProtmat_deg = 1/90

# InitVar
dimer = 100
dimeractive = 15
dimerpromoter = 15
mRNA = 10
Protein = 1
MatureProtein = 1

# Event definitions
Event: sample_add, _TIME_ >= 100, 0.0
{
dimeractive = 1000
}
