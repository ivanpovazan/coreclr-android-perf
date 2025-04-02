# Instructions

## Checkout the repo

```
git clone --recurse-submodules https://github.com/ivanpovazan/coreclr-android-perf.git
cd ./coreclr-android-perf
```

## Set up environment

Run: `./prepare.sh`

Pass `-f` to force reseting the environment and download the latest bits. 
Additionally, pass `-userollback` in order to use specific version defined in the rollback.json, for example:

```
./prepare.sh -f -userollback
```

IMPORTANT: Currently [rollback.json](./rollback.json) is set to: `36.0.0-preview.3.20/10.0.100-preview.3`

## Build / run

Once `./prepare.sh` has been successfully executed you can start build template apps via `./build.sh <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent> <mono-coreclr> <build-run> <ntimes> [additional_args]`, for example:

```
./build.sh dotnet-new-android mono run 1 -p:_BuildConfig=JIT 
```

NOTE: [Directory.Build.props](./Directory.Build.props) defines some common configuration options like based on `_BuildConfig` MSBuild property

## Measure startup with XAPTR

Run `./measure_startup.sh <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>` to measure startup with https://github.com/grendello/XAPerfTestRunner by passing desired app for comparison.

NOTE: `<dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>.conf` files include description about the exact configuration for the performance runs. Once measurements are completed the tool will output a report.md which can be inspected.

## Apk sizes

WIP: Run `./print_apk_sizes` after building apps with specific configuration to get size infos.
