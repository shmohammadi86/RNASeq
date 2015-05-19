import pysam

sam = pysam.AlignmentFile("shu.bam", 'wb', reference_names = ['chr1'], reference_lengths=[100000])
r = pysam.AlignedSegment()
r.query_name = "test1"
r.seq = "ACCT"
r.qual = "xxxx"
r.pos = 100
r.cigartuples = [(0, 2), (3, 10), (0, 2)]
sam.write(r)
sam.close()
pysam.index('shu.bam')

sam = pysam.AlignmentFile('shu.bam')
for p in sam.pileup('chr1',
                    100,
                    200,
                    truncate=True,
                    stepper='nofilter'):
    for read in p.pileups:
        print read.is_del, read.is_head, read.is_tail, read.is_refskip
        print 'reference pos', p.reference_pos, 'query pos', read.query_position
