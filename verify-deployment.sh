#!/bin/bash

# Скрипт для проверки готовности к развертыванию
# Script to verify deployment readiness

echo "🔍 Проверка готовности к развертыванию GitHub Pages"
echo "=================================================="
echo ""

# Проверка наличия необходимых файлов
echo "📄 Проверка файлов..."

files=("index.html" "report2.html" "report.html" ".github/workflows/deploy.yml")
all_files_ok=true

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file - НЕ НАЙДЕН!"
        all_files_ok=false
    fi
done

echo ""

# Проверка синтаксиса YAML
echo "🔧 Проверка синтаксиса workflow..."
if command -v python3 &> /dev/null; then
    if python3 -c "import yaml; yaml.safe_load(open('.github/workflows/deploy.yml'))" 2>/dev/null; then
        echo "  ✅ Синтаксис YAML корректен"
    else
        echo "  ❌ Ошибка синтаксиса в deploy.yml"
        all_files_ok=false
    fi
else
    echo "  ⚠️  Python3 не найден, пропускаем проверку YAML"
fi

echo ""

# Проверка структуры HTML
echo "📝 Проверка HTML файлов..."
for html_file in index.html report.html report2.html; do
    if grep -q "<!DOCTYPE html>" "$html_file" 2>/dev/null || grep -q "<!doctype html>" "$html_file" 2>/dev/null; then
        echo "  ✅ $html_file имеет правильный DOCTYPE"
    else
        echo "  ⚠️  $html_file может не иметь правильного DOCTYPE"
    fi
done

echo ""

# Проверка Git статуса
echo "📦 Проверка Git состояния..."
if [ -z "$(git status --porcelain)" ]; then
    echo "  ✅ Нет незакоммиченных изменений"
else
    echo "  ⚠️  Есть незакоммиченные изменения:"
    git status --short
fi

echo ""

# Проверка текущей ветки
current_branch=$(git branch --show-current)
echo "🌿 Текущая ветка: $current_branch"

if [[ "$current_branch" == "main" ]] || [[ "$current_branch" == "master" ]]; then
    echo "  ✅ Вы на основной ветке - готовы к развертыванию!"
else
    echo "  ℹ️  Для активации нужно смержить в main/master"
fi

echo ""

# Итоговый статус
echo "=================================================="
if [ "$all_files_ok" = true ]; then
    echo "✅ ВСЕ ПРОВЕРКИ ПРОЙДЕНЫ!"
    echo ""
    echo "📋 Следующие шаги:"
    echo "1. Если вы на feature-ветке, создайте PR и смержите в main/master"
    echo "2. Включите GitHub Pages в Settings → Pages → Source: GitHub Actions"
    echo "3. Запустите workflow в Actions → Deploy to GitHub Pages → Run workflow"
    echo ""
    echo "📖 Подробное руководство: см. DEPLOYMENT.md"
else
    echo "❌ ОБНАРУЖЕНЫ ПРОБЛЕМЫ - см. сообщения выше"
fi
echo "=================================================="
