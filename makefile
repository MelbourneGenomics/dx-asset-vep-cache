ensembl = $(root)/homo_sapiens_vep_87_GRCh38.tar.gz
merged = $(root)/homo_sapiens_merged_vep_87_GRCh38.tar.gz
refseq = $(root)/homo_sapiens_refseq_vep_87_GRCh38.tar.gz
root = .

cache: unzip $(ensembl) $(merged) $(refseq)

.DUMMY: cache unzip

$(ensembl): | $(root)/
	lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get -O $(root) homo_sapiens_vep_87_GRCh38.tar.gz'

$(refseq) : | $(root)/
	lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get -O $(root) homo_sapiens_refseq_vep_87_GRCh38.tar.gz'

$(merged) : | $(root)/
	lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get -O $(root) homo_sapiens_merged_vep_87_GRCh38.tar.gz'

$(root):
	mkdir -p $@

# Unzip a resource bundle of existing caches if we have one
unzip:
	if [[ -f *.tar.gz ]] ; then tar -xzf *.tar.gz; fi
