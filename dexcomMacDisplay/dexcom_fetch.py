# dexcom_fetch.py

from pydexcom import Dexcom
import os
import json

def fetch_dexcom_data(username, password):
    dexcom = Dexcom(username, password)
    glucose_reading = dexcom.get_current_glucose_reading()
    readings = dexcom.get_glucose_readings(180,36)  # Adjust the number of readings as needed

    # Print the current glucose value and trend arrow
    print(f"{glucose_reading.value} {glucose_reading.trend_arrow}", end=" ")

    # Print the previous readings
    print(" ".join(str(reading) for reading in readings))



# Call the function if the script is run directly
if __name__ == "__main__":
    # Get the directory of the current script
    script_dir = os.path.dirname(os.path.realpath(__file__))

    # Combine the script directory with the credentials file
    credentials_path = os.path.join(script_dir, 'credentials.json')

    # Open and read the credentials file
    with open(credentials_path) as f:
        credentials = json.load(f)

    username = credentials['username']
    password = credentials['password']
    
    fetch_dexcom_data(username, password)

