---
author: "Yungen"
title: "Webpack 以及 node module 的應用"
description: 'Copy-and-Paste was programmed by programmers for programmers actually'
date: "2021-03-05"
tags: ["Webpack", "JavaScript","HTML","CSS","網站架設", "網路"]
categories: "網路相關"
showToc: true
---

## 前言

上一篇文章中，我的project使用了以下語法載入別人寫的module

```html
<script type="module">
  import {CodeJar} from 'https://medv.io/codejar/codejar.js'
</script>
```

但這樣會遇到一些問題

1. 因為是網址的關係，所以無法保證網址內容日後不會被更改
2. 無法在沒有網路的環境下測試
3. 編輯軟體無法顯示自動補全、修正等等

遇到這種問題的時候就需要使用browserify、或本文要介紹的工具webpack

## 功能簡介

簡單來說，webpack可以讓可以讓使用者透過require、module.exports這些原本無法在網頁使用的javascript語法，載入自己或別人的module。以我的專案為例，我有使用一個叫做Codejar的模組，如果我不用webpack的話，就只能用上述的方法import一段url。當然，我們也可以直接將程式碼下載下來，但這樣之後Codejar更新後還要在下載一次。/就好像組裝機器一樣，我們能夠在原本的機器上裝上自己或別人設計的模組。webpack對於初學著來說是一大福音，不需要非常精通網頁設計就年夠用其他人寫好的模組為自己的網站增加許多功能。

## 如何使用

前面有提過require、import這些語法是無法在網頁中使用的，所以我們就必須透過webpack將我們的code「翻譯」成瀏覽器才看的懂的javascript，而翻譯這個動作會產生一個全新的檔案，所以我們就需要更改一下原本的檔案結構

```bash
demo
├── app.js
└── index.html
```

變成

```bash
demo
├── dist
│   └── index.html
└── src
    └── app.js
```

接著在終端機中切換到該目錄下並初始化

```shell
cd demo
npm init
```

接著安裝webpack

```shell
npm install webpack webpack-cli --save-dev
```

接著我們在當前目錄下新增一個webpack的config檔案

```shell
 touch webpack.config.js
```

打開webpack.config.js檔案並加入

```javascript
const path = require('path');

module.exports = {
  entry: './src/app.js', //還未被轉換為瀏覽器看的懂的檔案
  output: {
    filename: 'main.js', //轉換後輸出的檔名
    path: path.resolve(__dirname, 'dist'), //輸出位址（dist資料夾）
  },
};
```

如果這時後在終端機裡輸入

```shell
 npx webpack --config webpack.config.js
```

就會發現在dist資料夾中多了一個叫做main.js檔案，此檔案就是翻譯過的瀏覽器看的懂的檔案，這時候我們就能在dist/index.html中加入這行

```html
<script src="main.js"></script>
```

就行啦！