# Overview
**VeriPol is a mobile application that aims to make it easier for voters to make smart decisions throughout the ballot.** 
The idea is simple, we gather data about the 2022 candidates, and soon the elected officials. We then define key performance metrics on our politicians, Bills and Laws Passed for Legislators and Economic Data for Executive officials. We have around 400,000 elected officials from the President down to the Brgy. Captains and Sk Chairmans in the PH, Our goal is to help voters navigate through the complexity, making it easier to vote smarter by providing transparency to our government processes.

## Quick Links

### GitHub
* [VeriPol Data Repository](https://bit.ly/VeriPol_Data)
* [APK Release](https://bit.ly/VeriPolAPK_BETAVersion)

### Documentation 
* [VeriPol 2 Min Video Demo](https://bit.ly/VeriPol_AVP)
* [VeriPol Blog](https://bit.ly/VeriPolTeamBlog)

### Designs and other Docs
* [Prototype](https://bit.ly/VeriPolPrototype)
* [Mockups](https://bit.ly/VeriPol_Mockups)
* [Subject Matter Experts Interview](https://bit.ly/VeriPol_SME_int)
* [VeriPol Primer](https://bit.ly/VeriPolPrimer)



# Installation Guide
#### There are two ways in approaching this, either you install the app with the apk provided or run(debug) the code itself.
1. Install the Latest APK release Here:
* [APK Release](https://bit.ly/VeriPolAPK_BETAVersion)

2. Or run the code

#### For Running the code you need to do the following:
1. Download a code editor. Preferably VSCode.
    * If you don't have VSCode, you can download it here  [VSCodeDownloadLink](https://code.visualstudio.com/).

2. Once you have a code editor, you need to download the flutter SDK
    * Depending on your Operating System you can get different flutter SDKs with this [flutter-sdk](https://docs.flutter.dev/get-started/install).


3. After downloading the flutter SDK, update your path environment variable. 


4. If you already update the path environment variable, then go to terminal and run *flutter doctor*
    * This will check whether the evironment was correclty set up and it will display a report of the status of the Flutter installation.
    * If errors are evident in the terminal, download the dependencies that are mentioned in order to proceed.
    * FOR A STEP BY STEP FLUTTER INSTALLATION INSTRUCTION SEE THIS [LINK](https://docs.flutter.dev/get-started/install/windows).

5. Let's say all thigs are set, VSCode and flutter are already installed. You can now clone the repository.

6. After cloning, you might need to run **flutter pub get** in order to load all dependencies that was utilized by the app.

7. Once done, go ahead and press CTRL+SHIFT+P. A pop up window will open from the top. Then type flutter select device.
    * You will see a dropdown of devices that can be used to run the app.
    * Just select the **flutter emulator**.
8. An emulator will boot up and you can now run the app by typing **flutter run** in the terminal.
9. The first load will take some time but it'll eventually run.

> Skipping all those things that were previously mentioned, you can just actually download the early version apk of VeriPol v0.1-beta. We made a pre-released apk of VeriPol where you can download and utilize.


# Bug Report and Feedback Forms:

App Bug Report:
https://bit.ly/VeriPolBETA_BugReport

If you want to further help in developing the application, fill out our 2-part survey here:
https://bit.ly/VeriPolAppS1
*we'll be sending a token of appreciation to the survey respondents through GCash







## OUR GOAL
**We want to make it easier for voters to make an informed decision when electing officials from the President, down to the Brgy. Level Officials.**

***
## VeriPol Current Status
As of now VeriPol is on its early stages (verison 0.1-beta). To be released for usability tests.

# VeriPol Sample Screens

## Dashboard

<img width="1920" alt="Dashboard" src="https://user-images.githubusercontent.com/85066839/160744832-a27f9fc7-156e-448d-a81c-683c01d9b612.png">

## My Candidate

<img width="1920" alt="My Candidates Feature" src="https://user-images.githubusercontent.com/85066839/160745677-26adf132-5e3d-4a38-b2e9-15c1acfd968f.png">

## Legislative Officials

<img width="1920" alt="Legislative" src="https://user-images.githubusercontent.com/85066839/160743760-6fe8bb31-85ac-46b3-b3b2-3541fa38e752.png">

## Executive Officials

<img width="1920" alt="Executive Officials" src="https://user-images.githubusercontent.com/85066839/160747083-d650b345-3ab9-4be4-9132-626149cc8a91.png">

## Learn Feature

<img width="1920" alt="Learn" src="https://user-images.githubusercontent.com/85066839/160747573-a8828291-6eae-4a76-a519-25a57f160ce1.png">

***
# Technologies
***
List of technologies used in the project:
* [Flutter](https://flutter.dev/): Version 2.10.4
    * The main framework used in developing the whole application.
* [Firebase](https://firebase.google.com/)
    * A NoSQL Google Serverless dB used for authentication and user settings.


















