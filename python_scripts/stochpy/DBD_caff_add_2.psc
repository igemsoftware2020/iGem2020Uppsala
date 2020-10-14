# simulated data

R_dimer_syn:
    $pool > DBD
    kDBD_prod*DBD
R_dimer_caff:
    DBD + caff > dimercaff
    kdimercaffbind*caff
R_dimer_pro_syn:
    dimercaff > dimerpromoter
    kDNAbinding*dimercaff
R_mRNA_syn:
    dimerpromoter > mRNA + DBD + caff
    kmRNA_syn*dimerpromoter

R_Prot_syn:
    mRNA > Protein + mRNA
    kProtsyn*mRNA

R_MatureProtein_syn:
    Protein > MatureProtein
    kProtmat*Protein


# InitPar
kDBD_prod = 6

kdimercaffbind = 5

kDNAbinding = 60

kmRNA_syn = 5
kmRNAdeg = 1/30

kProtsyn = 0.0136 # from literature
kProteindeg = 1/90

kProtmat = 0.0316 #from literature
kProtmat_deg = 1/90

# InitVar
DBD = 200
caff = 200
dimercaff = 0.01
dimerpromoter = 0.01
mRNA = 0.01
Protein = 0.1
MatureProtein = 0.01


# Event definitions
#Event: sample_add, _TIME_ >= 100, 0.0
#{
#caff = 1000
#}
