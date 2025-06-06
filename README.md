Here's an **overview of your Flutter app** based on the provided code:

---

## 📱 **App Name:** Dividend Calculator

### 🧩 **Purpose:**

This mobile app allows users to **calculate monthly and total dividends** based on:

* Invested amount
* Annual dividend rate (%)
* Number of months invested (1–12)

It also includes:

* A result display
* An About page with user details
* A navigation drawer

---

## 🔨 **Core Features:**

### ✅ **1. Home Page (Dividend Calculator)**

* User inputs:

  * **Invested Amount (RM)**
  * **Annual Dividend Rate (%)**
  * **Months Invested (1–12)**
* Calculation:

  * Formula:

    ```dart
    monthlyDividend = (rate / 100 / 12) * amount
    totalDividend = monthlyDividend * months
    ```
* Results displayed in a styled card.
* Includes **Reset** and **Calculate** buttons.

### ✅ **2. About Page**

* Displays:

  * Name: **NURSYAHIRAH BINTI LUDIN**
  * Matric Number: **2023371795**
  * Course: **Mobile Technology Development**
* Includes a GitHub link.

### ✅ **3. Drawer Navigation**

* **Home** – Leads to the calculator
* **About** – Leads to user information

---

## 🎨 **UI & Styling Highlights:**

* Uses **Material Design**.
* Themed with green (`Color(0xFF81C784)`) and light background.
* **Rounded cards** and **text fields** for a clean, professional look.
* Icons like `attach_money`, `account_circle`, `person` enhance usability.

---

## 🔗 **External Libraries & Features:**

* **url\_launcher**:

  * Opens a GitHub URL (calculator repository).
* Responsive feedback using `SnackBar` on:

  * Input validation
  * URL launch failure

---

## 🔁 **User Interaction:**

* **Error handling** with snackbars if user inputs are invalid.
* **Dropdown menu** for selecting number of months.
* **Reset** clears all fields and result.
* **Link to GitHub** for source code.

---

## ✅ **Strengths:**

* Well-structured and user-friendly.
* Clean and consistent theming.
* Good use of Flutter widgets (Card, ListView, TextField, ElevatedButton, etc.).
* Proper input validation and feedback.
* Easy navigation via Drawer.

---

## 🔧 **Suggestions for Improvement (Optional):**

* Add input formatters to restrict non-numeric characters.
* Store results or history using local storage (e.g., `shared_preferences`).
* Make the GitHub link in About page functional using `_launchURL`.
* Add unit tests for logic validation.
* Include dark mode support for better accessibility.

---

---
## 🎨 lINK YOUTUBE**
**https://www.youtube.com/watch?v=tDgIGQT5I2I

---
## 🎨 lINK GITHUB**
https://nsyirah.github.io/Invesment-Dividend/

![Screenshot 2025-06-06 221020](https://github.com/user-attachments/assets/3eb6ad4b-96f0-4094-b628-9d82734737bb)
![Screenshot 2025-06-06 221038](https://github.com/user-attachments/assets/e5405828-3d6b-48e6-9052-ee5df1b178b3)
![Screenshot 2025-06-06 221102](https://github.com/user-attachments/assets/20342597-1cb9-4c2e-b415-40cf26b38529)
![Screenshot 2025-06-06 221114](https://github.com/user-attachments/assets/b50f80ab-60dd-4c30-93f4-0845b8bd2ace)

