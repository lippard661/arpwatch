# arpwatch
OpenBSD port/package for arpwatch-3.9

Licensing for arpwatch itself is as per source code and LLNL repository.

This basically updates the OpenBSD patches for version 2.1a15 to work on version 3.9, removing the unnecessary ones (leading zero padding is now
the default by configuring with --enable-zeropad; the report.c patch is redundant) and completing the removal of DECnet references.
It also adds the use of unveil and pledge (which has to be done a little
later than the unveil due to the need for BIOCSETF in pcap_setfilter).
(This has been submitted as an OpenBSD ports update as of 2026-06-26.)

arpwatch-3.9.tgz is a Legion of Dynamic Discord signify-signed OpenBSD package (for OpenBSD 7.9). Signify public key is https://www.discord.org/lippard/software/discord.org-2026-pkg.pub
