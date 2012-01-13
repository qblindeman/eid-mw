/***************************************************************************
**
** Copyright (C) 2003-2005 Trolltech AS.  All rights reserved.
**
** Licensees holding valid Qt Enterprise Edition licenses may use this
** file in accordance with the Qt Solutions License Agreement provided
** with the Solution.
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
** PURPOSE.
**
** Please email sales@trolltech.com for information
** about Qt Solutions License Agreements.
**
** Contact info@trolltech.com if any conditions of this licensing are
** not clear to you.
**
*/
#ifndef QTUNIXSOCKET_H
#define QTUNIXSOCKET_H

#include <qsocket.h>

class QtUnixSocket : public QSocket
{
    Q_OBJECT
public:
    QtUnixSocket(QObject *parent = 0, const char *name = 0);

    bool connectTo(const QString &path);
};

#endif
