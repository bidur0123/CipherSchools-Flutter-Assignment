# Personal Expense Tracker App

## Objective
The objective of this assignment is to design and implement a scalable frontend using Flutter and Firebase for a personal expense tracker app.

## Tasks

### Task 1: Expense Tracker App Interface

#### User Interface
- Design a clean and intuitive UI for the personal expense tracker app.
- Utilize Material Design components for consistency and user familiarity.

#### Features
1. **Expense and Income Entries**
    - Implement the ability to add both expense and income entries.
    - Ensure a user-friendly interface for capturing financial transactions.

2. **Swipe to Delete**
    - Allow users to delete expenses by utilizing swipe gestures.
    - Enhance user experience by providing an intuitive way to remove entries.

3. **Expense Categorization**
    - Categorize expenses (e.g., food, travel, subscriptions, shopping).
    - Implement a tagging or categorization system for better expense organization.

4. **Financial Overview**
    - Display a summary of income and expenses.
    - Provide visualizations or charts to help users understand their financial data over time.

5. **Local Database Storage**
    - Store the created data locally using databases such as SQFlite or Hive.
    - Fetch data from local storage to display in the app.

### Task 2: Google Authentication

1. **User Authentication**
    - Implement Google authentication for user login/signup.
    - Allow users to sign in using their Google accounts for a seamless experience.

2. **Cloud Firestore Integration**
    - Upon successful signup, store user details (name and email) in Cloud Firestore.
    - Use the Firebase user ID as the document name for easy retrieval.

3. **Local Storage for User ID**
    - Store the user ID locally using shared preferences to maintain user sessions.
    - Enable automatic login for users who have signed in during the previous session.

4. **Logout Functionality**
    - Implement a logout feature to allow users to sign out when needed.

## Technologies Used
- Flutter
- Firebase (Authentication, Cloud Firestore)
- SQFlite or Hive (for local database storage)

## Author
Bidur Gupta

## Download the App
[![Download APK](https://img.shields.io/badge/Download-APK-brightgreen)]https://drive.google.com/file/d/1LThuwEtj8pNL-CSDdWKWNQLOyOJqfbfL/view?usp=sharing

## License
This project is licensed under the [MIT License](LICENSE).
