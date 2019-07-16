# Description
I wrote this script because the Dropbox application on my Macbook was draining my battery. So I wrote this script and added it to my local cron to run every 5 minutes
# Setup
* Clone the repo
* CD in the directory where the repo exists and run the following command
```
chmod +x execute.sh
```
# Example
```
*/5 * * * * {Absolute path to repo}/execute.sh Dropbox 80
```
The above cron if setup on a Mac will run every 5 minutes and will start the Dropbox application if a charger is currently connected to the laptop and the battery percentage is > 80%
