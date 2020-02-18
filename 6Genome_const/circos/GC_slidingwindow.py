#python3
#For now window length = 500, can be variable, still to implement.
from Bio import SeqIO
from Bio.Seq import Seq
from Bio import SeqUtils
import os
fasta = "Complete_phages.fna"
count = 0
changecount = 0
gcstat = []
for seqrecord in SeqIO.parse(fasta, "fasta"):
    count +=1
    length = len(seqrecord.seq)
    nowindow = length // 500
    for i in range(1,(int(nowindow)+1)):
        test = SeqUtils.GC(seqrecord.seq[(i*500)-500:(i*500)])
        oneid = str(seqrecord.id) +' ' + str((i*500)-500) + ' ' + str((i*500)) + ' ' + str(test)
        print(oneid)
    testje = SeqUtils.GC(seqrecord.seq[((int(nowindow)*500)):])
    twoid = str(seqrecord.id) + ' ' + str((nowindow*500)) + ' ' + str(length) + ' ' + str(round(testje,1))
    print(twoid)
