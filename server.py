#!/usr/bin/env python
from twisted.protocols.ftp import FTPFactory, FTPRealm
from twisted.cred.portal import Portal
from twisted.cred.checkers import AllowAnonymousAccess, FilePasswordDB
from twisted.internet import reactor

p = Portal(FTPRealm('', '/srv/tdsm'),
           [FilePasswordDB("/tmp/ftp_pass.dat")])

f = FTPFactory(p)

reactor.listenTCP(2112, f)
reactor.run()
