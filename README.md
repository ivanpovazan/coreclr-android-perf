# Instructions

## Checkout the repo

```
git clone --recurse-submodules https://github.com/ivanpovazan/coreclr-android-perf.git
cd ./coreclr-android-perf
```

## Set up environment

- Run: `./prepare.sh`

NOTE: Pass `-f` to force reseting the environment and download the latest bits

## Build

Once `./prepare.sh` has been successfully executed you can start build template apps via `./build.sh <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent> <mono-coreclr> [run]`

## Measure startup with XAPTR

Once `./prepare.sh` has been successfully executed you can run `./measure_startup.sh <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>` to measure startup with https://github.com/grendello/XAPerfTestRunner by passing desired app for comparison

NOTE: `<dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>.conf` files include description about the exact configuration for the performance runs. Once measurements are completed the tool will output a report.md which can be inspected.
