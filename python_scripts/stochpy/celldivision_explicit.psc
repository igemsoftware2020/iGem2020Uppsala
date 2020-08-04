# explicit version

R_TF_syn:
    $pool > TF
    kTFsyn
R_TF_deg:
    TF > $pool
    kTFdeg*TF
R_TFa_deg:
    TFactive > $pool
    kTFdeg*TFactive
R_TF_act:
    TF > TFactive
    kActivate*TF  
R_TF_inact: 
    TFactive > TF
    kInactivate*TFactive
R_mRNA_syn:
    TFactive > mRNA + TFactive
    kmRNAsyn*(TFactive/(TFactive+kX))
R_mRNA_deg:
    mRNA > $pool
    kmRNAdeg*mRNA   
R_Prot_syn:
    mRNA > Protein + mRNA
    kProteinsyn*mRNA
R_Prot_deg:
    Protein > $pool
    kProteindeg*Protein    
    
# InitPar
kTFsyn = 0.615525
kTFdeg = 1/20
kActivate = 5
kInactivate = 0.5
kX = 2
kmRNAsyn = 1.36094
kmRNAdeg = 1/10
kProteinsyn = 1.133
kProteindeg = 1/90
mu = 1/86.56

# InitVar
TF = 2
TFactive = 10
mRNA = 10
Protein = 375







