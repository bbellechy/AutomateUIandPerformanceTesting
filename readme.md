# README: Automation Testing and Performance Testing  

## Overview  
This project focuses on two main testing types: **UI Automation Testing** and **Performance Testing**. The aim is to ensure the system's functionality and reliability under various conditions using tools like **Robot Framework** for UI automation and **K6** for performance testing.  

---
## Test Environment
The tests target the system hosted at:
http://45.136.236.146:8081/

Ensure the system is accessible and functional before running tests.

## UI Automation Testing  

### Tools Used  
- **Robot Framework**: A generic automation framework used for UI testing.  
- **SeleniumLibrary**: Provides the ability to interact with web elements.  

### Setup  
1. Install Robot Framework and SeleniumLibrary:  
   ```bash
   pip install robotframework
   pip install robotframework-seleniumlibrary
