# The CE-CLM code will soon be a part of OpenFace 2.0. Please visit [OpenFace Github](https://github.com/TadasBaltrusaitis/OpenFace/) to download the newest OpenFace. 

# Using CE-CLM

Binaries for Windows are available here:

- 32-bit: (https://github.com/A2Zadeh/CE-CLM/releases/download/v0.2.3/OpenFace_CE-CLM_win32.zip)
- 64-bit: (https://github.com/A2Zadeh/CE-CLM/releases/download/v0.2.3/OpenFace_CE-CLM_win_x64.zip)

For the binaries to work you need to have Visual Studio 2015 installed or need to install the 64-bit Visual C++ redistributable package.

Explanation of how to use the command line binaries can be found [here](https://github.com/TadasBaltrusaitis/OpenFace/wiki/Command-line-arguments).

**Note:** As the CE-CLM model files are large (total ~1GB), we do not include the files in this release. When the programs are first run, they will offer to download the model files from (here)[http://sorena.multicomp.cs.cmu.edu/cen_patches/]. If you wish to manually download the model files, save the .dat files to `model/patch_experts`.

## From code

This distribution has been tested with Windows 10, using Visual Studio 2015. To compile, open "OpenFace.sln" using Visual Studio 2015 and compile the code. The project was built and tested on Visual Studio 2015, in Windows 10.
