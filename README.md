# arpwatch
OpenBSD port/package for arpwatch-3.9

Licensing for arpwatch itself is as per source code and LLNL repository.

This basically updates the OpenBSD patches for version 2.1a15 to work on version 3.9, removing the unnecessary ones (leading zero padding is now
the default by configuring with --enable-zeropad) and completing the removal of DECnet references.
It also adds the use of unveil (and still contains a non-functional, commented-out attempt to add pledge, which can't work due to the need
for bpf BIOCSETF in pcap_setfilter, which can't be pledged today).

arpwatch-3.9.tgz is a Legion of Dynamic Discord signify-signed OpenBSD package (for OpenBSD 7.8). Signify public key is https://www.discord.org/lippard/software/discord.org-2025-pkg.pub
Future releases in 2026 will be signed with https://www.discord.org/lippard/software/discord.org-2026-pkg.pub
