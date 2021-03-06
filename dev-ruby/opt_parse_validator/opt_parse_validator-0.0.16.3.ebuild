# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24"

inherit ruby-fakegem

DESCRIPTION="OptionParser lib in ruby"
HOMEPAGE="https://rubygems.org/gems/opt_parse_validator"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/activesupport-5.2.1:*
	>=dev-ruby/addressable-2.5.0"
