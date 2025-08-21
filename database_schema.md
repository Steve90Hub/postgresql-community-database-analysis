# Database Schema Documentation
## Murder Mystery Database Structure

---

## 📋 Database Overview
The Murder Mystery Database contains 7 interconnected tables representing a comprehensive community dataset including demographics, economic data, transportation records, and fitness center information.

## 🗂️ Table Structures & Relationships

### 1. **person** (Primary Demographics Table)
**Purpose**: Core demographic information for community members

| Column Name | Data Type | Description | Key Type |
|-------------|-----------|-------------|----------|
| `id` | INTEGER | Unique person identifier | PRIMARY KEY |
| `name` | VARCHAR | Full name of community member | - |
| `license_id` | INTEGER | Foreign key to drivers_license | FOREIGN KEY |
| `address_number` | INTEGER | Street address number | - |
| `address_street_name` | VARCHAR | Street name for population analysis | - |
| `ssn` | VARCHAR | Social Security Number | UNIQUE |

**Business Use**: Central table for all demographic queries and population analysis

---

### 2. **drivers_license** (Transportation & Vehicle Data)
**Purpose**: Vehicle ownership and license information

| Column Name | Data Type | Description | Key Type |
|-------------|-----------|-------------|----------|
| `id` | INTEGER | License record identifier | PRIMARY KEY |
| `age` | INTEGER | Age of license holder | - |
| `height` | INTEGER | Physical characteristic | - |
| `eye_color` | VARCHAR | Physical characteristic | - |
| `hair_color` | VARCHAR | Physical characteristic | - |
| `gender` | CHAR(1) | Gender identifier (M/F) | - |
| `plate_number` | VARCHAR | Vehicle registration | - |
| `car_make` | VARCHAR | Vehicle brand/manufacturer | - |
| `car_model` | VARCHAR | Specific vehicle model | - |

**Business Use**: Transportation analysis, vehicle brand popularity, demographic correlations

---

### 3. **income** (Economic Data)
**Purpose**: Annual income information linked to demographic data

| Column Name | Data Type | Description | Key Type |
|-------------|-----------|-------------|----------|
| `ssn` | VARCHAR | Social Security Number | FOREIGN KEY |
| `annual_income` | INTEGER | Yearly income in dollars | - |

**Business Use**: Economic analysis, fundraising targeting, wealth distribution studies

**Relationship**: Links to `person` table via SSN for complete demographic-economic profiles

---

### 4. **get_fit_now_member** (Fitness Center Membership)
**Purpose**: Gym membership records and status tracking

| Column Name | Data Type | Description | Key Type |
|-------------|-----------|-------------|----------|
| `id` | VARCHAR | Membership identifier | PRIMARY KEY |
| `person_id` | INTEGER | Reference to person table | FOREIGN KEY |
| `name` | VARCHAR | Member name | - |
| `membership_start_date` | DATE | Enrollment date | - |
| `membership_status` | VARCHAR | Status category (Gold/Regular) | - |

**Business Use**: Health program analysis, membership trend tracking, facility utilization

---

### 5. **get_fit_now_check_in** (Gym Attendance Tracking)
**Purpose**: Daily gym visit records for usage analysis

| Column Name | Data Type | Description | Key Type |
|-------------|-----------|-------------|----------|
| `membership_id` | VARCHAR | Member identifier | FOREIGN KEY |
| `check_in_date` | DATE | Visit date | - |
| `check_in_time` | INTEGER | Visit time | - |

**Business Use**: Facility usage patterns, peak hour analysis, member engagement metrics

---

### 6. **interview** (Investigation Records)
**Purpose**: Interview transcripts and investigation data

| Column Name | Data Type | Description | Key Type |
|-------------|-----------|-------------|----------|
| `person_id` | INTEGER | Interviewee identifier | FOREIGN KEY |
| `transcript` | TEXT | Interview content | - |

**Business Use**: Investigation analysis, community feedback collection

---

### 7. **facebook_event_checkin** (Social Event Participation)
**Purpose**: Community event attendance tracking

| Column Name | Data Type | Description | Key Type |
|-------------|-----------|-------------|----------|
| `person_id` | INTEGER | Attendee identifier | FOREIGN KEY |
| `event_id` | INTEGER | Event identifier | - |
| `event_name` | VARCHAR | Event description | - |
| `date` | DATE | Event date | - |

**Business Use**: Community engagement analysis, event planning optimization

---

## 🔗 Table Relationships & JOIN Patterns

### Primary Relationships
```sql
person (id) ←→ drivers_license (id) [via license_id]
person (ssn) ←→ income (ssn) [direct match]  
person (id) ←→ get_fit_now_member (person_id) [one-to-many]
get_fit_now_member (id) ←→ get_fit_now_check_in (membership_id) [one-to-many]
person (id) ←→ interview (person_id) [one-to-many]
person (id) ←→ facebook_event_checkin (person_id) [one-to-many]
```

### Common JOIN Patterns Used in Analysis

#### 1. Complete Demographic Profile
```sql
SELECT p.name, p.address_street_name, dl.age, dl.gender, dl.car_make, i.annual_income
FROM person p
LEFT JOIN drivers_license dl ON p.license_id = dl.id
INNER JOIN income i ON p.ssn = i.ssn;
```

#### 2. Fitness Center Analysis
```sql
SELECT p.name, dl.gender, gf.membership_status
FROM get_fit_now_member gf
LEFT JOIN person p ON gf.person_id = p.id
LEFT JOIN drivers_license dl ON p.license_id = dl.id;
```

#### 3. Geographic Population Analysis
```sql
SELECT p.address_street_name, COUNT(*) as population
FROM person p
GROUP BY p.address_street_name;
```

---

## 📊 Data Quality & Constraints

### Known Data Characteristics
- **Missing Values**: Some demographic fields contain NULLs
- **Gender Coding**: Primarily M/F with some unspecified entries
- **Income Range**: Wide distribution requiring income-based analysis
- **Address Format**: Standardized street naming convention
- **Date Ranges**: Membership and event dates span multiple years

### Query Considerations
- **NULL Handling**: Use appropriate JOIN types (LEFT/FULL) for inclusive analysis
- **Data Type Matching**: Ensure proper casting for numeric operations
- **String Standardization**: Account for case sensitivity in text fields
- **Performance**: Index on frequently joined columns (id, person_id, ssn)

---

## 🎯 Business Intelligence Applications

### Strategic Queries Enabled by Schema
1. **Economic Segmentation**: Income + Demographics + Transportation
2. **Geographic Analysis**: Address + Population + Service Distribution  
3. **Health Program Evaluation**: Membership + Demographics + Usage
4. **Community Engagement**: Events + Demographics + Participation
5. **Transportation Planning**: Vehicle + Demographics + Geographic

### Analytical Capabilities
- **Cross-dimensional Analysis**: Multiple demographic factors simultaneously
- **Temporal Trends**: Time-based membership and event analysis
- **Segmentation Studies**: Income, age, gender, and geographic groupings
- **Utilization Metrics**: Facility usage and community program effectiveness

---

*This schema supports comprehensive community analytics for data-driven municipal decision making and strategic planning.*