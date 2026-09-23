# SkillSync ~ Requirement-Based Freelancer Marketplace Platform

**SkillSync** is an ASP.NET Web Forms web application built with **.NET Framework 4.7.2**, **C#**, and **SQL Server (ADO.NET Practical 12 Architecture)**. It provides an end-to-end requirement-based marketplace connecting clients with skilled freelance professionals through intelligent match scoring, candidate selection by identification, side-by-side comparison, and administrative oversight.

---

## Technical Stack & Architecture

| Layer | Technology |
| :--- | :--- |
| **Framework** | ASP.NET Web Forms (.NET Framework 4.7.2) |
| **Backend Language** | C# (`.aspx.cs` code-behind) |
| **Database Engine** | Microsoft SQL Server (`SkillSync` Database) |
| **Database Access** | Standard ADO.NET (`SqlConnection`, `SqlCommand`, `SqlDataReader`, `SqlDataAdapter`, `DataTable`) |
| **Frontend Markup** | HTML5, ASP.NET Server Controls (`<asp:Repeater>`, `<asp:DropDownList>`, `<asp:TextBox>`, `<asp:Button>`, `<asp:Panel>`) |
| **Styling** | Custom Vanilla CSS (`StyleSheet1.css` palette `#2B1A12`, `#5A321F`, `#FFFAF3`, `#FAF7F2`, `#C99A5B`) |
| **Tooling & IDE** | Visual Studio 2022 / MSBuild |

---

## Key Platform Features

### 1. Client Portal
- **Home Landing Page (`Home.aspx`)**: Features category dropdown loaded dynamically from database `CATEGORIES` table, hero requirement search, and 3-step platform overview.
- **Find Freelancers (`FindFreelancer.aspx`)**: Structured requirement posting form capturing project budget, category, skills, delivery time (in integer days), experience, location, and work mode. Submits record to `PROJECT_REQUIREMENTS` database table.
- **Smart Match Engine & Selection (`MatchResults.aspx`)**: 
  - Displays dynamic freelancer listings fetched from database (`USERS` joined with `SERVICES` and `CATEGORIES`).
  - **Select Freelancer by Identification**: Dropdown filter allowing clients to search and select freelancers by unique ID (`ID: FL-005`) or registered email (`aarav@gmail.com`).
  - **Select & Hire Action**: Direct "Select & Hire" button inserting order transactions into database `ORDERS` table.
- **Side-by-Side Candidate Comparison (`Compare.aspx`)**: Dual dropdown candidate selection filled from database `USERS` for side-by-side evaluation.
- **User Authentication (`Login.aspx`)**: Handles role-based login (Client, Freelancer, Admin) and client user registration with dynamic `UserID` auto-increment.

### 2. Admin Portal
- **Admin Dashboard (`AdminDashboard.aspx`)**: Dynamic KPI metric cards calculating `COUNT(*)` stats for Users, Freelancers, Services, and Orders, category breakdown, and recent activity log.
- **User Management (`ManageUsers.aspx`)**: Admin module for reviewing users, editing user details (Email, Location, Status, Name), adding new Freelancers, and performing foreign key cascade deletions.
- **Service Catalog Management (`ManageServices.aspx`)**: Catalog management interface for creating, editing, and deleting listed freelancer services.
- **Order Transaction Management (`ManageOrders.aspx`)**: Central order tracking dashboard monitoring client-freelancer transactions, totals, and statuses.

---

## Database Architecture & Connection

- **Connection String**: `Data Source=NEAV;Initial Catalog=SkillSync;Integrated Security=True;TrustServerCertificate=True`
- **Tables**: `USERS`, `CATEGORIES`, `SERVICES`, `FREELANCER_SKILLS`, `PROJECT_REQUIREMENTS`, `ORDERS`.
- **Dynamic Primary Key Auto-Increment**: SQL subquery pattern `(select isnull(max(ID), 0) + 1 from TABLE)` used for primary key generation across all tables.

---

## Repository Folder Architecture

```text
SkillSync/
├── SkillSync.sln                           # Visual Studio Solution File
├── .gitignore                              # Git ignore configuration
├── README.md                               # Main Project Documentation
└── SkillSync/                              # ASP.NET Web Application Root
    ├── Web.config                          # ASP.NET Application Configuration
    ├── packages.config                     # NuGet Package Dependencies
    ├── css/
    │   └── StyleSheet1.css                 # Global Custom Design System
    ├── images/
    │   ├── main-logo.png                   # SkillSync Brand Logo
    │   ├── freelancer1.jpg                 # Candidate Avatar 1
    │   ├── freelancer2.jpg                 # Candidate Avatar 2
    │   ├── freelancer3.jpg                 # Candidate Avatar 3
    │   └── freelancer4.jpg                 # Candidate Avatar 4
    └── Pages/
        ├── client/                         # Client Portal Pages
        │   ├── client-side.Master          # Client Master Page Layout
        │   ├── Home.aspx                   # Home Landing Page
        │   ├── FindFreelancer.aspx         # Requirement Search Form
        │   ├── MatchResults.aspx           # Match Results & Freelancer Selection
        │   ├── Compare.aspx                # Candidate Comparison Matrix
        │   └── Login.aspx                  # User Authentication Portal
        └── admin/                          # Admin Portal Pages
            ├── admin-side.Master           # Admin Master Page Sidebar Layout
            ├── AdminDashboard.aspx         # Admin KPI Dashboard
            ├── ManageUsers.aspx            # User Management Table
            ├── ManageServices.aspx         # Service Catalog Table
            └── ManageOrders.aspx           # Order Management Table
```

---

## Visual Studio & Designer Compatibility

1. **Error-Free Web Forms Markup**: All content pages use clean `<asp:Content>` tags without outer whitespace to guarantee Visual Studio Web Forms Designer compatibility.
2. **Standard ADO.NET Code-Behind**: Beginner-friendly C# code-behind logic without complex external ORM dependencies.

---

## Installation & Setup

1. **Clone Repository**:
   ```bash
   git clone https://github.com/neavpanjwani99/SkillSync.git
   ```
2. **Database Setup**: Execute database script in **SQL Server Management Studio (SSMS)** under database name `SkillSync`.
3. **Open & Build**:
   - Launch `SkillSync.sln` in **Visual Studio 2022**.
   - Build Solution (`Ctrl + Shift + B`).
4. **Run Application**: Set `Pages/client/Home.aspx` as Start Page and press `F5` / `Ctrl + F5`.

---

## Development Team

- **Neav Panjwani** ~ *Frontend Developer*
- **Manya Nirvan** ~ *Backend Developer*
