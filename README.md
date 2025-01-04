# arpwatch
OpenBSD port/package for arpwatch-3.6

Licensing for arpwatch itself is as per source code and LLNL repository.

This basically updates the OpenBSD patches for version 2.1a15 to work on version 3.6, removing the unnecessary ones (leading zero padding is now
the default by configuring with --enable-zeropad) and completing the removal of DECnet references.
It also adds the use of unveil (and still contains a non-functional, commented-out attempt to add pledge, which can't work due to the need
for bpf BIOCSETF in pcap_setfilter, which can't be pledged today).

arpwatch-3.6.tgz is a Legion of Dynamic Discord signify-signed OpenBSD package. Signify public key is https://www.discord.org/lippard/software/discord.org-2024-pkg.pub
Next signify public key is https://www.discord.org/lippard/software/discord.org-2025-pkg.pub

