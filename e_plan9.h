/*
*   $Id$
*
*   Copyright (c) 2025, Darren Hiebert
*
*   This source code is released for free distribution under the terms of the
*   GNU General Public License.
*
*   Configures ctags for Plan9 environment.
*/
#ifndef E_PLAN9_H
#define E_PLAN9_H

#include <bsd.h>

#define HAVE_SYS_STAT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_FCNTL_H 1
#define HAVE_TIME_H 2
#define HAVE_CLOCK 1
#define HAVE_FGETPOS 1
#define HAVE_STRERROR 1
#define HAVE_STRSTR 1
#define HAVE_UNISTD_H 1
#define HAVE_STRNCASECMP 1
#define HAVE_DIRENT_H 1
#define HAVE_OPENDIR 1

#endif
