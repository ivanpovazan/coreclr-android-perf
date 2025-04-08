# Instructions

## Cloning the repo

```
git clone --recurse-submodules https://github.com/ivanpovazan/coreclr-android-perf.git
cd ./coreclr-android-perf
```

## Setting up the environment

### Using latest nightly builds

To prepare environment to use nighlty builds run:

```bash
./prepare.sh
```

> [!NOTE]
> Passing `-f` to the script resets the currently set environment.

### Using 10.0.100-preview.3 builds

To prepare environment to use preview 3 builds run:

```bash
./prepare.sh -f -userollback
```

> [!NOTE]
> Passing `-userollback` updates the workloads to the version specified in [rollback.json](./rollback.json) which is currently set to: `36.0.0-preview.3.20/10.0.100-preview.3` to ensure preview 3 builds.

## Performance measurments

### Measuring startup with XAPTR

To measure startup performance with [XAPTR](https://github.com/grendello/XAPerfTestRunner) tool pass desired app for comparison:

```bash
./measure_startup.sh <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>`
```

> [!NOTE]
> Each app: `<dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent>` has its own `.conf` file describing the exact configuration used for performance runs (e.g., [dotnet-new-android.conf](./dotnet-new-android.conf)). Once measurements are completed the tool will output a `report.md` which can be inspected.

> [!NOTE]
> XAPTR can be manually run with any custom `.conf` file via: `./build/xaptr -x some-custom-conf-file.conf`

### Building / running sample apps manually

Once `./prepare.sh` has been successfully executed you can also manually build/run template apps via `./build.sh <dotnet-new-android|dotnet-new-maui|dotnet-new-maui-samplecontent> <mono-coreclr> <build-run> <ntimes> [additional_args]`, where `additional_args` can be a list of MSBuild properties.

For example:

- To build `dotnet new android` sample with Mono in JIT configuration:

    ```bash
    ./build.sh dotnet-new-android mono build 1 -p:_BuildConfig=JIT
    ```

- To run `dotnet new maui` sample with CoreCLR in R2R configuration:

    ```bash
    ./build.sh dotnet-new-maui coreclr run 1 -p:_BuildConfig=R2R
    ```

> [!NOTE]
> [Directory.Build.props](./Directory.Build.props) defines some common configuration options like based on `_BuildConfig` MSBuild property which can be used to run different predefined configs

### WIP: Measuring Apk sizes

This is still WIP but running `./print_apk_sizes` can provided information about built apps in the terminal.

## Typical worklfow

1. Checkout the repo:

    ```bash
    git clone --recurse-submodules https://github.com/ivanpovazan/coreclr-android-perf.git
    cd ./coreclr-android-perf
    ```

2. Prepare environment:

    ```bash
    ./prepare.sh
    ```

3. Run startup measurements:

    ```bash
    ./measure_startup.sh dotnet-new-android
    ```

    Runs startup measurements with XAPTR and outputs the results in `results.md` as reported in the console.

4. Build time measurements:

    ```bash
    ./build.sh dotnet-new-android coreclr build 1 -p:_BuildConfig=JIT
    ```

    Runs the build and outputs the build time in the terminal, using CoreCLR and JIT configuration. The build artifacts end up in `./build` folder. Increase the number of iterations as needed.

5. Apk size measurements:

    ```bash
    ./print_apk_sizes.sh
    ```

    Traverses `./build` folder and prints out size of `.apk` files. E.g,:

    ```bash
    File: ./build/dotnet-new-android_20250408140850/bin/Release/net10.0-android/android-arm64/com.companyname.dotnet_new_android-Signed.apk, Size: 8506265 bytes
    ```

> [!NOTE]
> Clean `./build` folder as needed.

## 
