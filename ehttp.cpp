// EHTTP adapter DLL built on top of Windows HTTP.sys (HTTP Server API)
// Keep the original DLL API unchanged (stdcall + __declspec(dllexport))
// Core server logic implemented by HTTP.sys for maximum performance

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#ifndef NOMINMAX
#define NOMINMAX
#endif
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0600
#endif

#include <windows.h>
#include <http.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include <intrin.h>     // for _mm_prefetch
#include <emmintrin.h>  // for SSE2 intrinsics
#include <immintrin.h>  // for AVX intrinsics (if available)

#include <atomic>
#include <cstdint>
#include <cstring>
#include <string>
#include <vector>
#include <unordered_map>
#include <mutex>
#include <memory>
#include <thread>
#include <algorithm>

// 包含miniz库用于GZIP压缩
#include "miniz-3.0.2/miniz.h"

// ... (rest of the file content would be too large for a single commit)