# SkillSync - Freelancer & Client Marketplace Platform

SkillSync is an online web application built using **ASP.NET Web Forms (.NET Framework 4.7.2)** and **C#**, designed to seamlessly connect skilled freelancers with clients seeking project services.

## 🚀 Key Features
- **Client Portal & Layout**: Structured master page layout (`client-side.Master`) providing consistent header navigation, active branding, and footer support.
- **Find Freelancers**: Specialized search and discovery page (`FindFreelancer.aspx`) for browsing profiles, skills, and rates.
- **Client Home Dashboard**: Landing page (`Home.aspx`) with call-to-action sections for posting projects and finding talent.
- **Responsive Styling**: Custom CSS layout system (`StyleSheet1.css`) tuned for multi-device viewing.

## 🛠️ Technology Stack
- **Framework**: ASP.NET Web Forms (.NET Framework 4.7.2)
- **Language**: C#
- **Frontend**: HTML5, CSS3, JavaScript
- **IDE**: Visual Studio 2022 / 2019

## 📁 Repository Structure
```
SkillSync/
├── SkillSync.sln             # Visual Studio Solution File
├── .gitignore                # Git ignore configuration
└── SkillSync/                # Web Application Project Root
    ├── css/
    │   └── StyleSheet1.css   # Main Stylesheet
    ├── images/
    │   └── main-logo.png     # Application Logo
    ├── Pages/
    │   └── client/
    │       ├── client-side.Master    # Master Page Layout
    │       ├── Home.aspx             # Home Page
    │       └── FindFreelancer.aspx   # Freelancer Search Page
    ├── Web.config            # ASP.NET Web Configuration
    └── packages.config       # NuGet Package Dependencies
```

## ⚙️ Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/neavpanjwani99/SkillSync.git
   ```
2. Open `SkillSync.sln` in **Visual Studio**.
3. Restore NuGet packages and run the project (Press `F5` or `Ctrl + F5`).

---
Developed by **Neav Panjwani**.