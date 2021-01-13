
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

#ifndef PLATFORM_FS__H__INCLUDED
#define PLATFORM_FS__H__INCLUDED

#include <string>
#include <iostream>
#include <vector>

#include "hl-exports.h"

namespace Platform
{
extern _HL_API const char pathSeparator;

_HL_API
std::string getAppPath();

_HL_API
std::string getHomePath();

_HL_API
std::string getTempFilePath();


/** \param fileList Vector where found entries will be stored
    \param  wildcard Directory path and wildcard
    \param recursiveSearch Test if directory should be searched recursively */
_HL_API
bool getDirectoryEntries ( std::vector<std::string> &fileList,
                           std::string wildcard,
                           bool recursiveSearch=false );

_HL_API
void getFileNames ( const std::string &directory,const std::string &wildcard,
                    std::vector<std::string> &fileName );

_HL_API
int wildcmp ( const char *wild, const char *data );

_HL_API
bool fileExists(const std::string &fName);

_HL_API
off_t fileSize(const std::string& fName);

_HL_API
int isColorEscCapable();

_HL_API
int isDarkTerminal();

}
#endif

