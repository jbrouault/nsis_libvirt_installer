These are the packaging pieces, used in creating the libvirt Windows installer.

Build notes
***********

The directory structure used for the build and packaging process is:

  C:\build                          <-- base dir
  C:\build\Libvirt-x.x.x-y.exe      <-- packaged file output location
  C:\build\nsis_libvirt_installer\  <-- git clone of libvirt NSIS installer
                                        repo
  C:\build\msys_setup\              <-- git clone of Matthias Bolte's
                                        libvirt compilation scripting

Matthias Bolte's git repo is located at:

  https://github.com/photron/msys_setup

The libvirt NSIS installer repo is located at:

  https://github.com/justinclift/nsis_libvirt_installer


Caveats
*******

 + This is compiled in 32-bit mode only, due to the use of msys.  It works
   on both 32-bit and 64-bit versions of Windows.

 + This is a fairly new effort, so is still in fairly rough form.  Feel
   welcome to try things out, but it's definitely not yet "production"
   grade (unlike libvirt itself)

 + We're very interested in bug reports and suggestions for improvement,
   so please feel free to get in contact with us on the libvirt mailing
   list:

     http://libvirt.org/contact.html

   Or email Justin Clift <jclift@redhat.com> directly if that's easier.
   (mailing list preferred though)

