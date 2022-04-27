set SDKROOT=%systemDrive%/Library/Developer/platforms/Windows.platform/Developer/SDKs/Windows.sdk

set SWIFTFLAGS=-sdk %SDKROOT% -I %SDKROOT%/usr/lib/swift -L %SDKROOT%/usr/lib/swift/windows

swiftc -o main.exe main.swift %SWIFTFLAGS%

main.exe