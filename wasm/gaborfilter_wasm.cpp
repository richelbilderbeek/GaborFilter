//---------------------------------------------------------------------------
/*
GaborFilter, WebAssembly interface
Copyright (C) 2012-2026 Richel Bilderbeek

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
*/
//---------------------------------------------------------------------------
// Thin C interface around ribi::GaborFilter, compiled to WebAssembly
// with Emscripten so the tool can run in a web browser.
//
// The drawing mirrors ribi::QtGaborFilterWidget::DrawGaborFilter.
//---------------------------------------------------------------------------
#include "gaborfilter.h"

#include <cstdint>
#include <vector>

#ifdef __EMSCRIPTEN__
#include <emscripten/emscripten.h>
#else
#define EMSCRIPTEN_KEEPALIVE
#endif

namespace {

std::vector<std::uint8_t> g_pixels;

} //~namespace

extern "C" {

/// Suggested sigma for a filter of the given width and height,
/// as in the original desktop tool
EMSCRIPTEN_KEEPALIVE
double gabor_suggest_sigma(const double width, const double height)
{
  ribi::GaborFilter * const f = new ribi::GaborFilter;
  const double s = f->SuggestSigma(width, height);
  boost::checked_delete(f);
  return s;
}

/// Render the Gabor filter into an RGBA buffer of width * height * 4 bytes.
/// Returns a pointer to the buffer in WebAssembly memory, nullptr on error.
EMSCRIPTEN_KEEPALIVE
std::uint8_t * gabor_render(
  const int width, const int height,
  const double angle, const double frequency, const double sigma)
{
  if (width <= 0 || height <= 0 || sigma == 0.0) return nullptr;
  ribi::GaborFilter * const f = new ribi::GaborFilter(angle, frequency, sigma);
  g_pixels.resize(static_cast<std::size_t>(width) * height * 4);
  const double midx = static_cast<double>(width ) / 2.0;
  const double midy = static_cast<double>(height) / 2.0;
  const double max = f->GetMax();
  std::size_t i = 0;
  for (int y = 0; y != height; ++y)
  {
    for (int x = 0; x != width; ++x)
    {
      // Transform the pixel coordinates to [-1,1] for both x and y
      const double xco = (static_cast<double>(x) - midx) / midx;
      const double yco = (static_cast<double>(y) - midy) / midy;
      const double greyness = f->GaborFunction(xco, yco);
      const int grey_int = static_cast<int>(128.0 + ((greyness / max) * 126.0));
      const int grey = grey_int < 0 ? 0 : (grey_int > 255 ? 255 : grey_int);
      g_pixels[i++] = static_cast<std::uint8_t>(grey);
      g_pixels[i++] = static_cast<std::uint8_t>(grey);
      g_pixels[i++] = static_cast<std::uint8_t>(grey);
      g_pixels[i++] = 255;
    }
  }
  boost::checked_delete(f);
  return g_pixels.data();
}

} //~extern "C"
