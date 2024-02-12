
## Pydexcom Install and Setup
This project uses the pydexcom API to pull your dexcom readings. 
Follow along with the creator's steps to install pydexcom on your machine and setup your Dexcom account for sharing. 
>> https://github.com/gagebenne/pydexcom
1. Download the Dexcom G6 / G5 / G4 mobile app and enable the Share service.
  The Dexcom Share service requires setup of at least one follower to enable the share service, but pydexcom will use your credentials, not the follower's
2. Install the pydexcom package.
>> pip3 install pydexcom


## Setting Up Credentials
To use this project, you'll need to set up your own credentials. Follow these steps:

1. Open the `credentials_template.json` file located in the project directory.
2. Replace the placeholders with your Dexcom username and password.
3. Save the file as `credentials.json`.
4. Now you're ready to run the project with your own credentials.
NOTE: These credentials must be YOUR DEXCOM ACCOUNT credentials, not a follower of the account. See the pydexcom documentation for more information.

# Your Project Name

Welcome to [Your Project Name]! Before you start, make sure you have Python 3 installed on your machine.

## How to Install Python 3

1. **Windows:**
   - Visit the [Python Downloads](https://www.python.org/downloads/) page.
   - Download the latest version of Python 3 for Windows.
   - Follow the installation instructions provided during the installation process.

2. **macOS:**
   - Open a terminal.
   - Install Homebrew (if not already installed): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
   - Install Python 3: `brew install python3`

3. **Linux:**
   - Use the package manager specific to your distribution (e.g., `apt` for Ubuntu, `yum` for Fedora).
   - Example for Ubuntu: `sudo apt-get update && sudo apt-get install python3`

## Find the Path to Python 3

To configure [Your Project Name], you'll need to know the path to Python 3 on your machine. Here's how you can find it:

- **Windows:**
  - Open a Command Prompt.
  - Type `where python` and press Enter. Look for the path to the Python executable.

- **macOS and Linux:**
  - Open a terminal.
  - Type `which python3` and press Enter. Look for the path to the Python executable.

## Verify Installation

After installation and finding the path, open a terminal and run the following command to verify that Python 3 is installed:

```bash
python3 --version


## Configuration
To use this project, the project needs access to the file path containing your

1. Open `ConfigTemplate.swift`.
2. Replace the placeholder paths with the actual paths on your system.
3. Save the file as `Config.swift`.
