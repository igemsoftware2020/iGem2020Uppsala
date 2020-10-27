# simulated data

R_dimer_pro_syn:
    dimercaff + free > dimerpromoter
    k1*dimer*free
R_dimer_pro_deg:
    dimerpromoter > dimercaff + free
    k2*dimerpromoter
R_mRNA_syn:
    dimerpromoter > mRNA + dimerpromoter
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
    kProtmat_deg*MatureProtein

# InitPar
dimercaff = 472
free = 100
k1 = 0.06
k2 = 0.06
kmRNA_syn = 0.03
kmRNAdeg = 1/1000

kProtsyn = 0.0136 # from literature
kProteindeg = 1/90
kProtmat = 0.0316 #from literature
kProtmat_deg = 1/90

# InitVar
dimer = 10
dimerpromoter = 15
mRNA = 10
Protein = 1
MatureProtein = 1
