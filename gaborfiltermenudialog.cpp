//---------------------------------------------------------------------------
/*
GaborFilter, tool to demonstrate Gabor filtering
Copyright (C) 2012-2015 Richel Bilderbeek

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.If not, see <http://www.gnu.org/licenses/>.
*/
//---------------------------------------------------------------------------
//From http://www.richelbilderbeek.nl/ToolGaborFilter.htm
//---------------------------------------------------------------------------
#include "gaborfiltermenudialog.h"

#include <cassert>
#include <iostream>

#include "gaborfilter.h"
#include "gaborfilterwidget.h"

int ribi::ToolGaborFilterMenuDialog::ExecuteSpecific(const std::vector<std::string>& argv) noexcept
{
  const int argc = static_cast<int>(argv.size());
  if (argc == 1)
  {
    std::cout << GetHelp() << '\n';
    return 1;
  }
  GaborFilterWidget w;
  std::cout << w << '\n';
  return 0;
}

ribi::About ribi::ToolGaborFilterMenuDialog::GetAbout() const noexcept
{
  About a(
    "Richel Bilderbeek",
    "GaborFilter",
    "tool to demonstrate Gabor filtering",
    "the 7th of July 2012",
    "2012-2015",
    "http://www.richelbilderbeek.nl/ToolGaborFilter.htm",
    GetVersion(),
    GetVersionHistory()
  );
  return a;
}

ribi::Help ribi::ToolGaborFilterMenuDialog::GetHelp() const noexcept
{
  return ribi::Help(
    this->GetAbout().GetFileTitle(),
    this->GetAbout().GetFileDescription(),
    {

    },
    {

    }
  );
}

std::string ribi::ToolGaborFilterMenuDialog::GetVersion() const noexcept
{
  return "2.0";
}

std::vector<std::string> ribi::ToolGaborFilterMenuDialog::GetVersionHistory() const noexcept
{
  return {
    "2010-xx-xx: version 1.0: initial Windows-only version",
    "2012-07-07: version 2.0: port to Qt"
  };
}

