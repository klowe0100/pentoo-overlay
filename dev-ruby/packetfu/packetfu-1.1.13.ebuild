# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit multilib ruby-fakegem

DESCRIPTION="A mid-level packet manipulation library"
HOMEPAGE="https://rubygems.org/gems/packetfu"

LICENSE="BSD"
SLOT="${PV}"
#bettercap fails to start with this verfsion, remove keywords for now
KEYWORDS="~amd64 ~arm ~x86"

ruby_add_rdepend "dev-ruby/pcaprub:0.12"

ruby_add_bdepend "test? ( >=dev-ruby/rspec-its-1.2.0:1 )
			dev-ruby/bundler"
DEPEND="${DEPEND} !dev-ruby/packetfu:0"

all_ruby_prepare() {
	[ -f Gemfile.lock ] && rm Gemfile.lock
	#For now, we don't support development or testing at all
	#if ! use development; then
		sed -i -e "/^group :development do/,/^end$/d" Gemfile || die
		sed -i -e "/s.add_development_dependency/d" "${PN}".gemspec || die
		sed -i -e "/spec.add_development_dependency/d" "${PN}".gemspec || die
	#fi
	#if ! use test; then
		sed -i -e "/^group :test do/,/^end$/d" Gemfile || die
	#fi
	#if ! use test && ! use development; then
		sed -i -e "/^group :development, :test do/,/^end$/d" Gemfile || die
	#fi
}

each_ruby_prepare() {
	if [ -f Gemfile ]
	then
		BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle install --local || die
		BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle check || die
	fi
}