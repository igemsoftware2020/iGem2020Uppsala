# simulated data

R_dimer_syn:
    $pool > DBD
    kDBD_prod*DBD
R_dimer_deg:
    DBD > $pool
    kDBDdeg*DBD
R_dimer_caff:
    DBD + caff > dimercaff
    kdimercaffbind*caff
R_dimer_reverse:
    dimercaff > DBD + caff
    kdimercaffdiss*dimercaff
R_dimer_pro_syn:
    dimercaff > dimerpromoter
    kDNAbinding*dimercaff
R_mRNA_syn:
    dimerpromoter > mRNA + DBD + caff
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
kDBD_prod = 6
kDBDdeg = 1/90

kdimercaffbind = 5
kdimercaffdiss = 0.001

kDNAbinding = 60

kmRNA_syn = 5
kmRNAdeg = 1/30

kProtsyn = 0.0136 # from literature
kProteindeg = 1/90

kProtmat = 0.0316 #from literature
kProtmat_deg = 1/90


# InitVar
DBD = 200
caff = 0.01
dimercaff = 0.1
dimerpromoter = 0.1
mRNA = 0.1
Protein = 0.1
MatureProtein = 0.1


# Event definitions
Event: sample_add, _TIME_ >= 100, 0.0
{
caff = 1000
}
