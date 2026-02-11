# problem-tables-report
тест отчета проблемные элементы на столах 

## 🚀 Развертывание (Deployment)

Этот репозиторий настроен для автоматического развертывания на GitHub Pages.

> **📖 [Полное руководство по активации →](DEPLOYMENT.md)**  
> Пошаговая инструкция для первого запуска и настройки GitHub Pages.

### Просмотр отчетов

После включения GitHub Pages, отчеты будут доступны по адресу:
- Главная страница: `https://<USERNAME>.github.io/problem-tables-report/`
- Прототип отчета: `https://<USERNAME>.github.io/problem-tables-report/report2.html`
- Базовый отчет: `https://<USERNAME>.github.io/problem-tables-report/report.html`

Замените `<USERNAME>` на имя владельца репозитория.

### Настройка GitHub Pages

Чтобы включить развертывание:

1. Перейдите в Settings вашего репозитория
2. В боковом меню выберите "Pages"
3. В разделе "Build and deployment":
   - Source: выберите "GitHub Actions"
4. Сохраните настройки

После этого при каждом push в ветку `main` или `master` сайт будет автоматически обновляться.

### Ручное развертывание

Вы также можете запустить развертывание вручную:
1. Перейдите во вкладку "Actions"
2. Выберите workflow "Deploy to GitHub Pages"
3. Нажмите "Run workflow"
