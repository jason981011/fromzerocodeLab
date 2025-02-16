#!/bin/bash

# 主題的下載 URL
THEME_URL="https://example.com/path/to/soho-theme.zip"

# 保存下載主題的目錄
DEST_DIR="$HOME/Downloads"

# 下載主題的文件名
THEME_FILE="soho-theme.zip"

# 下載文件的完整路徑
DEST_PATH="$DEST_DIR/$THEME_FILE"

# GitHub 儲存庫詳細資訊
GITHUB_REPO="https://github.com/jason981011/fromzerocodeLab.git"
REPO_DIR="$HOME/fromzerocodeLab"

# 儲存庫中的主題目錄
THEME_DIR="$REPO_DIR/theme"

# 如果儲存庫不存在，則克隆 GitHub 儲存庫
if [ ! -d "$REPO_DIR" ]; then
  echo "克隆 GitHub 儲存庫..."
  git clone "$GITHUB_REPO" "$REPO_DIR"
fi

# 創建主題目錄（如果不存在）
mkdir -p "$THEME_DIR"

# 下載主題
echo "下載 Soho 主題自 $THEME_URL..."
curl -L -o "$DEST_PATH" "$THEME_URL"

# 檢查下載是否成功
if [ $? -eq 0 ]; then
  echo "下載完成。主題保存在 $DEST_PATH。"
else
  echo "下載主題失敗。"
  exit 1
fi

# 將下載的主題複製到主題目錄
cp "$DEST_PATH" "$THEME_DIR/"

# 切換到儲存庫目錄
cd "$REPO_DIR"

# 提交並推送更改
git add "$THEME_DIR/$THEME_FILE"
git commit -m "添加下載的 Soho 主題"
git push origin main
