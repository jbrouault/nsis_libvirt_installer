README file for libvirt, the virtualisation library
***************************************************

Home page: http://www.libvirt.org
Contact information: http://www.libvirt.org/contact.html


Important!
**********

This is an early stage *experimental* MS Windows installer
for the libvirt client libraries, being improved over time
by the Libvirt Community.

This installer is not production ready, unlike libvirt
itself.  Do not use it for anything important.  You have
been warned. :)


Connection types
****************

These connection types are known to work:

 + QEMU with TLS (qemu+tls://)
 + QEMU with direct TCP (qemu+tcp://)
 + VMware ESX (esx://)
 + VMware VPX (vpx://)

These connection types are known not to work:

 + QEMU with SSH (qemu+ssh://)

All other connection types may or may not work, and haven't
been tested.  Please let us know either the results (either
way) if you do. :)

Special note - Support for VirtualBox *on windows* was added
in libvirt 0.8.7, so reports on success and failure if you're
using that would be really appreciated.

WARNING - The qemu+tcp:// connection type passes all traffic
without encryption.  This is a security hazard, and should
*not* be used in security sensitive environments.


Connecting to VMware ESX or vSphere
***********************************

Details on the capabilities, certificates, and connection
string syntax used for connecting to VMware ESX and vSphere
can be found online here:

  http://libvirt.org/drvesx.html


Transport Layer Security (TLS) Certificates
*******************************************

TLS certificates need to have been created and placed in
the correct locations, before you will be able to connect
to QEMU servers over TLS.

Information on generating TLS certificates can be found
here:

  http://wiki.libvirt.org/page/TLSSetup

These instructions are for *nix, and have not yet been
adapted for Windows.  You'll need to figure out the
Windows equivalents until that's done (sorry).  If you
can help us out with this, that would be really welcome.

The locations of the TLS certificates and key file on
Windows are hard coded, rather than being configurable.

The Certificate Authority (CA) certificate file must be
placed in:

  %APPDATA%\libvirt\pki\CA\cacert.pem

The Client certificate file must be placed in:

  %APPDATA%\libvirt\pki\libvirt\clientcert.pem

The Client key file must be placed in:

  %APPDATA%\libvirt\pki\libvirt\private\clientkey.pem

On an example Windows 7 x64 system here, this resolves to
these paths:

  C:\Users\someuser\AppData\Roaming\libvirt\pki\CA\cacert.pem
  C:\Users\someuser\AppData\Roaming\libvirt\pki\libvirt\clientcert.pem
  C:\Users\someuser\AppData\Roaming\libvirt\pki\libvirt\private\clientkey.pem


Existing problems with this installer we know about
***************************************************

These are problems we know about, and need to be fixed in
subsequent versions of the installer (assistance welcomed):

 + New versions install over other libvirt versions

   If a version of this installer has installed libvirt
   on the system already, this installer will
   automatically suggest the same installation location,
   then overwrite the version there without checking.

   This is fairly non-optimal, and should be fixed.  What
   should probably happen, is for this installer to detect
   an existing installation then offer to either uninstall
   it first or ask for a new installation location.


 + Start menu shortcuts aren't being removed at uninstall
   time

   Not sure why yet.  Needs to be investigated.


Reporting bugs
**************

We're very interested in all bugs you find in this installer
itself, or in libvirt.

Information on the best way to report bugs is online, on our
Bug Reporting page:

  http://libvirt.org/bugs.html
