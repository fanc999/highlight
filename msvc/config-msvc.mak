# NMake Makefile portion for enabling features for Windows builds

# Please do not change anything beneath this line unless maintaining the NMake Makefiles

# Make bin, include and library directories of configurable
!ifndef BINDIR
BINDIR=$(PREFIX)\bin
!endif

!ifndef LIBDIR
LIBDIR=$(PREFIX)\lib
!endif

!ifndef INCLUDEDIR
INCLUDEDIR=$(PREFIX)\include
!endif

!ifndef BOOST_INCLUDEDIR
BOOST_INCLUDEDIR = $(INCLUDEDIR)
!endif

!ifndef LIBLUA_INCLUDEDIR
LIBLUA_INCLUDEDIR = $(INCLUDEDIR)
!endif

!ifndef LIBLUA_LIB
LIBLUA_LIB = lua53.lib
!endif

LDFLAGS = $(LDFLAGS) /libpath:$(LIBDIR)

# These are the base minimum libraries required for building librsvg.

# Visual Studio 2015 and later supports the /utf-8 compiler flag
# that prevents C4819 warnings/errors on non-Western locales
!if $(VSVER) > 12
EXTRA_BASE_CFLAGS = /utf-8
!else
EXTRA_BASE_CFLAGS =
!endif

!if "$(CFG)" == "release" || "$(CFG)" == "Release"
DEBUG_CFLAG = /DNDEBUG
!else
DEBUG_CFLAG = /D_DEBUG
!endif

BASE_CFLAGS =					\
	$(CFLAGS_ADD)				\
	$(DEBUG_CFLAG)				\
	/D_CRT_SECURE_NO_WARNINGS	\
	/D_CRT_NONSTDC_NO_WARNINGS	\
	/DWIN32						\
	$(EXTRA_BASE_CFLAGS)

BASE_DEP_INCLUDES =			\
	/I$(BOOST_INCLUDEDIR)	\
	/I$(LIBLUA_INCLUDEDIR)	\
	/I$(INCLUDEDIR)

BASE_DEP_LIBS =	$(LIBLUA_LIB)

!ifdef STATIC
BASE_CFLAGS = $(BASE_CFLAGS) /D_HL_CORE_STATIC
HIGHLIGHT_CORE_DEP_LIBS =
HIGHLIGHT_PROGRAMS_DEP_LIBS = $(BASE_DEP_LIBS)
!else
BASE_CFLAGS = $(BASE_CFLAGS) /wd4251 /wd4275
HIGHLIGHT_CORE_DEP_LIBS = $(BASE_DEP_LIBS)
HIGHLIGHT_PROGRAMS_DEP_LIBS =
!endif

HIGHLIGHT_CORE_LIBRARY = vs$(VSVER)\$(CFG)\$(PLAT)\highlight.lib

HIGHLIGHT_CORE_CFLAGS =	\
	$(BASE_CFLAGS)		\
	/D_BUILDING_HL_CORE

HIGHLIGHT_CORE_INCLUDES =	\
	/I..\src\include		\
	$(BASE_DEP_INCLUDES)
