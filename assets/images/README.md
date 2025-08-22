# 📸 Images Directory

## Overview
Visual assets collection for the GlobalRetail Inc. sales analytics project, including dashboard screenshots, diagrams, and documentation images.

## Image Categories

### 📊 Dashboard Screenshots
High-quality screenshots of Power BI dashboards for documentation and presentation purposes.

#### Current Dashboard Images:
- `sales_dashboard_preview.png` - Sales & Product Performance Dashboard
- `customer_dashboard_preview.png` - Customer Analytics Dashboard  
- `geographic_dashboard_preview.png` - Geographic Insights Dashboard
- `operational_dashboard_preview.png` - Operational Insights Dashboard

#### Screenshot Specifications:
- **Resolution**: 1920x1080 minimum
- **Format**: PNG for crisp quality
- **Content**: Full dashboard view with key metrics visible
- **Naming**: descriptive_dashboard_name.png

### 🏗️ Architecture & Process Diagrams
Technical diagrams showing data flow and system architecture.

#### Recommended Diagrams:
- `data_architecture_diagram.png` - PostgreSQL to Power BI data flow
- `etl_process_flow.png` - Data transformation pipeline
- `database_schema_diagram.png` - PostgreSQL table relationships
- `analytics_workflow.png` - End-to-end analysis process

### 📈 Data Visualizations
Exported charts and graphs from analysis for documentation.

#### Chart Categories:
- `revenue_trend_chart.png` - Monthly revenue performance
- `customer_segmentation_chart.png` - Customer analysis visuals
- `geographic_heatmap.png` - Country-wise sales distribution
- `product_performance_chart.png` - Top products visualization

### 🎯 Project Branding
Visual identity assets for professional presentation.

#### Brand Assets:
- `project_banner.png` - Repository header banner
- `globalretail_logo.png` - Company logo (if applicable)
- `technology_stack_badge.png` - Tech stack visualization
- `stephen_kiri_profile.png` - Professional headshot (optional)

### 📋 Documentation Images
Supporting images for README files and documentation.

#### Documentation Support:
- `folder_structure_diagram.png` - Repository organization
- `setup_process_screenshot.png` - Installation steps
- `power_bi_connection_guide.png` - Database connection tutorial
- `results_summary_infographic.png` - Key findings visual summary

## Image Optimization Guidelines

### File Specifications
- **Maximum Size**: 2MB per image
- **Formats**: 
  - PNG: Screenshots, diagrams, images with text
  - JPG: Photos, complex images
  - SVG: Simple icons, logos (when possible)
- **Compression**: Optimize without quality loss

### Naming Standards
Format: category_description_type.extension
Examples:
✅ dashboard_sales_performance_preview.png
✅ diagram_postgresql_architecture.png
✅ chart_revenue_monthly_trend.png
✅ logo_globalretail_main.png
❌ Screenshot1.png
❌ IMG_001.jpg
❌ dashboard.png

### Quality Standards
- **Clarity**: All text must be readable
- **Consistency**: Similar cropping and styling across dashboard screenshots
- **Professional**: Clean, uncluttered presentation
- **Accessibility**: High contrast, clear visual elements

## How to Add New Images

### Method 1: GitHub Web Interface
1. Navigate to `assets/images/` folder
2. Click **"Add file"** → **"Upload files"**
3. Drag and drop your images
4. Use descriptive commit messages
5. Follow naming conventions

### Method 2: Git Command Line
```bash
# Navigate to repository
cd globalretail-sales-analytics-postgresql-powerbi

# Add images to assets/images/
cp /path/to/your/images/* assets/images/

# Commit changes
git add assets/images/
git commit -m "Add dashboard screenshots and documentation images"
git push origin main
