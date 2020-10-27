# simulated data

R_dimer_syn:
    $pool > dimer
    Caff
R_dimer_pool:
    dimer > $pool
    Caff*dimer
R_dimer_pro_syn:
    dimer > dimerpromoter
    kDNAbinding*dimer
R_dimer_pro_deg:
    dimerpromoter > dimer 
    kDNAbinding*dimerpromoter
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
Caff = 1000
kDNAbinding = 0.0006
kmRNA_syn = 0.0003
kmRNAdeg = 1/1000

kProtsyn = 0.00136 # from literature
kProteindeg = 1/900
kProtmat = 0.316 #from literature
kProtmat_deg = 1/90

# InitVar
dimer = 100
dimerpromoter = 15
mRNA = 10
Protein = 1
MatureProtein = 1

# Event definitions
Event: sample_add, _TIME_ >= 100, 0.0
{
dimeractive = 1000
}
