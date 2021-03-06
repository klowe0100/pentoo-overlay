# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="a tool for generating freedesktop-compliant menus"
HOMEPAGE="https://github.com/pentoo/genmenu"
EGIT_REPO_URI="https://github.com/pentoo/genmenu.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

#gnome-base/gnome-menus"
DEPEND=">=dev-python/lxml-1.3.6"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/
	doins -r "${S}"/src/share
	dosym /usr/share/fern-wifi-cracker/resources/icon.png /usr/share/pixmaps/fern-wifi-cracker.png
	chown -R root:root "${ED}"
	dobin src/bin/genmenu.py src/bin/launch
}

pkg_postinst() {
	einfo
	einfo "The genmenu has been updated."
	einfo "You should run the following command to regenerate the main Pentoo menu for a local user:"
	einfo "E17:  genmenu.py -e"
	einfo "Xfce: genmenu.py -x"
	einfo "KDE:  genmenu.py -k"
	einfo
	einfo "See -h for more options"
}
