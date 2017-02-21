ensembl = resources/homo_sapiens_vep_87_GRCh38.tar.gz
merged = resources/homo_sapiens_merged_vep_87_GRCh38.tar.gz
refseq = resources/homo_sapiens_refseq_vep_87_GRCh38.tar.gz
resources = resources/

cache: $(ensembl) $(merged) $(refseq)

.DUMMY: cache

$(ensembl): | resources/
	lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get -O $(resources) homo_sapiens_vep_87_GRCh38.tar.gz'

$(refseq) : | resources/
	lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get -O $(resources) homo_sapiens_refseq_vep_87_GRCh38.tar.gz'

$(merged) : | resources/
	lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get -O $(resources) homo_sapiens_merged_vep_87_GRCh38.tar.gz'

$(resources):
	mkdir -p $@
