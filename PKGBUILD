# Maintainer: Buce <dmbuce@gmail.com>

pkgname=music
pkgver=0.r40.g1a3e710
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="Scripts for playing MPD, Pandora, and radio stations."
arch=(any)
url="https://github.com/DMBuce/music"
license=('GPL3')
groups=()
depends=(
  bash
  mpc
  mpv
  rofi
  gettext
  pianobar
  tmux
  socat
  jq
)
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=(etc/music.ini)
options=()
install=
source=("$pkgname::git+https://github.com/DMBuce/${pkgname%-git}.git")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname%-git}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
