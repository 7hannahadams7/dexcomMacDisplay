# dexcomMacDisplay
Below is the walkthrough to setup the macOS Dexcom display on your machine. 

## Python 3
The dexcomMacDisplay script requires the use of python3. Follow the below steps to ensure proper setup and find the path to the Python executable. 

### Install Python 3
1. Visit the [Python Downloads](https://www.python.org/downloads/) page.
2. Download the latest version of Python 3 for Windows.
3. Follow the installation instructions provided during the installation process.

### Verify Installation
After installation and finding the path, open a terminal and run the following command to verify that Python 3 is installed:

```bash
python3 --version
```

## Find the Path to Python 3
To configure the project, you'll need to know the path to Python 3 on your machine. Here's how you can find it:

- **Windows:**
  - Open a Command Prompt.
  - Type `where python` and press Enter. Look for the path to the Python executable.

- **macOS and Linux:**
  - Open a terminal.
  - Type `which python3` and press Enter. Look for the path to the Python executable.
 
## File Path Configuration
Now with the location of your Python executable, the project needs access to your file paths.

1. Open `PythonConfigTemplate.swift`.
2. Replace the placeholder paths with the actual paths on your system.
  - Change the variable `pythonPath` to the path you found above to you Python executable. The full path should end with `/python3`.
  - Change the variable `projectPath` to the location of this project file (ex. `/Users/User1/Downloads/`)
3. Save the file as `PythonConfig.swift`.

## Pydexcom Install and Setup
This project uses the pydexcom API to pull your dexcom readings. 

Follow along with the creator's steps to install pydexcom on your machine and setup your Dexcom account for sharing. 
>> https://github.com/gagebenne/pydexcom
Most importantly, follow the first two steps to get pydexcom installed and your Dexcom sharing configured. 
1. Download the Dexcom G6 / G5 / G4 mobile app and enable the Share service.
  The Dexcom Share service requires setup of at least one follower to enable the share service, but pydexcom will use your credentials, not the follower's
2. Install the pydexcom package.
   `pip3 install pydexcom`

## Setting Up Dexcom Credentials
To use this project, you'll need to set up your own Dexcom credentials. Follow these steps:

1. Open the `credentials_template.json` file located in the project directory.
2. Replace the placeholders with your Dexcom username and password.
3. Save the file as `credentials.json`.
4. Now you're ready to run the project with your own credentials.
NOTE: These credentials must be YOUR DEXCOM ACCOUNT credentials, not a follower of the account. See the pydexcom documentation for more information.
