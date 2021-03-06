# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit linux-info linux-mod git-2

DESCRIPTION="Driver for AC1200 (801.11ac) Wireless Dual-Band USB Adapter"
HOMEPAGE="https://github.com/abperiasamy/rtl8812AU_8821AU_linux"
EGIT_REPO_URI="https://github.com/abperiasamy/rtl8812AU_8821AU_linux.git"
EGIT_COMMIT="72594b5560f89e2821fffc38a474d7420df73f45"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
#IUSE="pax_kernel"

ARCH=x86_64
MODULE_NAMES="rtl8812au(net/wireless:)"
BUILD_TARGETS="clean modules"

#src_prepare() {
#	use pax_kernel && epatch "${FILESDIR}"/rtl8812au_p2014_grsecurity.patch
#}
