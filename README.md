# problem-tables-report
тест отчета проблемные элементы на столах 

## 📊 View the Report

The problem tables report is available online at:
- **GitHub Pages**: `https://dssalkov-jpg.github.io/problem-tables-report/`

Access either `index.html` or `report.html` to view the complete report with problem tables data.

## 🚀 Deployment

### GitHub Pages (Automatic)

The report is automatically deployed to GitHub Pages when changes are pushed to the `main` branch.

1. Ensure GitHub Pages is enabled in your repository settings:
   - Go to **Settings** → **Pages**
   - Under **Source**, select **GitHub Actions**
   
2. The deployment workflow will automatically run when you push to `main` branch

3. Access your report at: `https://<your-username>.github.io/<repository-name>/`

### Custom Domain Setup

To use your own domain:

1. Create a `CNAME` file in the repository root with your domain name:
   ```
   your-domain.com
   ```

2. Configure DNS settings with your domain provider:
   - Add a CNAME record pointing to `<your-username>.github.io`
   - Or add A records pointing to GitHub Pages IPs

3. Enable custom domain in repository Settings → Pages

## 📁 Files

- `index.html` - Main entry point for the report (same as report.html)
- `report.html` - Problem tables report with detailed data
- `.github/workflows/pages.yml` - GitHub Pages deployment workflow

## 🔧 Local Development

To view the report locally:

```bash
# Option 1: Using Python's built-in server
python3 -m http.server 8080

# Option 2: Using Node.js http-server
npx http-server

# Then open http://localhost:8080 in your browser
```

## 📝 Report Content

The report includes:
- **Summary Dashboard**: Critical, Warning, and Normal issue counts
- **Detailed Table**: All problem items with ID, location, description, status, and timestamp
- **Color-coded Status**: Red (Critical), Orange (Warning), Green (Normal)
