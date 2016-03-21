# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21"

inherit multilib ruby-fakegem

DESCRIPTION="A complete, modular, portable and easily extensible MITM framework"
HOMEPAGE="https://github.com/evilsocket/bettercap/"
SRC_URI="https://github.com/evilsocket/bettercap/archive/v1.5.1.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT=0
KEYWORDS="~amd64 ~arm ~x86"

ruby_add_rdepend "
	dev-ruby/colorize
	dev-ruby/net-dns
	dev-ruby/network_interface
	dev-ruby/packetfu:1.1.11
	dev-ruby/pcaprub:0.12
	dev-ruby/em-proxy
	dev-ruby/rubydns
"

#em-proxy (>= 0.1.8, ~> 0.1)
#rubydns (>= 1.0.3, ~> 1.0) ruby

each_ruby_prepare() {
	BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle install --local || die
	BUNDLE_GEMFILE=Gemfile ${RUBY} -S bundle check || die
}

# FIXME:
# install bettercap binary into /usr/sbin
