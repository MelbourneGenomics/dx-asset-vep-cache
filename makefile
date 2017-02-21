cache: homo_sapiens_vep_87_GRCh38.tar.gz homo_sapiens_merged_vep_87_GRCh38.tar.gz homo_sapiens_refseq_vep_87_GRCh38.tar.gz

.DUMMY: cache

homo_sapiens_vep_87_GRCh38.tar.gz: resources/
	cd resources && lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get $@'

homo_sapiens_merged_vep_87_GRCh38.tar.gz: resources/
	cd resources && lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get $@'

homo_sapiens_refseq_vep_87_GRCh38.tar.gz: resources/
	cd resources && lftp -c 'open ftp://ftp.ensembl.org/pub/release-87/variation/VEP/ && get $@'

resources/:
	mkdir -p resources
