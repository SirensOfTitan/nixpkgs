{ stdenv, fetchFromGitHub, pantheon, meson, ninja, pkgconfig, vala, glib
, libgee, granite, gexiv2, elementary-settings-daemon, gtk3, gnome-desktop
, gala, wingpanel, plank, switchboard, gettext, bamf, fetchpatch }:

stdenv.mkDerivation rec {
  pname = "switchboard-plug-pantheon-shell";
  version = "2.8.4";

  src = fetchFromGitHub {
    owner = "elementary";
    repo = pname;
    rev = version;
    sha256 = "sha256-CHl+4mVjrDg2gusrWOCfI++DZMWKLdvHxG3ZWMjZ2to=";
  };

  passthru = {
    updateScript = pantheon.updateScript {
      attrPath = "pantheon.${pname}";
    };
  };

  nativeBuildInputs = [
    gettext
    meson
    ninja
    pkgconfig
    vala
  ];

  buildInputs = [
    bamf
    elementary-settings-daemon
    gexiv2
    glib
    gnome-desktop
    granite
    gtk3
    libgee
    gala
    wingpanel
    plank
    switchboard
  ];

  meta = with stdenv.lib; {
    description = "Switchboard Desktop Plug";
    homepage = https://github.com/elementary/switchboard-plug-pantheon-shell;
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = pantheon.maintainers;
  };
}
