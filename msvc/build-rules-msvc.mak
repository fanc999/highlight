# NMake Makefile portion for compilation rules
# Items in here should not need to be edited unless
# one is maintaining the NMake build files.  The format
# of NMake Makefiles here are different from the GNU
# Makefiles.  Please see the comments about these formats.

# Inference rules for compiling the .obj files.
# Used for libs and programs with more than a single source file.
# Format is as follows
# (all dirs must have a trailing '\'):
#
# {$(srcdir)}.$(srcext){$(destdir)}.obj::
# 	$(CC)|$(CXX) $(cflags) /Fo$(destdir) /c @<<
# $<
# <<
{..\src\core\}.cc{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core
	$(CXX) $(HIGHLIGHT_CORE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /c @<<
$<
<<

{..\src\core\}.cpp{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core
	$(CXX) $(HIGHLIGHT_CORE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /c @<<
$<
<<

{..\src\core\astyle\}.cc{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core
	$(CXX) $(HIGHLIGHT_CORE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /c @<<
$<
<<

{..\src\core\astyle\}.cpp{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core
	$(CXX) $(HIGHLIGHT_CORE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /c @<<
$<
<<

{..\src\core\Diluculum\}.cc{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core
	$(CXX) $(HIGHLIGHT_CORE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /c @<<
$<
<<

{..\src\core\Diluculum\}.cpp{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core
	$(CXX) $(HIGHLIGHT_CORE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\ /c @<<
$<
<<

{..\src\cli\}.cc{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli
	$(CXX) $(BASE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\ /c @<<
$<
<<

{..\src\cli\}.cpp{vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\}.obj::
	@if not exist vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\ md vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli
	$(CXX) $(BASE_CFLAGS) $(HIGHLIGHT_CORE_INCLUDES) /Fovs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\ /Fdvs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\ /c @<<
$<
<<

# Rules for building .lib files
!ifdef STATIC
$(HIGHLIGHT_CORE_LIBRARY): $(highlight_core_OBJS)
	lib $(ARFLAGS) $** /out:$@
!else
$(HIGHLIGHT_CORE_LIBRARY): $(HIGHLIGHT_CORE_LIBRARY:.lib=.dll)

$(HIGHLIGHT_CORE_LIBRARY:.lib=.dll): $(highlight_core_OBJS)
	link $(LDFLAGS) $(HIGHLIGHT_CORE_DEP_LIBS) $** /DLL /out:$@ /pdb:$(@R)-core.pdb
!endif

# Rules for linking DLLs
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link /DLL [$(linker_flags)] [$(dependent_libs)] [/def:$(def_file_if_used)] [/implib:$(lib_name_if_needed)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;2

# Rules for linking Executables
# Format is as follows (the mt command is needed for MSVC 2005/2008 builds):
# $(dll_name_with_path): $(dependent_libs_files_objects_and_items)
#	link [$(linker_flags)] [$(dependent_libs)] -out:$@ @<<
# $(dependent_objects)
# <<
# 	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1
vs$(VSVER)\$(CFG)\$(PLAT)\highlight.exe: $(HIGHLIGHT_CORE_LIBRARY) $(highlight_cli_OBJS)
	link $(LDFLAGS) $(HIGHLIGHT_CORE_LIBRARY) $(HIGHLIGHT_PROGRAMS_DEP_LIBS) -out:$@ @<<
$(highlight_cli_OBJS)
<<
	@-if exist $@.manifest mt /manifest $@.manifest /outputresource:$@;1

clean:
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.exe
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.dll
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.pdb
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.ilk
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.exp
	@-del /f /q vs$(VSVER)\$(CFG)\$(PLAT)\*.lib
	@-del /s /q vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\*.obj
	@-del /s /q vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli\*.pdb
	@-del /s /q vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\*.obj
	@-del /s /q vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core\*.pdb
	@-rmdir /s /q vs$(VSVER)\$(CFG)\$(PLAT)\highlight-cli
	@-rmdir /s /q vs$(VSVER)\$(CFG)\$(PLAT)\highlight-core
