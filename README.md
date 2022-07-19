# Refund-by-Location-dApp


## Introduction 
This project is aimed to be used when one party, *for example an **employer***, agrees to pay another party, for *example an **employee***, for being present in a certain geographic area for a certain duration. The employee’s phone sends its GPS location to a smart contract at a certain interval. Based on the pre-agreed contract codified in an Ethereum smart contract, a cryptocurrency payment is executed **when all the agreed conditions are met**.  

If, at any point, the GPS sensor indicates that an employee is outside the range of the agreed GPS area, the contract state will be updated to indicate that it is out of compliance. The GPS data will be gathered from the participant's phone sensor through a companion mobile app. The app will not require much interaction once it is installed. The app will be running in the background and will send out the location randomly throughout the duration.

## Requirements
This project requires Flutter for mobile app and admin panel and Truffle for the smart contract.

## Contents

### [Contracts][https://github.com/teddyk251/Refund-by-Location-dApp/tree/main/contracts]
Here is the smart contract for this project. It is built using Solidity.

### [Mobile app][https://github.com/teddyk251/Refund-by-Location-dApp/tree/main/mobile_app]
The mobile app is built using Flutter. It sends out the location of the user at random times to the smart contract.

### [Admin panel][https://github.com/teddyk251/Refund-by-Location-dApp/tree/main/admin_panel]
This is the dashboard used by the admin to add new employees into the contract and see whether they have fulfilled their compliance. This admin panel is built using Flutter.

## Contributors
* Tewodros Kederalah

