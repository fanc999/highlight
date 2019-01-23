
/*
This file is part of Highlight.

Highlight is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Highlight is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Highlight.  If not, see <http://www.gnu.org/licenses/>.
*/


#ifndef HIGHLIGHT_APP
#define HIGHLIGHT_APP


#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <iomanip>
#include <cassert>

#include "cmdlineoptions.h"
#include "codegenerator.h"
#include "help.h"
#include "datadir.h"
#include "version.h"
#include "platform_fs.h"

#define IO_ERROR_REPORT_LENGTH 5
#define SHEBANG_CNT 12

typedef map<string, string> StringMap;

/// Main application class of the command line interface

class HLCmdLineApp
{

public:

    HLCmdLineApp() {};
    ~HLCmdLineApp() {};

    /** Start application
      \param argc Number of command line arguments
      \param argv values of command line arguments
      \return EXIT_SUCCESS or EXIT_FAILURE
    */
    int run ( const int argc, const char *argv[] );

private:

    DataDir dataDir;
    StringMap assocByExtension, assocByFilename, assocByShebang;
    stringstream cin_bufcopy;

    /** print version info*/
    void printVersionInfo();

    /** print configuration info*/
    void printConfigInfo ();

    /** print error message*/
    void printBadInstallationInfo();

    /** print input and output errors */
    void printIOErrorReport ( unsigned int numberErrorFiles, vector<string> & fileList, const string &action );

    /** list installed  files
        \return true if files were found
    */
    int printInstalledFiles(const string& where, const string& wildcard, const string& what, const string&option, const string& category="");

    /** print debug information
        \param  lang language definition
        \param langDefPath path to language definition
    */
    void printDebugInfo ( const highlight::SyntaxReader *lang,
                          const string &langDefPath );

    /** \return file extension or the base filename if no extension exists
    */
    string getFileSuffix ( const string &fileName );

    /** \return base filename
    */
    string getFileBaseName(const string& fileName);

    /** \return file type deferred from extension or file shebang comment
    */
    string guessFileType ( const string &suffix, const string &inputFile, bool useUserSuffix=false );

    int getNumDigits ( int i );

    void printProgressBar ( int total, int count );
    void printCurrentAction ( const string&outfilePath,
                              int total, int count, int countWidth );

    bool readInputFilePaths ( vector<string> &fileList, string wildcard,
                              bool recursiveSearch );

    string analyzeFile ( const string& file );
    bool loadFileTypeConfig ( const string& name);
    void printInstalledFiles();

    vector <string> collectPluginPaths(const vector<string>& plugins);

    void readLuaList(const string& paramName, const string& langName,Diluculum::LuaValue &luaVal, StringMap* extMap);

};

#endif
