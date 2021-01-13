
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


#ifndef HL_EXPORTS_H
#define HL_EXPORTS_H

#if defined (WIN32) && defined (_MSC_VER) && !defined (_HL_CORE_STATIC)
# ifdef _BUILDING_HL_CORE
#  define _HL_API __declspec (dllexport)
# else
#  define _HL_API __declspec (dllimport)
# endif
#else
# define _HL_API
#endif

#endif /* HL_EXPORTS_H */