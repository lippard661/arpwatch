COMMENT=	monitor arp & rarp requests

DISTNAME=	arpwatch-3.6
#REVISION=	0
CATEGORIES=	net

SITES=		https://ee.lbl.gov/downloads/arpwatch/

# arpwatch-2.1a15: MAINTAINER=	Jasper Lievisse Adriaanse <jasper@openbsd.org>
MAINTAINER=	Jim Lippard

# BSD
PERMIT_PACKAGE=	Yes

WANTLIB=		c pcap

CONFIGURE_STYLE=	gnu
MAKE_FLAGS+=		ARPDIR=${LOCALSTATEDIR}/arpwatch

CONFIGURE_ARGS+= --enable-zeropad

# this provides an up-to-date pregenerated ethercodes.dat file
RUN_DEPENDS=	net/arp-scan,-mac

NO_TEST=	Yes

EXAMPLESDIR=	${PREFIX}/share/examples/arpwatch

pre-build:
	${SUBST_CMD} ${WRKSRC}/arpsnmp.8 ${WRKSRC}/arpwatch.8

do-install:
	@sed -i 's,awk -f ,awk -f ${EXAMPLESDIR}/', ${WRKSRC}/massagevendor-old
	@sed -i 's,awk -f ,awk -f ${EXAMPLESDIR}/', ${WRKSRC}/massagevendor.py
	${INSTALL_PROGRAM} ${WRKSRC}/arpwatch ${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/arpsnmp ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/arpwatch.8 ${PREFIX}/man/man8
	${INSTALL_MAN} ${WRKSRC}/arpsnmp.8 ${PREFIX}/man/man8
	${INSTALL_DATA_DIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/*.awk ${EXAMPLESDIR}
	@${INSTALL_DATA} /dev/null ${EXAMPLESDIR}/arp.dat
	@${INSTALL_SCRIPT} ${WRKSRC}/arp2ethers ${EXAMPLESDIR}
	@${INSTALL_SCRIPT} ${WRKSRC}/massagevendor-old ${EXAMPLESDIR}
	@${INSTALL_SCRIPT} ${WRKSRC}/massagevendor.py ${EXAMPLESDIR}

.include <bsd.port.mk>
