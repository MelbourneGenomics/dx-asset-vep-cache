# hg38 Vep Cache
This repository contains code for building a VEP cache asset to be used along with a VEP applet for DNA Nexus (https://github.com/MelbourneGenomics/dx-vep).

To build this asset, you can simply run the usual build command:

```bash
dx build_asset . 
```

However, you may find that downloading the VEP cache (as the makefile does) takes too long. If this is the case, you can instead put an existing copy of the gzipped caches
in `./resources/vep`, which will avoid having to download them yourself. Note that these assets must have the exact same filename as the makefile would produce, namely
`homo_sapiens_merged_vep_87_GRCh38.tar.gz` or similar for the `ensembl` and `refseq` versions.
