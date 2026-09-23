# SkillSync — Freelancer Service Marketplace Platform

**SkillSync** is a college prototype web application built with **ASP.NET Web Forms (.NET Framework 4.7.2)** and **C#**. It provides a requirement-based freelancer marketplace that connects clients with skilled professionals through intelligent match percentage scoring, side-by-side candidate comparison, and comprehensive administrative oversight.

---

## Technical Stack & Architecture

| Layer | Technology |
| :--- | :--- |
| **Framework** | ASP.NET Web Forms (.NET Framework 4.7.2) |
| **Backend Language** | C# (`.aspx.cs` code-behind) |
| **Frontend Markup** | HTML5, ASP.NET Web Forms Controls |
| **Styling** | Custom Vanilla CSS (`StyleSheet1.css` based on CollegeHunt color palette `#2B1A12`, `#5A321F`, `#FFFAF3`, `#FAF7F2`, `#C99A5B`) |
| **Tooling & IDE** | Visual Studio 2022 / MSBuild |

---

## Core Application Modules

### 1. Client Portal
- **Home Landing Page (`Home.aspx`)**: Features hero requirement search, popular service categories grid, 3-step smart matching overview, and featured freelancer cards.
- **Find Freelancers (`FindFreelancer.aspx`)**: Comprehensive multi-criteria requirement input form capturing category, skills, budget range, delivery time, experience level, location, work mode, and priority filters.
- **Smart Match Engine (`MatchResults.aspx`)**: Displays ranked freelancer candidates with calculated **Match Percentages** (e.g. 94% Match, 87% Match), match justification checklists, skill overlap badges, and interactive profile modals.
- **Side-by-Side Candidate Comparison (`Compare.aspx`)**: Interactive side-by-side comparison matrix evaluating candidates across hourly rates, ratings, completed projects, delivery estimates, location, work mode, and skills.
- **User Authentication (`Login.aspx`)**: Role-based access portal supporting Client, Freelancer, and Administrator roles with automatic post-login redirection.

### 2. Admin Portal
- **Admin Dashboard Overview (`AdminDashboard.aspx`)**: Key Performance Indicators (KPI metric cards), real-time activity timeline, and system overview.
- **User Management (`ManageUsers.aspx`)**: Administrator module for searching, filtering, adding, editing, and managing Client and Freelancer accounts.
- **Service Catalog Management (`ManageServices.aspx`)**: Catalog management interface for reviewing, editing, pricing, and moderating listed freelancer services.
- **Order Transaction Management (`ManageOrders.aspx`)**: Central order tracking dashboard monitoring order statuses, dates, amounts, and client transactions.

---

## Repository Folder Architecture

```text
SkillSync/
├── SkillSync.sln                           # Visual Studio Solution File
├── .gitignore                              # Git ignore configuration
├── PAGE_CONTROLS_DOCUMENTATION.md          # Comprehensive ASP.NET Controls Matrix
├── README.md                               # Project Documentation
└── SkillSync/                              # ASP.NET Web Application Root
    ├── Web.config                          # ASP.NET Application Configuration
    ├── packages.config                     # NuGet Package Dependencies
    ├── css/
    │   └── StyleSheet1.css                 # Global Custom Design System
    ├── images/
    │   ├── main-logo.png                   # SkillSync Brand Logo
    │   ├── freelancer1.jpg                 # Candidate Avatar 1 (Aarav Mehta)
    │   ├── freelancer2.jpg                 # Candidate Avatar 2 (Riya Shah)
    │   ├── freelancer3.jpg                 # Candidate Avatar 3 (Vikram Malhotra)
    │   └── freelancer4.jpg                 # Candidate Avatar 4 (Ananya Verma)
    └── Pages/
        ├── client/                         # Client Portal Sub-folder
        │   ├── client-side.Master          # Client Master Page Layout & CollegeHunt Footer
        │   ├── client-side.Master.cs
        │   ├── client-side.Master.designer.cs
        │   ├── Home.aspx                   # Home Landing Page
        │   ├── Home.aspx.cs
        │   ├── Home.aspx.designer.cs
        │   ├── FindFreelancer.aspx         # Requirement Search & Input Form
        │   ├── FindFreelancer.aspx.cs
        │   ├── FindFreelancer.aspx.designer.cs
        │   ├── MatchResults.aspx           # Match Percentage & Candidate Results
        │   ├── MatchResults.aspx.cs
        │   ├── MatchResults.aspx.designer.cs
        │   ├── Compare.aspx                # Side-by-Side Comparison Matrix
        │   ├── Compare.aspx.cs
        │   ├── Compare.aspx.designer.cs
        │   ├── Login.aspx                  # Role-Based Authentication Portal
        │   ├── Login.aspx.cs
        │   └── Login.aspx.designer.cs
        └── admin/                          # Admin Portal Sub-folder
            ├── admin-side.Master           # Admin Master Page Sidebar & Header Layout
            ├── admin-side.Master.cs
            ├── admin-side.Master.designer.cs
            ├── AdminDashboard.aspx         # Admin KPI Dashboard & Timeline
            ├── AdminDashboard.aspx.cs
            ├── AdminDashboard.aspx.designer.cs
            ├── ManageUsers.aspx            # User Management Table
            ├── ManageUsers.aspx.cs
            ├── ManageUsers.aspx.designer.cs
            ├── ManageServices.aspx         # Service Catalog Table
            ├── ManageServices.aspx.cs
            ├── ManageServices.aspx.designer.cs
            ├── ManageOrders.aspx           # Order Management Table
            ├── ManageOrders.aspx.cs
            └── ManageOrders.aspx.designer.cs
```

---

## Visual Studio Web Forms Designer Compatibility

All `.aspx` pages have been specifically formatted for 100% error-free operation in Visual Studio Web Forms Designer:
1. **Relative Master Page File Referencing**: All content pages utilize relative path declarations (`MasterPageFile="client-side.Master"` and `MasterPageFile="admin-side.Master"`).
2. **Zero Outer Whitespace**: All content files contain 0 whitespace or blank line characters before/after `<asp:Content>` tags to prevent Visual Studio's *"The page contains markup that is not valid when attached to a Master Page"* error.
3. **Vanilla CSS & Standard Controls**: High-performance, clean UI built with standard Web Forms controls without external JS framework wrappers.

---

## Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/neavpanjwani99/SkillSync.git
   ```
2. **Open Solution**: Launch `SkillSync.sln` in **Visual Studio 2022**.
3. **Restore Packages & Build**:
   - Right-click Solution in Solution Explorer -> **Restore NuGet Packages**.
   - Build Solution (`Ctrl + Shift + B`).
4. **Run Application**: Set `Pages/client/Home.aspx` as Start Page and press `F5` or `Ctrl + F5`.

---

## Development Team

- **Neav Panjwani** — *Frontend Developer*
- **Manya Nirvan** — *Backend Developer*