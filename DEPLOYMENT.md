# Deployment Guide

## Quick Start

After merging this PR to the main branch, follow these steps to make your report accessible online:

### Step 1: Enable GitHub Pages

1. Navigate to your repository on GitHub
2. Click **Settings** (top menu)
3. In the left sidebar, click **Pages**
4. Under **Source**, select **GitHub Actions**

### Step 2: Wait for Deployment

1. Go to the **Actions** tab in your repository
2. You'll see the "Deploy static content to Pages" workflow running
3. Wait for the green checkmark (usually 1-2 minutes)

### Step 3: Access Your Report

Your report is now live at:
```
https://dssalkov-jpg.github.io/problem-tables-report/
```

## Custom Domain Setup (Optional)

### If you want to use your own domain (e.g., reports.yourdomain.com):

#### Step 1: Configure CNAME File

1. Rename `CNAME.example` to `CNAME`
2. Edit the file and replace with your domain:
   ```
   reports.yourdomain.com
   ```
3. Commit and push the change

#### Step 2: Configure DNS

With your domain provider (GoDaddy, Namecheap, etc.):

**For subdomain (recommended):**
```
Type: CNAME
Name: reports (or your chosen subdomain)
Value: dssalkov-jpg.github.io
```

**For apex domain (yourdomain.com):**
```
Type: A
Name: @ (or leave blank)
Value: 185.199.108.153
Value: 185.199.109.153
Value: 185.199.110.153
Value: 185.199.111.153
```

#### Step 3: Enable in GitHub

1. Go to **Settings** → **Pages**
2. Under **Custom domain**, enter your domain
3. Wait for DNS check (can take up to 48 hours)
4. Enable **Enforce HTTPS** (recommended)

## Updating the Report

Any changes pushed to the main branch will automatically redeploy:

1. Edit `report.html` or `index.html`
2. Commit and push to main
3. GitHub Actions automatically redeploys
4. Changes appear in 1-2 minutes

## Troubleshooting

### Report not showing up?
- Check that GitHub Pages is enabled in Settings → Pages
- Verify the workflow completed successfully in Actions tab
- Try accessing with `/index.html` at the end of URL

### Custom domain not working?
- DNS changes can take up to 48 hours
- Verify CNAME record points to `username.github.io`
- Check DNS propagation: https://dnschecker.org

### Getting 404 errors?
- Ensure you're using the correct repository name in URL
- Main branch should contain index.html
- Check Actions tab for deployment errors

## Local Testing

Before pushing changes, test locally:

```bash
# Start a local web server
python3 -m http.server 8080

# Open in browser
# http://localhost:8080
```

## Support

For more information:
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Custom Domain Setup](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
