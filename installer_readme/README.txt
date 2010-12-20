README file for libvirt, the virtualisation library
***************************************************

Home page: http://www.libvirt.org


Important!
**********

This is an early stage *experimental* MS Windows installer
for libvirt, being improved over time by the Libvirt
Community.

This installer is not production ready, unlike libvirt
itself.  Do not use it for anything important.  You have
been warned. :)


Connecting to VMware ESX or vSphere
***********************************

Details on the capabilities and connection string syntax
can be found online:

  http://libvirt.org/drvesx.html


TLS Certificates
****************

TLS certificates need to be generated prior to connecting
to either QEMU instances with TLS, or connecting to VMware
ESX/vSphere.

The CA Certificate file must be placed in:

  %APPDATA%\libvirt\pki\CA\cacert.pem

The Client certificate file must be placed in:

  %APPDATA%\ ...

The Client key file must be placed in:

  %APPDATA%\ ...


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


 + Libvirt dll files should be added to path

   At the moment, anything that needs to use the libvirt dll
   files (ie the C# bindings) won't automatically find them.
   This can be worked around by copying the dll files into
   the same directory as whatever needs them, but is probably
   not an optimal approach.  There might be a better way and
   needs to be investigated first.


Reporting bugs
**************

We're very interested in all bugs you find in this installer
itself, or in libvirt.

Information on the best way to report bugs is online, on our
Bug Reporting page:

  http://libvirt.org/bugs.html
